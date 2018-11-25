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

#ifndef pca9685_h_included
#define	pca9685_h_included

#include <sys/types.h>
#include <stdbool.h>
#include <stdint.h>

#include "pca9685reg.h"

struct pca9685_context;
typedef struct pca9685_context *pca9685_t;

int	pca9685_alloc(const char *, uint16_t, bool, pca9685_t *);
void	pca9685_free(pca9685_t);

int	pca9685_set_freq(pca9685_t, unsigned int, int);
int	pca9685_set_group_call(pca9685_t, uint8_t, uint16_t, bool);
int	pca9685_set_output_mode(pca9685_t, uint8_t);

int	pca9685_sleep(pca9685_t);
int	pca9685_wake(pca9685_t);

int	pca9685_start_transaction(pca9685_t);
int	pca9685_end_transaction(pca9685_t);

int	pca9685_set_channel(pca9685_t, unsigned int, bool);
int	pca9685_pulse_channel(pca9685_t, unsigned int, uint16_t, uint16_t);

int	pca9685_percent_to_ticks(unsigned int, uint16_t *);

	/*
	 * Special value used to indicate that the internal 25MHz
	 * oscillator should be used.
	 */
#define	PCA9685_SET_FREQ_INTERNAL_CLOCK	-1

	/*
	 * Special value used to indiate that we want to set the pulse
	 * mode for all channels.
	 */
#define	PCA9685_ALL_CHANNELS		PCA9685_NCHANNELS

#endif /* pca9685_h_included */
