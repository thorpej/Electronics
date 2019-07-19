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

#ifndef nixie_display_h_included
#define	nixie_display_h_included

#include <sys/types.h>
#include <stdbool.h>

typedef enum {
	NIXIE_CELL_TYPE_INVALID		= 0,
	NIXIE_CELL_TYPE_NUMERIC		= 1,
} nixie_cell_type_t;

#define	NIXIE_DISPLAY_CELL_BLANK	' '
#define	NIXIE_DISPLAY_ALL_CELLS		((unsigned int)(-1))

struct nixie_display_context;
typedef struct nixie_display_context *nixie_display_t;

int	nixie_display_alloc(nixie_display_t *nixiep);
void	nixie_display_free(nixie_display_t nixie);

int	nixie_display_set_gpio(nixie_display_t nixie, const char *gpio);
int	nixie_display_set_clock_pin(nixie_display_t nixie, int clock_pin);
int	nixie_display_set_data_pin(nixie_display_t nixie, int data_pin);
int	nixie_display_set_latch_pin(nixie_display_t nixie, int latch_pin);
int	nixie_display_set_cell_count(nixie_display_t nixie,
				     unsigned int num_cells);
int	nixie_display_set_cell_type(nixie_display_t nixie,
				    unsigned int cell_num,
				    nixie_cell_type_t cell_type);

int	nixie_display_start(nixie_display_t nixie);
int	nixie_display_update(nixie_display_t nixie);
int	nixie_display_stop(nixie_display_t nixie);

int	nixie_display_set_cell(nixie_display_t nixie, unsigned int cell,
			       int value);
int	nixie_display_set_string(nixie_display_t nixie, const char *str);

#endif /* nixie_display_h_included */
