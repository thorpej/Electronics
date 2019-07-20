/*
Copyright (c) 2018, 2019 Jason R. Thorpe

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
 * Driver for general-purpose 8-bit serial-to-parallel output shift registers,
 * such as the 74HC595 or the TPIC6B595.
 */

#include <sys/types.h>
#include <sys/ioctl.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

#include <sys/gpio.h>

#include "shift_register.h"

/*****************************************************************************
 * INTERNAL FUNCTIONS AND DATA STRUCTURES
 *****************************************************************************/

#define	PIN_CLOCK	0
#define	PIN_DATA	1
#define	PIN_LATCH	2
#define	NPINS		3

struct shift_register_context {
	char *		sreg_gpio_name;
	int		sreg_gpio_fd;

	unsigned int	sreg_transaction_open;

	int		sreg_pins[NPINS];

	int		sreg_nbits;
	uint8_t *	sreg_bytes;
};

static int
sreg_gpio_setup(shift_register_t sreg)
{

	/*
	 * NetBSD requires that GPIO pin setup happen at
	 * kern.securelevel = 0, so we're relying on
	 * /etc/gpio.conf having already done our job
	 * of making the clock, data, and latch pins
	 * generic outputs.
	 */

	return (0);
}

static int
sreg_gpio_write(shift_register_t sreg, int pin, bool val)
{
	struct gpio_req gp;
	int error = 0;

	gp.gp_name[0] = '\0';
	gp.gp_pin = sreg->sreg_pins[pin];
	gp.gp_value = val ? GPIO_PIN_HIGH : GPIO_PIN_LOW;

	if (ioctl(sreg->sreg_gpio_fd, GPIOWRITE, &gp) == -1)
		error = errno;
	
	return (error);
}

#define	WRITE(p, v)							\
	do {								\
		if ((error = sreg_gpio_write(sreg, (p), (v))) != 0)	\
			goto out;					\
	} while (/*CONSTCOND*/0)

static int
sreg_shift_out_byte(shift_register_t sreg, uint8_t byte)
{
	int error = 0;
	uint8_t bit;

	for (bit = 0x80; bit != 0; bit >>= 1) {
		WRITE(PIN_DATA, (byte & bit) ? true : false);
		WRITE(PIN_CLOCK, true);
		WRITE(PIN_CLOCK, false);
	}

 out:
	return (error);
}

static int
sreg_send_data(shift_register_t sreg)
{
	int i, count, error;

	/* Hold off if there are still nested transactions. */
	if (sreg->sreg_transaction_open != 1)
		return (0);

	WRITE(PIN_CLOCK, false);
	WRITE(PIN_DATA, false);
	WRITE(PIN_LATCH, false);

	count = sreg->sreg_nbits >> 3;

	/* Shift out the MSb of the MSB first. */
	for (i = count; i > 0; i--) {
		error = sreg_shift_out_byte(sreg, sreg->sreg_bytes[i-1]);
		if (error)
			goto out;
	}

	/* Clock is off. */

	WRITE(PIN_DATA, false);
	WRITE(PIN_LATCH, true);
	WRITE(PIN_LATCH, false);

 out:
	return (error);
}

#undef WRITE

/*****************************************************************************
 * PUBLIC FUNCTIONS
 *****************************************************************************/

/*
 * shift_register_alloc --
 *	Allocates driver context.
 */
