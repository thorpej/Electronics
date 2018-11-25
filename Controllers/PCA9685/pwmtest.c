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

#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

#include "pca9685.h"

uint16_t slave_address = 0x40;
const char *busname = "iic0";

static void
usage(void)
{

	fprintf(stderr,
	    "usage: %s [-a addr] [-b busname] [-e ext_freq] -f pwm_freq\n",
	    getprogname());
	fprintf(stderr,
	    "       %s [-a addr] [-b busname] -m mode\n",
	    getprogname());
	fprintf(stderr,
	    "       %s [-a addr] [-b busname] -c channel -d duty\n",
	    getprogname());
	fprintf(stderr,
	    "       %s [-a addr] [-b busname] -A -d duty\n",
	    getprogname());
	fprintf(stderr, "\n"
			"-a addr     : i2c bus address (default: 0x40)\n"
			"-A          : set the duty cycle for all channels\n"
			"-b busname  : i2c bus device is connected to\n"
			"              (default: \"iic0\")\n"
			"-e ext_freq : external clock frequency\n"
			"-f pwm_freq : PWM frequency\n"
			"-m mode     : raw MODE2 value\n"
			"-c channel  : PWM channel to set / pulse\n"
			"-d duty     : pulse as this duty cycle (0-100)\n");

	exit(EXIT_FAILURE);
}

static int
get_number(const char *str, int *valp)
{
	long val;
	char *cp;

	if (*str == '\0')
		return EINVAL;

	errno = 0;
	val = strtol(str, &cp, 0);
	if (*cp != '\0' || errno == ERANGE)
		return EINVAL;
	
	if (val < 0 || val > INT_MAX)
		return EINVAL;
	
	*valp = val;
	return 0;

}

int
main(int argc, char *argv[])
{
	pca9685_t sc;
	int ch, error, ival;
	int channel = -1;
	int duty_cycle = -1;
	int pwm_freq = -1;
	int ext_freq = PCA9685_SET_FREQ_INTERNAL_CLOCK;
	int mode = -1;
	bool did_conf = false;
	bool did_chan = false;

	setprogname(argv[0]);

	while ((ch = getopt(argc, argv, "a:Ab:c:d:e:f:m:")) != -1) {
		switch (ch) {
		case 'a':
			error = get_number(optarg, &ival);
			if (error)
				usage();
			if (ival < PCA9685_I2CADDR_MIN ||
			    ival > PCA9685_I2CADDR_MAX)
			    	usage();
			slave_address = (uint16_t)ival;
			break;

		case 'A':
			if (channel != -1)
				usage();
			did_chan = true;
			channel = PCA9685_ALL_CHANNELS;
			break;

		case 'b':
			busname = optarg;
			break;

		case 'c':
			if (channel != -1)
				usage();
			did_chan = true;
			error = get_number(optarg, &ival);
			if (error)
				usage();
			if (ival < 0 || ival >= PCA9685_NCHANNELS)
				usage();
			channel = ival;
			break;

		case 'd':
			did_chan = true;
			error = get_number(optarg, &ival);
			if (error)
				usage();
			if (ival < 0 || ival > 100)
				usage();
			duty_cycle = ival;
			break;

		case 'e':
			did_conf = true;
			error = get_number(optarg, &ival);
			if (error)
				usage();
			if (ival < 0 || ival > PCA9685_EXTERNAL_FREQ_MAX)
				usage();
			ext_freq = ival;
			break;

		case 'f':
			did_conf = true;
			error = get_number(optarg, &ival);
			if (error)
				usage();
			if (ival < PCA9685_FREQ_MIN || ival > PCA9685_FREQ_MAX)
				usage();
			pwm_freq = ival;
			break;

		case 'm':
			did_conf = true;
			error = get_number(optarg, &ival);
			if (error)
				usage();
			if (ival & ~(MODE2_OUTNE_MASK |
				     MODE2_OUTDRV |
				     MODE2_OCH |
				     MODE2_INVRT))
				usage();
			mode = ival;
			break;

		default:
			usage();
		}
	}

	argc -= optind;
	argv += optind;

	if (argc)
		usage();

	if ((did_conf ^ did_chan) == false)
		usage();

	printf("Opening address 0x%x on i2c bus %s...\n", slave_address,
	       busname);

	/*
	 * Because we're initializing in a separate context from setting
	 * the channel duty cycle, fake out the API by claiming to be
	 * a group call context, even if we're talking to a specific hardware
	 * instance.
	 */
	error = pca9685_alloc(busname, slave_address, did_chan, &sc);
	if (error) {
		fprintf(stderr, "%s: pca9685_alloc failed: %s\n",
			getprogname(), strerror(error));
		exit(EXIT_FAILURE);
	}

	if (did_conf) {
		if (pwm_freq != -1) {
			error = pca9685_set_freq(sc, pwm_freq, ext_freq);
			if (error) {
				fprintf(stderr,
					"%s: pca9685_set_freq failed: %s\n",
					getprogname(), strerror(error));
				exit(EXIT_FAILURE);
			}
			if (ext_freq == PCA9685_SET_FREQ_INTERNAL_CLOCK) {
				printf("PWM freq: %dHz (int 25MHz clock)\n",
				       pwm_freq);
			} else {
				printf("PWM freq: %dHz (ext %dHz clock)\n",
				       pwm_freq, ext_freq);
			}
		}
		if (mode != -1) {
			error = pca9685_set_output_mode(sc, (uint8_t)mode);
			if (error) {
				fprintf(stderr,
				    "%s: pca9685_set_output_mode failed: %s\n",
				    getprogname(), strerror(error));
				exit(EXIT_FAILURE);
			}
			printf("Output mode: %s%s%sOUTNE=0x%x\n",
			    (mode & MODE2_INVRT)  ? "INVRT,"  : "",
			    (mode & MODE2_OCH)    ? "OCH,"    : "",
			    (mode & MODE2_OUTDRV) ? "OUTDRV," : "",
			    (mode & MODE2_OUTNE_MASK));
		}
	} else {
		uint16_t active_ticks;

		if (channel == -1 || duty_cycle == -1)
			usage();

		error = pca9685_percent_to_ticks(duty_cycle, &active_ticks);
		if (error) {
			fprintf(stderr,
				"%s pca9685_percent_to_ticks failed: %s\n",
				getprogname(), strerror(error));
			exit(EXIT_FAILURE);
		}
		error = pca9685_pulse_channel(sc, channel, 0, active_ticks);
		if (error) {
			fprintf(stderr,
				"%s: pca9685_pulse_channel failed: %s\n",
				getprogname(), strerror(error));
			exit(EXIT_FAILURE);
		}
		printf("Channel %d -> %d%% (%u ticks)\n", channel, duty_cycle,
		       (unsigned int)active_ticks);
	}

	pca9685_free(sc);
	exit(EXIT_SUCCESS);
}
