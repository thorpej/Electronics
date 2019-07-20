/*
Copyright (c) 2019 Jason R. Thorpe

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

/*
 * General purpose Nixie tube display driver.  We build up an abstract
 * "controller" accessed by one or more (chained) shift registers with
 * a 3-wire interface.
 *
 * The display driver presents a "cell buffer" that allows the client to
 * update the individual cells, and then atomically update the display.
 * The cell buffer is addressed left-to-right, so with traditional Arabic
 * numbers, the most-significant digit is at cell index 0.
 *
 * Currently only Nixie tubes that display digits ("0" - "9") are supported,
 * and we assume that they are connected to a BCD decoder, e.g. the sn74141.
 * Other cell types may be added in the future (e.g. symbol cells, or even
 * VFD 7-segment cells), and the API is structured accordingly.
 */

#include <sys/types.h>
#include <errno.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

#include "nixie_display.h"
#include "shift_register.h"
#include "sn74141.h"

/*****************************************************************************
 * INTERNAL FUNCTIONS AND DATA STRUCTURES
 *****************************************************************************/

struct nixie_cell;
typedef struct nixie_cell *nixie_cell_t;

struct nixie_cell_funcs {
	int	(*cell_init)(nixie_display_t nixie, nixie_cell_t cell);
	int	(*cell_update)(nixie_display_t nixie, nixie_cell_t cell);
	int	(*cell_filter)(nixie_display_t nixie, nixie_cell_t cell,
			       int *valuep);
	void	(*cell_fini)(nixie_display_t nixie, nixie_cell_t cell);
};

typedef enum {
	NIXIE_DISPLAY_STATE_LARVAL	= 0,
	NIXIE_DISPLAY_STATE_RUNNING	= 1,
	NIXIE_DISPLAY_STATE_STOPPED	= 2,
	NIXIE_DISPLAY_STATE_DEAD	= 3,
} nixie_display_state_t;

struct nixie_cell {
	const struct nixie_cell_funcs *	c_funcs;
	unsigned int			c_cell_num;
	int				c_value;
	union {
		sn74141_t		c_bcd;
	};
};

struct nixie_display_context {
	char *		n_gpio;
	int		n_clock_pin;
	int		n_data_pin;
	int		n_latch_pin;
	shift_register_t n_shift_register;

	nixie_display_state_t n_state;

	unsigned int	n_cell_count;
	struct nixie_cell *n_cells;
};

static nixie_cell_t
nixie_display_lookup_cell(nixie_display_t nixie, unsigned int cell_num)
{

	if (nixie->n_cell_count == 0 || cell_num >= nixie->n_cell_count)
		return NULL;
	
	return &nixie->n_cells[cell_num];
}

static int
nixie_display_cell_init(nixie_display_t nixie, unsigned int cell_num)
{
	nixie_cell_t cell = nixie_display_lookup_cell(nixie, cell_num);

	if (cell == NULL)
		return EINVAL;

	cell->c_value = NIXIE_DISPLAY_CELL_BLANK;
	cell->c_cell_num = cell_num;

	if (cell->c_funcs == NULL)
		return EPIPE;

	if (nixie->n_shift_register == NULL)
		return EINVAL;

	return (*cell->c_funcs->cell_init)(nixie, cell);
}

static void
nixie_display_cell_fini(nixie_display_t nixie, unsigned int cell_num)
{
	nixie_cell_t cell = nixie_display_lookup_cell(nixie, cell_num);

	if (cell == NULL || cell->c_funcs == NULL)
		return;

	(*cell->c_funcs->cell_fini)(nixie, cell);
}

/*****************************************************************************
 * INTERNAL FUNCTIONS FOR BCD NUMERIC CELLS
 *****************************************************************************/

static int
nixie_cell_numeric_init(nixie_display_t nixie, struct nixie_cell *cell)
{

	/*
	 * Index 0 is the most-significant digit, which means
	 * it's at the end of the shift register chain.
	 */
	int pinbase = (nixie->n_cell_count - 1 - cell->c_cell_num) * 4;
	return sn74141_alloc(nixie->n_shift_register, pinbase, &cell->c_bcd);
}

