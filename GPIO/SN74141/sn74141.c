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

/*
 * Driver for the SN74141 (and the Russian equivalent) using a shift
 * register to drive the inputs.
 */

#include <sys/types.h>
#include <errno.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>

#include "sn74141.h"

/*****************************************************************************
 * INTERNAL FUNCTIONS AND DATA STRUCTURES
 *****************************************************************************/

struct sn74141_context {
	shift_register_t bcd_sreg;
	int		 bcd_pinbase;
	uint8_t		 bcd_val;
};

/*****************************************************************************
 * PUBLIC FUNCTIONS
 *****************************************************************************/

/*
 * sn74141_alloc --
 *	Allocates driver context.
 */
int
sn74141_alloc(shift_register_t sreg, int pinbase, sn74141_t *bcdp)
{
	sn74141_t bcd = NULL;
	int error = 0;

	if (pinbase < 0) {
		error = EINVAL;
		goto out;
	}

	/* Allocate context */
	if ((bcd = malloc(sizeof(*bcd))) == NULL) {
		errno = ENOMEM;
		goto out;
	}
	bcd->bcd_sreg = sreg;
	bcd->bcd_pinbase = pinbase;
	bcd->bcd_val = 0xff;	/* invalid value */

 out:
	if (error == 0)
		*bcdp = bcd;
	else if (bcd != NULL)
		sn74141_free(bcd);

	return (error);
}

/*
 * sn74141_free --
 *	Frees driver context and any resources associated with it.
 */
void
sn74141_free(sn74141_t bcd)
{

	free(bcd);
}

/*
 * sn74141_set_digit --
 *	Set the indicated BCD digit.
 */
int
sn74141_set_digit(sn74141_t bcd, uint8_t digit)
{
	int error = 0;
	int i;

	if (digit > 0xf) {
		error = EINVAL;
		goto out;
	}

	if (digit == bcd->bcd_val)
		goto out;

	if ((error = shift_register_transaction_begin(bcd->bcd_sreg)) != 0)
		goto out;

	for (i = 0; i <= 3; i++) {
		(void) shift_register_set_bit(bcd->bcd_sreg,
					      bcd->bcd_pinbase + i,
					      (digit & (1 << i)) ? true
					      			 : false);
	}

	error = shift_register_transaction_end(bcd->bcd_sreg);

 out:
	if (error == 0)
		bcd->bcd_val = digit;
	return (error);
}
