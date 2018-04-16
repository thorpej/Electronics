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

#ifndef sn74141_h_included
#define	sn74141_h_included

#include <sys/types.h>
#include <stdbool.h>

#include "shift_register.h"

/*
 * The SN74141 decodes BCD digits 0..9.  Any other 4-bit value
 * results in no output pins being driven, effectively rendering
 * a blank digit.
 */
#define	SN74141_DIGIT_BLANK	10

struct sn74141_context;
typedef struct sn74141_context *sn74141_t;

int	sn74141_alloc(shift_register_t sreg, int pinbase, sn74141_t *bcdp);
void	sn74141_free(sn74141_t bcd);

int	sn74141_set_digit(sn74141_t bcd, uint8_t digit);

#endif /* sn74141_h_included */