static int
nixie_cell_numeric_update(nixie_display_t nixie, struct nixie_cell *cell)
{
	uint8_t digit = cell->c_value ==
	    NIXIE_DISPLAY_CELL_BLANK ? SN74141_DIGIT_BLANK
				     : cell->c_value;
	return sn74141_set_digit(cell->c_bcd, digit);
}

static int
nixie_cell_numeric_filter(nixie_display_t nixie, struct nixie_cell *cell,
			  int *valuep)
{

	/* Allow ASCII '0'..'9'. */
	if (*valuep >= '0' && *valuep <= '9') {
		*valuep -= '0';
		return 0;
	}

	if (*valuep < 0 || *valuep > 9)
		return EINVAL;

	return 0;
}

static void
nixie_cell_numeric_fini(nixie_display_t nixie, struct nixie_cell *cell)
{

	if (cell->c_bcd != NULL) {
		sn74141_free(cell->c_bcd);
		cell->c_bcd = NULL;
	}
}

static const struct nixie_cell_funcs nixie_cell_funcs_numeric = {
	.cell_init = nixie_cell_numeric_init,
	.cell_update = nixie_cell_numeric_update,
	.cell_filter = nixie_cell_numeric_filter,
	.cell_fini = nixie_cell_numeric_fini,
};

/*****************************************************************************
 * PUBLIC FUNCTIONS
 *****************************************************************************/

/*
 * nixie_display_alloc --
 *	Allocates driver context.
 */
int
nixie_display_alloc(nixie_display_t *nixiep)
{
	nixie_display_t nixie = NULL;
	int error = 0;

	if ((nixie = calloc(1, sizeof(*nixie))) == NULL) {
		error = ENOMEM;
		goto out;
	}

	nixie->n_clock_pin = -1;
	nixie->n_data_pin = -1;
	nixie->n_latch_pin = -1;

 out:
	if (error == 0)
		*nixiep = nixie;
	else if (nixie != NULL)
		nixie_display_free(nixie);

	return (error);
}

/*
 * nixie_display_free --
 *	Frees driver context and any resources associated with it.
 */
void
nixie_display_free(nixie_display_t nixie)
{
	unsigned int cell_num;

	if (nixie->n_cells != NULL) {
		for (cell_num = 0; cell_num < nixie->n_cell_count; cell_num++)
			nixie_display_cell_fini(nixie, cell_num);
		free(nixie->n_cells);
	}
	if (nixie->n_gpio != NULL)
		free(nixie->n_gpio);
	if (nixie->n_shift_register != NULL)
		shift_register_free(nixie->n_shift_register);
	free(nixie);
}

/*
 * nixie_display_set_gpio --
 *	Sets the GPIO interface used to communicate with the shift register.
 */
int
nixie_display_set_gpio(nixie_display_t nixie, const char *gpio)
{
	int error = 0;

	if (nixie->n_state != NIXIE_DISPLAY_STATE_LARVAL)
		return (EBUSY);

	if (nixie->n_gpio != NULL)
		free(nixie->n_gpio);
	nixie->n_gpio = strdup(gpio);
	if (nixie->n_gpio == NULL)
		error = ENOMEM;

	return error;
}

/*
 * nixie_display_set_clock_pin --
 *	Set the GPIO pin for the shift register clock signal.
 */
int
nixie_display_set_clock_pin(nixie_display_t nixie, int clock_pin)
{

	if (nixie->n_state != NIXIE_DISPLAY_STATE_LARVAL)
		return EBUSY;

	if (clock_pin < 0)
		return EINVAL;

	nixie->n_clock_pin = clock_pin;

	return 0;
}

/*
 * nixie_display_set_data_pin --
 *	Set the GPIO pin for the shift register data signal.
 */
