/*
Copyright (c) 2018 Jason R. Thorpe

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

#ifndef shift_register_h_included
#define	shift_register_h_included

#include <sys/types.h>
#include <stdbool.h>

struct shift_register_context;
typedef struct shift_register_context *shift_register_t;

int	shift_register_alloc(const char *gpio, int nbits,
			     int clock_pin, int data_pin, int latch_pin,
			     shift_register_t *sreg);
void	shift_register_free(shift_register_t sreg);

int	shift_register_transaction_begin(shift_register_t sreg);
int	shift_register_transaction_end(shift_register_t sreg);

int	shift_register_set_bit(shift_register_t sreg, int bit, bool val);
int	shift_register_set_byte(shift_register_t sreg, int byte, uint8_t val);

#endif /* shift_register_h_included */
