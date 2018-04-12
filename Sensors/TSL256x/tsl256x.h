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

#ifndef tsl256x_h_included
#define	tsl256x_h_included

#include <sys/types.h>
#include <stdbool.h>
#include <stdint.h>

#include "tsl256xreg.h"

struct tsl256x_context;
typedef struct tsl256x_context *tsl256x_t;

int	tsl256x_alloc(const char *i2c, uint16_t slave_addr, bool cs_package,
		      tsl256x_t *tsl);
void	tsl256x_free(tsl256x_t tsl);

int	tsl256x_set_integration_time(tsl256x_t tsl, uint8_t time);
int	tsl256x_set_gain(tsl256x_t tsl, uint8_t gain);
int	tsl256x_set_auto_gain(tsl256x_t tsl, bool use_autogain);

int	tsl256x_get_lux(tsl256x_t tsl, uint32_t *lux, uint16_t *raw_broadband,
			uint16_t *raw_ir);

#endif /* tsl256x_h_included */