int
nixie_display_set_data_pin(nixie_display_t nixie, int data_pin)
{

	if (nixie->n_state != NIXIE_DISPLAY_STATE_LARVAL)
		return EBUSY;

	if (data_pin < 0)
		return EINVAL;

	nixie->n_data_pin = data_pin;

	return 0;
}

/*
 * nixie_display_set_latch_pin --
 *	Set the GPIO pin for the shift register latch signal.
 */
int
nixie_display_set_latch_pin(nixie_display_t nixie, int latch_pin)
{

	if (nixie->n_state != NIXIE_DISPLAY_STATE_LARVAL)
		return EBUSY;

	if (latch_pin < 0)
		return EINVAL;

	nixie->n_latch_pin = latch_pin;

	return 0;
}

/*
 * nixie_display_set_cell_count --
 *	Set the cell count for the Nixie display.
 */
int
nixie_display_set_cell_count(nixie_display_t nixie, unsigned int num_cells)
{
	unsigned int cell_num;

	if (nixie->n_state != NIXIE_DISPLAY_STATE_LARVAL)
		return EBUSY;

	if (nixie->n_cells != NULL)
		free(nixie->n_cells);
	nixie->n_cells = calloc(1, sizeof(*nixie->n_cells) * num_cells);
	if (nixie->n_cells == NULL)
		return ENOMEM;
	nixie->n_cell_count = num_cells;

	for (cell_num = 0; cell_num <= num_cells; cell_num++) {
		nixie_cell_t cell = nixie_display_lookup_cell(nixie, cell_num);
		cell->c_value = NIXIE_DISPLAY_CELL_BLANK;
	}

	return (0);
}

/*
 * nixie_display_set_cell_type --
 *	Set the type of the specified cell (or all of the cells).
 */
int
nixie_display_set_cell_type(nixie_display_t nixie, unsigned int cell_num,
			    nixie_cell_type_t cell_type)
{
	const struct nixie_cell_funcs *cell_funcs;
	unsigned int first_cell, num_cells;

	switch (cell_type) {
	case NIXIE_CELL_TYPE_NUMERIC:
		cell_funcs = &nixie_cell_funcs_numeric;
		break;
	
	default:
		return ENOTSUP;
	}

	if (cell_num == NIXIE_DISPLAY_ALL_CELLS) {
		first_cell = 0;
		num_cells = nixie->n_cell_count;
	} else {
		first_cell = cell_num;
		num_cells = 1;
	}

	for (cell_num = first_cell; num_cells != 0; cell_num++, num_cells--) {
		nixie_cell_t cell = nixie_display_lookup_cell(nixie, cell_num);
		cell->c_funcs = cell_funcs;
	}

	return 0;
}

/*
 * nixie_display_start --
 *	Start the Nixie display.
 */
int
nixie_display_start(nixie_display_t nixie)
{
	int error;

	switch (nixie->n_state) {
	case NIXIE_DISPLAY_STATE_LARVAL:
		break;
	
	case NIXIE_DISPLAY_STATE_RUNNING:
		return 0;

	case NIXIE_DISPLAY_STATE_STOPPED:
		nixie->n_state = NIXIE_DISPLAY_STATE_RUNNING;
		return 0;
	
	default:
		return EPIPE;
	}

	if (nixie->n_gpio == NULL ||
	    nixie->n_clock_pin == -1 ||
	    nixie->n_data_pin == -1 ||
	    nixie->n_latch_pin == -1 ||
	    nixie->n_cell_count == 0) {
		error = EINVAL;
		goto out;
	}

	int nbits = (int)(nixie->n_cell_count * 4);
	
	/* round up to 8 bits (basic shift register unit) */
	nbits = (nbits + 7) & ~7U;
	if (nbits <= 0) {
		error = EINVAL;
		goto out;
	}

	error = shift_register_alloc(nixie->n_gpio, nbits,
				     nixie->n_clock_pin,
				     nixie->n_data_pin,
				     nixie->n_latch_pin,
				     &nixie->n_shift_register);
	if (error)
		goto out;

	unsigned int cell_num;
	for (cell_num = 0; cell_num < nixie->n_cell_count; cell_num++) {
		error = nixie_display_cell_init(nixie, cell_num);
		if (error)
			goto out;
	}

 out:
	if (error) {
		/* This display is now dead. */
		nixie->n_state = NIXIE_DISPLAY_STATE_DEAD;
	} else {
		nixie->n_state = NIXIE_DISPLAY_STATE_RUNNING;
	}
	return error;
}

