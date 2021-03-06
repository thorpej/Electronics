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

#ifndef tsl256xreg_h_included
#define	tsl256xreg_h_included

/*
 * Hardware definitions for the TAOS TSL2560 (SMBus) and TSL2561 (I2C).
 *
 * These devices combine a broadband photodiode (visible light + infrared)
 * and an additional ifrared phtodiode onto a single CMOS integrated circuit.
 * The devices include programmable thresholds that can trigger SMB-Alert
 * type interrupts (TSL2560) or a traditional level-triggered interrupt
 * (TSL2561) that remains asserted until cleared.
 */

/*
 * Valid I2C addresses for the TSL2561.  The address is selected based
 * on how the ADDR_SEL pin is connected.
 */
#define	TSL256x_SLAVEADDR_GND	0x29	/* ADDR SEL tied to ground */
#define	TSL256x_SLAVEADDR_FLOAT	0x39	/* ADDR SEL left floating */
#define	TSL256x_SLAVEADDR_VDD	0x49	/* ADDR SEL tied to Vdd */
#define TSL256x_SMB_ALERT_ADDR	0x0c	/* SMB Alert address (all configs) */

/*
 * TSL256x register definitions.
 */

/* COMMAND - Specifies register address and other parameters */
#define	COMMAND_REGMASK		0x0f	/* register address mask */
#define	COMMAND_BLOCK		0x10	/* transaction uses block read/write */
#define	COMMAND_WORD		0x20	/* transaction uses word read/write */
#define	COMMAND_CLEAR		0x40	/* clear pending interrupt */
#define	COMMAND_CMD		0x80	/* Select command register; MBO */


/* CONTROL - Control of basic functions */
#define	TSL256x_REG_CONTROL	0x0
#define	CONTROL_POWER_OFF	0x00
#define	CONTROL_POWER_ON	0x03


/* TIMING - Integration time / gain control */
#define	TSL256x_REG_TIMING	0x1
#define	TIMING_INTEG_13_7ms	0x00	/* 13.7ms integration time */
#define	TIMING_INTEG_101ms	0x01	/* 101ms integration time */
#define	TIMING_INTEG_402ms	0x02	/* 402ms integration time */
#define	TIMING_INTEG_MANUAL	0x03	/* use manual timing */
#define	TIMING_MANUAL		0x08	/* manual timing; 1 starts, 0 stops */
#define	TIMING_GAIN_1X		0x00
#define	TIMING_GAIN_16X		0x10


/* THRESHLOWLOW - Low byte of low interrupt threshold */
#define	TSL256x_REG_LOWLOW	0x2


/* THRESHLOWHIGH - High byte of low interrupt threshold */
#define	TSL256x_REG_LOWHIGH	0x3


/* THRESHHIGHLOW - Low byte of high interrupt threshold */
#define	TSL256x_REG_HIGHLOW	0x4


/* THRESHHIGHHIGH - High byte of high interrupt threshold */
#define	TSL256x_REG_HIGHHIGH	0x5


/* INTERRUPT - Interrupt control */
#define	TSL256x_REG_INTERRUPT	0x6
#define	INTERRUPT_LEVEL		0x01	/* Level-triggered interrupt */
#define	INTERRUPT_SMB_ALERT	0x02	/* SMB Alert compliant interrupt */
#define	INTERRUPT_TEST		0x03	/* interrupt test */
#define	INTERRUPT_PERSIST(x)	((x) << 4)
		/*
		 * Interrupt persist settings:
		 * 0 - Every ADC cycle generates an interrupt
		 * 1..15 - # integration periods outside threshold range
		 */


/* 0x7 - Reserved */


/* CRC - Factory test -- not a user register */
#define	TSL256x_REG_CRC		0x8


/* 0x9 - Reserved */


/* ID - Part number / Rev ID */
#define	TSL256x_REG_ID		0xa
#define	ID_GET_PARTNO(x)	(((x) & 0xf0) >> 4)
#define		ID_PARTNO_TSL2560	0x0
#define		ID_PARTNO_TSL2561	0x1
#define	ID_GET_REVNO(x)		((x) & 0x0f)


/* 0xb - Reserved */


/* DATA0LOW - Low byte of ADC channel 0 */
#define	TSL256x_REG_DATA0LOW	0xc


/* DATA0HIGH - High byte of ADC channel 0 */
#define	TSL256x_REG_DATA0HIGH	0xd


/* DATA1LOW - Low byte of ADC channel 1 */
#define	TSL256x_REG_DATA1LOW	0xe


/* DATA1HIGH - High byte of ADC channel 1 */
#define	TSL256x_REG_DATA1HIGH	0xf

#endif /* tsl256xreg_h_included */
