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

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

#include "tsl256x.h"

uint16_t slave_address = TSL256x_SLAVEADDR_FLOAT;
uint8_t	integration_time = TIMING_INTEG_13_7ms;
uint8_t	gain = TIMING_GAIN_1X;
bool	auto_gain = false;
const char *busname = "iic0";
bool	forever = false;
bool	cs_package = false;

static void
usage(void)
{

	fprintf(stderr,
	    "usage: %s [-a h|f|l] [-i 0|1|2] [-g 0|1] [-c] [-b busname] [-f]\n",
	    getprogname());
	fprintf(stderr, "\n"
			"-a h|f|l   : Select the i2c bus address\n"
			"             h = ADDR_SEL tied high -> 0x49\n"
			"             f = ADDR_SEL floating -> 0x39 (default)\n"
			"             l - ADDR_SEL tied low -> 0x29\n");
	fprintf(stderr, "\n"
			"-i 0|1|2   : Select integration time\n"
			"             0 = 13.7ms (default)\n"
			"             1 = 101ms\n"
			"             2 = 402ms\n");
	fprintf(stderr, "\n"
			"-g 0|1|a   : Select gain\n"
			"	      0 = 1x (default)\n"
			"             1 = 16x\n"
			"             a = auto-gain algorithm\n");
	fprintf(stderr, "\n"
			"-c         : Chip is in CS package\n");
	fprintf(stderr, "\n"
			"-b busname : i2c bus device is connected to\n"
			"             (default: \"iic0\")\n");
	fprintf(stderr, "\n"
			"-f         : loop forever, sampling every second\n");

	exit(EXIT_FAILURE);
}

int
main(int argc, char *argv[])
{
	tsl256x_t tsl;
	int ch, error;
	bool loop;
	uint32_t lux;
	uint16_t broadband, ir;

	setprogname(argv[0]);

	while ((ch = getopt(argc, argv, "a:i:g:cb:f")) != -1) {
		switch (ch) {
		case 'a':
			if (strcmp(optarg, "h") == 0)
				slave_address = TSL256x_SLAVEADDR_VDD;
			else if (strcmp(optarg, "f") == 0)
				slave_address = TSL256x_SLAVEADDR_FLOAT;
			else if (strcmp(optarg, "l") == 0)
				slave_address = TSL256x_SLAVEADDR_GND;
			else
				usage();
			break;

		case 'i':
			if (strcmp(optarg, "0") == 0)
				integration_time = TIMING_INTEG_13_7ms;
			else if (strcmp(optarg, "1") == 0)
				integration_time = TIMING_INTEG_101ms;
			else if (strcmp(optarg, "2") == 0)
				integration_time = TIMING_INTEG_402ms;
			else
				usage();
			break;

		case 'g':
			if (strcmp(optarg, "0") == 0) {
				gain = TIMING_GAIN_1X;
				auto_gain = false;
			} else if (strcmp(optarg, "1") == 0) {
				gain = TIMING_GAIN_16X;
				auto_gain = false;
			} else if (strcmp(optarg, "a") == 0)
				auto_gain = true;
			else
				usage();
			break;

		case 'b':
			busname = optarg;
			break;

		case 'c':
			cs_package = true;
			break;

		case 'f':
			forever = true;
			break;

		default:
			usage();
		}
	}

	argc -= optind;
	argv += optind;

	if (argc)
		usage();
	
	printf("Opening address 0x%x on i2c bus %s...\n", slave_address,
	       busname);
	
	error = tsl256x_alloc(busname, slave_address, cs_package, &tsl);
	if (error) {
		fprintf(stderr, "%s: tsl256x_alloc failed: %s\n",
			getprogname(), strerror(error));
		exit(EXIT_FAILURE);
	}

	error = tsl256x_set_integration_time(tsl, integration_time);
	if (error) {
		fprintf(stderr,
			"%s: tsl256x_set_integration_time(0x%x) failed: %s\n",
			getprogname(), integration_time, strerror(error));
		exit(EXIT_FAILURE);
	}

	if (auto_gain) {
		error = tsl256x_set_auto_gain(tsl, true);
		if (error) {
			fprintf(stderr,
			        "%s: tsl256x_set_auto_gain(true) failed: %s\n",
				getprogname(), strerror(error));
			exit(EXIT_FAILURE);
		}
	} else {
		error = tsl256x_set_auto_gain(tsl, false);
		if (error) {
			fprintf(stderr,
			        "%s: tsl256x_set_auto_gain(false) failed: %s\n",
				getprogname(), strerror(error));
			exit(EXIT_FAILURE);
		}
		error = tsl256x_set_gain(tsl, gain);
		if (error) {
			fprintf(stderr,
				"%s: tsl256x_set_gain(0x%x) failed: %s\n",
				getprogname(), gain, strerror(error));
			exit(EXIT_FAILURE);
		}
	}

	printf("Sampling %s...\n", forever ? "forever" : "once");
	for (loop = true; loop == true; loop = forever) {
		error = tsl256x_get_lux(tsl, &lux, &broadband, &ir);
		if (error) {
			fprintf(stderr,
				"%s: tsl256x_get_lux failed: %s\n",
				getprogname(), strerror(error));
			exit(EXIT_FAILURE);
		}
		printf("Lux: %u -- Broadband: %u -- IR: %u\n",
		       lux, broadband, ir);
		if (forever)
			sleep(1);
	}

	tsl256x_free(tsl);
	exit(EXIT_SUCCESS);
}