/*
 * nixie_display_update --
 * 	Update the Nixie display.
 */
int
nixie_display_update(nixie_display_t nixie)
{
	unsigned int cell_num;
	int error;

	if (nixie->n_state != NIXIE_DISPLAY_STATE_RUNNING)
		return EPIPE;

	/*
	 * Hold an extra transaction so that the display update is
	 * atomic.
	 */
	error = shift_register_transaction_begin(nixie->n_shift_register);
	if (error)
		return error;

	for (cell_num = 0; cell_num < nixie->n_cell_count; cell_num++) {
		nixie_cell_t cell = nixie_display_lookup_cell(nixie, cell_num);
		error = (*cell->c_funcs->cell_update)(nixie, cell);
		if (error)
			break;
	}

	int error2 = shift_register_transaction_end(nixie->n_shift_register);
	return error == 0 ? error2 : error;
}

/*
 * nixie_display_stop --
 *	Stop the Nixie display.
 */
int
nixie_display_stop(nixie_display_t nixie)
{

	switch (nixie->n_state) {
	case NIXIE_DISPLAY_STATE_RUNNING:
		nixie->n_state = NIXIE_DISPLAY_STATE_STOPPED;
		break;

	case NIXIE_DISPLAY_STATE_STOPPED:
		break;
	
	default:
		return EPIPE;
	}

	return 0;
}

/*
 * nixie_display_set_cell --
 *	Set the contents of the specified Nixie display cell.
 */
int
nixie_display_set_cell(nixie_display_t nixie, unsigned int cell_num, int value)
{
	int error;

	if (nixie->n_state != NIXIE_DISPLAY_STATE_RUNNING)
		return EPIPE;

	nixie_cell_t cell = nixie_display_lookup_cell(nixie, cell_num);
	if (cell == NULL)
		return EINVAL;

	if (value == NIXIE_DISPLAY_CELL_BLANK)
		goto set_cell;

	/* Type-specific cell value filtering. */
	error = (*cell->c_funcs->cell_filter)(nixie, cell, &value);
	if (error)
		return error;

 set_cell:
	cell->c_value = value;
	return 0;
}

/*
 * nixie_display_set_string --
 *	Set the contents of the Nixie display to the specified string.
 * ==>	The string will be left-justified on the display.
 *
 * ==>	If the string is longer than the number of display cells, the
 *	string will be truncated.
 *
 * ==>	If the string is shorter than the number of display cells, the
 *	string will be padded with blank cells.
 *
 * ==>	If the string specifies an invalid cell value, the cell will
 *	be set to blank.
 *
 * ==>	The only error reported will be the the error that occurs when
 *	committing the update to the display.
 */
int
nixie_display_set_string(nixie_display_t nixie, const char *str)
{
	size_t len = strlen(str);
	unsigned int i;
	int value;

	if (nixie->n_state != NIXIE_DISPLAY_STATE_RUNNING)
		return EPIPE;

	for (i = 0; i < nixie->n_cell_count; i++) {
		if (i < len)
			value = (unsigned char)str[i];
		else
			value = NIXIE_DISPLAY_CELL_BLANK;
		if (nixie_display_set_cell(nixie, i, value)) {
			(void)nixie_display_set_cell(nixie, i,
						     NIXIE_DISPLAY_CELL_BLANK);
		}
	}
	return nixie_display_update(nixie);
}
