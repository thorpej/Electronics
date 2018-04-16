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

#include "sn74141.h"

const char *gpio = "gpio0";
int clock_pin = -1;
int data_pin = -1;
int latch_pin = -1;
int nbits = 8;
int pinbase = 0;
uint8_t digit = 0;
bool loop = false;

static void
usage(void)
{

	fprintf(stderr,
	    "usage: %s [-g gpio] -c pin -d pin -l pin digit\n",
	    getprogname());
	fprintf(stderr, "\n"
			"-g gpio    : GPIO instance device is connnected to\n"
			"             (default: \"gpio0\")\n");
	fprintf(stderr, "\n"
			"-c pin     : GPIO pin for clock signal\n");
	fprintf(stderr, "-d pin     : GPIO pin for data signal\n");
	fprintf(stderr, "-l pin     : GPIO pin for latch signal\n");
	fprintf(stderr, "\n"
			"digit      : Digit to display, 0..9\n"
			"                               'blank'\n"
			"                               'loop'\n");

	exit(EXIT_FAILURE);
}

int
main(int argc, char *argv[])
{
	shift_register_t sreg;
	sn74141_t bcd;
	int ch, error;
	const char *arg;

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

		default:
			usage();
		}
	}

	if (clock_pin == -1 || data_pin == -1 || latch_pin == -1)
	    	usage();

	argc -= optind;
	argv += optind;

	if (argc != 1)
		usage();

	arg = argv[0];
	if (strlen(arg) == 1) {
		if (*arg >= '0' && *arg <= '9')
			digit = *arg - '0';
		else if (*arg == 'b')
			digit = SN74141_DIGIT_BLANK;
		else if (*arg == 'l')
			loop = true;
		else
			usage();
	} else {
		if (strcmp(arg, "blank") == 0)
			digit = SN74141_DIGIT_BLANK;
		else if (strcmp(arg, "loop") == 0)
			loop = true;
		else
			usage();
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

	error = sn74141_alloc(sreg, pinbase, &bcd);
	if (error) {
		fprintf(stderr, "%s: sn74141_alloc failed: %s\n",
			getprogname(), strerror(error));
		exit(EXIT_FAILURE);
	}

	if (loop) {
		uint8_t i;

		printf("Looping 0..9..[blank]...\n");
		for (;;) {
			for (i = 0; i <= SN74141_DIGIT_BLANK; i++) {
				putchar(digit < SN74141_DIGIT_BLANK
				    ?  '0' + i
				    : ' ');
				fflush(stdout);
				sn74141_set_digit(bcd, i);
				sleep(1);
			}
		}
	} else {
		printf("Displaying '%c'...\n", digit < SN74141_DIGIT_BLANK ?
		       '0' + digit : ' ');
		sn74141_set_digit(bcd, digit);
	}

	sn74141_free(bcd);
	shift_register_free(sreg);
	exit(EXIT_SUCCESS);
}
