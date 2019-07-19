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

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

#include "nixie_display.h"

#define	SHIFT_CLOCK_PIN_DEFAULT		23
#define	SHIFT_DATA_PIN_DEFAULT		24
#define	SHIFT_LATCH_PIN_DEFAULT		25

const char *gpio = "gpio0";
int clock_pin = SHIFT_CLOCK_PIN_DEFAULT;
int data_pin = SHIFT_DATA_PIN_DEFAULT;
int latch_pin = SHIFT_LATCH_PIN_DEFAULT;

unsigned int num_cells;

nixie_display_t nixie;

char *string;

static void
usage(void)
{

	fprintf(stderr,
	    "usage: %s -C -n num_cells\n", getprogname());
	fprintf(stderr,
	    "       %s string\n", getprogname());

	exit(EXIT_FAILURE);
}

int
main(int argc, char *argv[])
{
	int ch, error;
	bool do_cycle = false;

	setprogname(argv[0]);

	while ((ch = getopt(argc, argv, "Cn:")) != -1) {
		switch (ch) {
		case 'C':
			do_cycle = true;
			break;

		case 'n':
			num_cells = atoi(argv[optind]);
			break;

		default:
			usage();
		}
	}

	argc -= optind;
	argv += optind;

	if (do_cycle) {
		if (argc != 0 || num_cells == 0) {
			usage();
		}
	} else {
		if (argc != 1 || num_cells != 0) {
			usage();
		}
	}

	error = nixie_display_alloc(&nixie);
	if (error) {
		fprintf(stderr, "%s: nixie_display_alloc failed: %s\n",
			getprogname(), strerror(error));
		exit(EXIT_FAILURE);
	}

	error = nixie_display_set_gpio(nixie, gpio);
	if (error) {
		fprintf(stderr, "%s: nixie_display_set_gpio failed: %s\n",
			getprogname(), strerror(error));
		exit(EXIT_FAILURE);
	}

	error = nixie_display_set_clock_pin(nixie, clock_pin);
	if (error) {
		fprintf(stderr, "%s: nixie_display_set_clock_pin failed: %s\n",
			getprogname(), strerror(error));
		exit(EXIT_FAILURE);
	}

	error = nixie_display_set_data_pin(nixie, data_pin);
	if (error) {
		fprintf(stderr, "%s: nixie_display_set_data_pin failed: %s\n",
			getprogname(), strerror(error));
		exit(EXIT_FAILURE);
	}

	error = nixie_display_set_latch_pin(nixie, latch_pin);
	if (error) {
		fprintf(stderr, "%s: nixie_display_set_latch_pin failed: %s\n",
			getprogname(), strerror(error));
		exit(EXIT_FAILURE);
	}

	if (! do_cycle) {
		string = argv[0];
		num_cells = (unsigned int)strlen(string);
	} else {
		string = malloc(num_cells + 1);
		if (string == NULL) {
			fprintf(stderr, "%s: malloc failed: %s\n",
				getprogname(), strerror(errno));
			exit(EXIT_FAILURE);
		}
		memset(string, '0', num_cells);
		string[num_cells] = '\0';
		for (unsigned int i = 0; i < num_cells; i++) {
			string[i] += (i % 10);
		}
	}

	error = nixie_display_set_cell_count(nixie, num_cells);
	if (error) {
		fprintf(stderr, "%s: nixie_display_set_cell_count failed: %s\n",
			getprogname(), strerror(error));
		exit(EXIT_FAILURE);
	}

	error = nixie_display_set_cell_type(nixie, NIXIE_DISPLAY_ALL_CELLS,
					    NIXIE_CELL_TYPE_NUMERIC);
	if (error) {
		fprintf(stderr, "%s: nixie_display_set_cell_type failed: %s\n",
			getprogname(), strerror(error));
		exit(EXIT_FAILURE);
	}

	error = nixie_display_start(nixie);
	if (error) {
		fprintf(stderr, "%s: nixie_display_start failed: %s\n",
			getprogname(), strerror(error));
		exit(EXIT_FAILURE);
	}

	if (! do_cycle) {
		error = nixie_display_set_string(nixie, string);
		if (error) {
			fprintf(stderr,
				"%s: nixie_display_set_string failed: %s\n",
				getprogname(), strerror(error));
			exit(EXIT_FAILURE);

		}
		exit(error == 0 ? EXIT_SUCCESS : EXIT_FAILURE);
	}

	for (;;) {
		error = nixie_display_set_string(nixie, string);
		if (error) {
			fprintf(stderr,
				"%s: nixie_display_set_string failed: %s\n",
				getprogname(), strerror(error));
			exit(EXIT_FAILURE);
		}
		for (unsigned int i = 0; i < num_cells; i++) {
			switch (string[i]) {
			case '9':
				string[i] = NIXIE_DISPLAY_CELL_BLANK;
				break;

			case NIXIE_DISPLAY_CELL_BLANK:
				string[i] = '0';
				break;

			default:
				string[i]++;
				break;
			}
		}
	}

	exit(EXIT_SUCCESS);
}