int
shift_register_alloc(const char *gpio, int nbits,
		     int clock_pin, int data_pin, int latch_pin,
		     shift_register_t *sregp)
{
	shift_register_t sreg = NULL;
	int error = 0;
	size_t gpio_namelen;
	char *gpio_devpath = NULL;
	size_t sreg_len;

	/* nbits must be evenly divisble by 8 */
	if (nbits <= 0 || (nbits & 7) != 0) {
		error = EINVAL;
		goto out;
	}

	/* Must have valid gpio pin numbers. */
	if (clock_pin < 0 || data_pin < 0 || latch_pin < 0) {
		error = EINVAL;
		goto out;
	}

	/* Allocate context and space for the data buffer. */
	sreg_len = sizeof(*sreg) + (nbits >> 3);
	if ((sreg = malloc(sreg_len)) == NULL) {
		errno = ENOMEM;
		goto out;
	}
	memset(sreg, 0, sreg_len);
	sreg->sreg_gpio_fd = -1;
	sreg->sreg_nbits = nbits;

	sreg->sreg_pins[PIN_CLOCK] = clock_pin;
	sreg->sreg_pins[PIN_DATA] = data_pin;
	sreg->sreg_pins[PIN_LATCH] = latch_pin;

	gpio_namelen = strlen(gpio);
	if (gpio_namelen > 5 && memcmp(gpio, "/dev/", 5) == 0)
		gpio += 5;
	sreg->sreg_gpio_name = strdup(gpio);
	if (sreg->sreg_gpio_name == NULL) {
		error = ENOMEM;
		goto out;
	}

	asprintf(&gpio_devpath, "/dev/%s", sreg->sreg_gpio_name);
	if (gpio_devpath == NULL) {
		error = ENOMEM;
		goto out;
	}
	sreg->sreg_gpio_fd = open(gpio_devpath, O_RDWR);
	if (sreg->sreg_gpio_fd == -1) {
		error = errno;
		goto out;
	}

	/* Perform any GPIO setup required. */
	if ((error = sreg_gpio_setup(sreg)) != 0)
		goto out;

	/*
	 * Verify we can access each pin by just driving them
	 * all low.
	 */
	if ((error = sreg_gpio_write(sreg, PIN_CLOCK, false)) != 0 ||
	    (error = sreg_gpio_write(sreg, PIN_DATA, false)) != 0 ||
	    (error = sreg_gpio_write(sreg, PIN_LATCH, false)) != 0)
		goto out;

	/* Finally, point at the bit vector. */
	sreg->sreg_bytes = ((uint8_t *)sreg) + sizeof(*sreg);

 out:
	if (error == 0)
		*sregp = sreg;
	else if (sreg != NULL)
		shift_register_free(sreg);

	if (gpio_devpath != NULL)
		free(gpio_devpath);

	return (error);
}

/*
 * shift_register_free --
 *	Frees driver context and any resources associated with it.
 */
void
shift_register_free(shift_register_t sreg)
{

	if (sreg->sreg_gpio_fd != -1)
		(void)close(sreg->sreg_gpio_fd);
	if (sreg->sreg_gpio_name != NULL)
		free(sreg->sreg_gpio_name);
	free(sreg);
}

/*
 * shift_register_transaction_begin --
 *	Begin bulk-write transaction.
 */
int
shift_register_transaction_begin(shift_register_t sreg)
{
	int error = 0;

	sreg->sreg_transaction_open++;
	if (sreg->sreg_transaction_open == 0) {
		error = ERANGE;
		sreg->sreg_transaction_open--;
	}
	return (error);
}

/*
 * shift_register_transaction_end --
 *	End a bulk-write transaction.  If this is the last
 *	of a nested set, send the buffered data to the register.
 */
int
shift_register_transaction_end(shift_register_t sreg)
{
	int error;

	if (sreg->sreg_transaction_open == 0)
		error = ERANGE;
	else {
		if (sreg->sreg_transaction_open == 1)
			error = sreg_send_data(sreg);
		else
			error = 0;
		sreg->sreg_transaction_open--;
	}
	return (error);
}

/*
 * shift_register_set_bit --
 *	Set a bit in the buffer, sending it out to the register
 *	if this completes a transaction.
 */
int
shift_register_set_bit(shift_register_t sreg, int bit, bool val)
 {
 	int error, bytepos, bitpos;

	if (bit < 0 || bit >= sreg->sreg_nbits) {
		error = EINVAL;
		goto out;
	}

	if ((error = shift_register_transaction_begin(sreg)) != 0)
		goto out;

	bytepos = bit >> 3;
	bitpos = bit & 7;

	if (val)
		sreg->sreg_bytes[bytepos] |= 1U << bitpos;
	else
		sreg->sreg_bytes[bytepos] &= ~(1U << bitpos);

	error = shift_register_transaction_end(sreg);

 out:
	return (error);
 }

 /*
  * shift_register_set_byte --
  *	Set the byte at the specified index, sending it out to the
  *	register if it completes the transaction.
  */
 int
 shift_register_set_byte(shift_register_t sreg, int byte, uint8_t val)
 {
 	int error;

	if (byte < 0 || (byte * 8) >= sreg->sreg_nbits) {
		error = EINVAL;
		goto out;
	}

	if ((error = shift_register_transaction_begin(sreg)) != 0)
		goto out;

	sreg->sreg_bytes[byte] = val;

	error = shift_register_transaction_end(sreg);

 out:
	return (error);
 }
