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

#include "shift_register.h"

const char *gpio = "gpio0";
int clock_pin = -1;
int data_pin = -1;
int latch_pin = -1;
int nbits = 8;

static void
usage(void)
{

	fprintf(stderr,
	    "usage: %s [-g gpio] -c pin -d pin -l pin pin on|off\n",
	    getprogname());
	fprintf(stderr, "\n"
			"-g gpio    : GPIO instance device is connnected to\n"
			"             (default: \"gpio0\")\n");
	fprintf(stderr, "\n"
			"-c pin     : GPIO pin for clock signal\n");
	fprintf(stderr, "-d pin     : GPIO pin for data signal\n");
	fprintf(stderr, "-l pin     : GPIO pin for latch signal\n");
	fprintf(stderr, "\n"
			"pin on|off : change shift output pin to on/off\n");

	exit(EXIT_FAILURE);
}

int
main(int argc, char *argv[])
{
	shift_register_t sreg;
	int ch, error;
	int pos = -1;
	bool set_byte = false;
	uint8_t val;

	setprogname(argv[0]);

	while ((ch = getopt(argc, argv, "g:c:d:l:n:")) != -1) {
		switch (ch) {
		case 'g':
			gpio = optarg;
			break;

		case 'c':
			clock_pin = atoi(optarg);
			break;

		case 'd':
			data_pin = atoi(optarg);
			break;

		case 'l':
			latch_pin = atoi(optarg);
			break;

		case 'n':
			nbits = atoi(optarg);
			break;

		default:
			usage();
		}
	}

	if (clock_pin == -1 || data_pin == -1 || latch_pin == -1)
	    	usage();

	argc -= optind;
	argv += optind;

	if (argc != 2)
		usage();

	pos = atoi(argv[0]);
	if (strcmp(argv[1], "on") == 0)
		val = true;
	else if (strcmp(argv[1], "off") == 0)
		val = false;
	else {
		long longval;
		char *endcp = NULL;

		longval = strtol(argv[1], &endcp, 0);
		if (endcp == NULL || *endcp != '\0' ||
		    longval < 0 || longval > 0xff)
			usage();
		val = (uint8_t)longval;
		set_byte = true;
	}

	printf("Opening %s, clock=%d, data=%d, latch=%d, nbits=%d\n",
	       gpio, clock_pin, data_pin, latch_pin, nbits);

	error = shift_register_alloc(gpio, nbits,
				      clock_pin, data_pin, latch_pin,
				      &sreg);
	if (error) {
		fprintf(stderr, "%s: shift_register_alloc failed: %s\n",
			getprogname(), strerror(error));
		exit(EXIT_FAILURE);
	}

	if (set_byte) {
		error = shift_register_set_byte(sreg, pos, val);
		if (error) {
			fprintf(stderr,
				"%s: error setting byte %d to 0x%x: %s\n",
				getprogname(), pos, val, strerror(error));
		}
	} else {
		error = shift_register_set_bit(sreg, pos, val);
		if (error) {
			fprintf(stderr, "%s: error setting pin %d to %s: %s\n",
				getprogname(), pos, val ? "on" : "off",
				strerror(error));
		}
	}

	shift_register_free(sreg);
	exit(EXIT_SUCCESS);
}
