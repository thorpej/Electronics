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

#include <sys/types.h>
#include <sys/ioctl.h>
#include <sys/time.h>
#include <dev/i2c/i2c_io.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

#include "tsl256x.h"

/*****************************************************************************
 * INTERNAL FUNCTIONS AND DATA STRUCTURES
 *****************************************************************************/

struct tsl256x_context {
	char *		tsl_i2c_name;
	int		tsl_i2c_fd;

	unsigned int	tsl_poweron;

	uint16_t	tsl_slave_addr;
	uint8_t		tsl_itime;
	uint8_t		tsl_gain;

	bool		tsl_auto_gain;
	bool		tsl_cs_package;
};

/*
 * Allow pending interrupts to be cleared as part of another operation.
 */
#define	REGMASK		(COMMAND_REGMASK | COMMAND_CLEAR)

static int
tsl256x_read1(tsl256x_t tsl, uint8_t reg, uint8_t *valp)
{
	i2c_ioctl_exec_t op;
	int error = 0;

	reg = (reg & REGMASK) | COMMAND_CMD;

	op.iie_op	= I2C_OP_READ_WITH_STOP;
	op.iie_addr	= tsl->tsl_slave_addr;
	op.iie_cmd	= &reg;
	op.iie_cmdlen	= sizeof(reg);
	op.iie_buf	= valp;
	op.iie_buflen	= 1;

	if (ioctl(tsl->tsl_i2c_fd, I2C_IOCTL_EXEC, &op) == -1)
		error = errno;
	
	return (error);
}

static int
tsl256x_read2(tsl256x_t tsl, uint8_t reg, uint16_t *valp)
{
	i2c_ioctl_exec_t op;
	int error = 0;
	uint8_t valbuf[2];

	reg = (reg & REGMASK) | COMMAND_CMD | COMMAND_WORD;

	op.iie_op	= I2C_OP_READ_WITH_STOP;
	op.iie_addr	= tsl->tsl_slave_addr;
	op.iie_cmd	= &reg;
	op.iie_cmdlen	= sizeof(reg);
	op.iie_buf	= valbuf;
	op.iie_buflen	= sizeof(valbuf);

	if (ioctl(tsl->tsl_i2c_fd, I2C_IOCTL_EXEC, &op) == -1)
		error = errno;
	else
		*valp = valbuf[0] | ((uint16_t)valbuf[1] << 8);

	return (error);
}

static int
tsl256x_write1(tsl256x_t tsl, uint8_t reg, uint8_t val)
{
	i2c_ioctl_exec_t op;
	int error = 0;

	reg = (reg & REGMASK) | COMMAND_CMD;

	op.iie_op	= I2C_OP_WRITE_WITH_STOP;
	op.iie_addr	= tsl->tsl_slave_addr;
	op.iie_cmd	= &reg;
	op.iie_cmdlen	= sizeof(reg);
	op.iie_buf	= &val;
	op.iie_buflen	= 1;

	if (ioctl(tsl->tsl_i2c_fd, I2C_IOCTL_EXEC, &op) == -1)
		error = errno;
	
	return (error);
}

#if 0	/* not used */
static int
tsl256x_write2(tsl256x_t tsl, uint8_t reg, uint16_t val)
{
	i2c_ioctl_exec_t op;
	int error = 0;
	uint8_t valbuf[2];

	valbuf[0] = (uint8_t)(val & 0xff);
	valbuf[1] = (uint8_t)(val >> 8);

	reg = (reg & REGMASK) | COMMAND_CMD | COMMAND_WORD;

	op.iie_op	= I2C_OP_WRITE_WITH_STOP;
	op.iie_addr	= tsl->tsl_slave_addr;
	op.iie_cmd	= &reg;
	op.iie_cmdlen	= sizeof(reg);
	op.iie_buf	= valbuf;
	op.iie_buflen	= sizeof(valbuf);

	if (ioctl(tsl->tsl_i2c_fd, I2C_IOCTL_EXEC, &op) == -1)
		error = errno;
	
	return (error);
}
#endif

#undef REGMASK

static int
tsl256x_poweron(tsl256x_t tsl)
{
	int error;

	if (tsl->tsl_poweron++ == 0) {
		uint8_t val;

		error = tsl256x_write1(tsl, TSL256x_REG_CONTROL,
				       CONTROL_POWER_ON);
		if (error)
			return (error);

		error = tsl256x_read1(tsl, TSL256x_REG_CONTROL, &val);
		if (error)
			return (error);

		if (val != CONTROL_POWER_ON)
			return (EIO);
	}
	return (0);
}

static int
tsl256x_poweroff(tsl256x_t tsl)
{

	if (tsl->tsl_poweron != 0 && --tsl->tsl_poweron == 0)
		return (tsl256x_write1(tsl, TSL256x_REG_CONTROL,
				       CONTROL_POWER_OFF));
	return (0);
}

#define	MS_TO_NS(x)	((x) * 1000000)

static int
tsl256x_wait_for_adcs(tsl256x_t tsl)
{
	struct timespec sleep_ts, remain_ts;
	int rv;

	sleep_ts.tv_sec = 0;

	switch (tsl->tsl_itime) {
	case TIMING_INTEG_13_7ms:
		/* Wait 15ms for 13.7ms integration */
		sleep_ts.tv_nsec = MS_TO_NS(15);
		break;

	case TIMING_INTEG_101ms:
		/* Wait 120ms for 101ms integration */
		sleep_ts.tv_nsec = MS_TO_NS(120);
		break;
	
	case TIMING_INTEG_402ms:
	default:
		/* Wait 450ms for 402ms integration */
		sleep_ts.tv_nsec = MS_TO_NS(450);
		break;
	}

	while ((rv = nanosleep(&sleep_ts, &remain_ts)) == -1) {
		if (errno != EINTR)
			return (errno);
		sleep_ts = remain_ts;
	}

	return (0);
}

#undef MS_TO_NS

static int
tsl256x_read_adcs(tsl256x_t tsl, uint16_t *adc0valp, uint16_t *adc1valp)
{
	int error;

	error = tsl256x_read2(tsl, TSL256x_REG_DATA0LOW, adc0valp);
	if (error == 0)
		error = tsl256x_read2(tsl, TSL256x_REG_DATA1LOW, adc1valp);
	
	return (error);
}

/*****************************************************************************
 * PUBLIC FUNCTIONS
 *****************************************************************************/

/*
 * tsl256x_alloc --
 *	Allocates driver context.
 */
int
tsl256x_alloc(const char *i2c, uint16_t slave_addr, bool cs_package,
	      tsl256x_t *tslp)
{
	tsl256x_t tsl = NULL;
	size_t i2c_namelen;
	char *i2c_devpath = NULL;
	int error = 0;

	if (i2c == NULL) {
		error = EINVAL;
		goto out;
	}

	switch (slave_addr) {
	case TSL256x_SLAVEADDR_GND:
	case TSL256x_SLAVEADDR_FLOAT:
	case TSL256x_SLAVEADDR_VDD:
		break;
	
	default:
		/* Invalid slave address. */
		error = EINVAL;
		goto out;
	}

	if (tslp == NULL) {
		error = EINVAL;
		goto out;
	}

	tsl = malloc(sizeof(*tsl));
	if (tsl == NULL) {
		error = ENOMEM;
		goto out;
	}

	memset(tsl, 0, sizeof(*tsl));
	tsl->tsl_i2c_fd = -1;
	tsl->tsl_slave_addr = slave_addr;
	tsl->tsl_cs_package = cs_package;

	i2c_namelen = strlen(i2c);
	if (i2c_namelen > 5 && memcmp(i2c, "/dev/", 5) == 0)
		i2c += 5;
	tsl->tsl_i2c_name = strdup(i2c);
	if (tsl->tsl_i2c_name == NULL) {
		error = ENOMEM;
		goto out;
	}

	asprintf(&i2c_devpath, "/dev/%s", tsl->tsl_i2c_name);
	if (i2c_devpath == NULL) {
		error = ENOMEM;
		goto out;
	}
	tsl->tsl_i2c_fd = open(i2c_devpath, O_RDWR);
	if (tsl->tsl_i2c_fd == -1) {
		error = errno;
		goto out;
	}

	/* Power the device on and clear any pending interrupts. */
	error = tsl256x_write1(tsl, TSL256x_REG_CONTROL | COMMAND_CLEAR,
			       CONTROL_POWER_ON);
	if (error)
		goto out;
	tsl->tsl_poweron = 1;

	/* Make sure interrupts are disabled. */
	error = tsl256x_write1(tsl, TSL256x_REG_INTERRUPT | COMMAND_CLEAR, 0);

	/* Inititalize timing to reasonable defaults. */
	tsl->tsl_gain = TIMING_GAIN_1X;
	error = tsl256x_set_integration_time(tsl, TIMING_INTEG_13_7ms);

 out:
	if (tsl != NULL && tsl->tsl_poweron)
		tsl256x_poweroff(tsl);
	if (error == 0)
		*tslp = tsl;
	else if (tsl != NULL)
		free(tsl);

	if (i2c_devpath != NULL)
		free(i2c_devpath);
	
	return (error);
}

/*
 * tsl256x_free --
 *	Frees driver context and any resources associated with it.
 */
void
tsl256x_free(tsl256x_t tsl)
{

	if (tsl->tsl_i2c_fd != -1) {
		tsl->tsl_poweron = 1;
		(void)tsl256x_poweroff(tsl);
		(void)close(tsl->tsl_i2c_fd);
	}
	if (tsl->tsl_i2c_name != NULL)
		free(tsl->tsl_i2c_name);

	free(tsl);
}

/*
 * tsl256x_set_integration_time --
 *	Set the ADC integration time.
 */
int
tsl256x_set_integration_time(tsl256x_t tsl, uint8_t time)
{
	int error;

	switch (time) {
	case TIMING_INTEG_13_7ms:
	case TIMING_INTEG_101ms:
	case TIMING_INTEG_402ms:
		break;
	
	default:
		return (EINVAL);
	}

	if ((error = tsl256x_poweron(tsl)) != 0)
		return (error);

	if ((error = tsl256x_write1(tsl, TSL256x_REG_TIMING,
				    time | tsl->tsl_gain)) != 0)
		return (error);
	
	tsl->tsl_itime = time;

	(void) tsl256x_poweroff(tsl);

	return (0);
}

/*
 * tsl256x_set_gain --
 *	Set the sensor gain.
 */
static int
tsl256x_set_gain0(tsl256x_t tsl, uint8_t gain)
{
	int error;

	if ((error = tsl256x_write1(tsl, TSL256x_REG_TIMING,
				    tsl->tsl_itime | gain)) != 0)
		return (error);

	tsl->tsl_gain = gain;
	return (0);
}

int
tsl256x_set_gain(tsl256x_t tsl, uint8_t gain)
{
	int error;

	switch (gain) {
	case TIMING_GAIN_1X:
	case TIMING_GAIN_16X:
		break;
	
	default:
		return (EINVAL);
	}

	if ((error = tsl256x_poweron(tsl)) != 0)
		return (error);

	if ((error = tsl256x_set_gain0(tsl, gain)) != 0)
		goto out;

	tsl->tsl_auto_gain = false;

 out:
	(void) tsl256x_poweroff(tsl);
	return (0);
}

/*
 * tsl256x_set_auto_gain --
 *	Enable or disable the auto-gain control algorithm.
 */
int
tsl256x_set_auto_gain(tsl256x_t tsl, bool use_autogain)
{

	tsl->tsl_auto_gain = use_autogain;
	return (0);
}

/*
 * The following code is partially derived from Adafruit's TSL2561
 * driver for Arduino, which carries this notice:
 * 
 * @file Adafruit_TSL2561_U.cpp
 *
 * @mainpage Adafruit TSL2561 Light/Lux sensor driver
 *
 * @section intro_sec Introduction
 *
 * This is the documentation for Adafruit's TSL2561 driver for the
 * Arduino platform.  It is designed specifically to work with the
 * Adafruit TSL2561 breakout: http://www.adafruit.com/products/439
 *
 * These sensors use I2C to communicate, 2 pins (SCL+SDA) are required
 * to interface with the breakout.
 *
 * Adafruit invests time and resources providing this open source code,
 * please support Adafruit and open-source hardware by purchasing
 * products from Adafruit!
 *
 * @section dependencies Dependencies
 *
 * This library depends on <a href="https://github.com/adafruit/Adafruit_Sensor">
 * Adafruit_Sensor</a> being present on your system. Please make sure you have
 * installed the latest version before using this library.
 *
 * @section author Author
 *
 * Written by Kevin "KTOWN" Townsend for Adafruit Industries.
 *
 * @section license License
 *
 * BSD license, all text here must be included in any redistribution.
 *
 *   @section  HISTORY
 *
 *   v2.0 - Rewrote driver for Adafruit_Sensor and Auto-Gain support, and
 *          added lux clipping check (returns 0 lux on sensor saturation)
 *   v1.0 - First release (previously TSL2561)
 */

static int
tsl256x_read_sensors(tsl256x_t tsl, uint16_t *adc0p, uint16_t *adc1p)
{
	int error;

	if ((error = tsl256x_poweron(tsl)) != 0)
		return (error);

	if ((error = tsl256x_wait_for_adcs(tsl)) != 0)
		goto out;

	error = tsl256x_read_adcs(tsl, adc0p, adc1p);

 out:
	(void)tsl256x_poweroff(tsl);
	return (error);
}

/*
 * Auto-gain thresholds:
 */
#define	TSL2561_AGC_THI_13MS	(4850)	/* Max value at Ti 13ms = 5047 */
#define	TSL2561_AGC_TLO_13MS	(100)	/* Min value at Ti 13ms = 100 */
#define	TSL2561_AGC_THI_101MS	(36000)	/* Max value at Ti 101ms = 37177 */
#define	TSL2561_AGC_TLO_101MS	(200)	/* Min value at Ti 101ms = 200 */
#define	TSL2561_AGC_THI_402MS	(63000)	/* Max value at Ti 402ms = 65535 */
#define	TSL2561_AGC_TLO_402MS	(500)	/* Min value at Ti 402ms = 500 */

static int
tsl256x_get_sensor_data(tsl256x_t tsl, uint16_t *broadband, uint16_t *ir)
{
	int error = 0;
	uint16_t adc0, adc1;
	bool did_adjust_gain, valid;
	uint16_t hi, lo;

	if (tsl->tsl_auto_gain == false) {
		error = tsl256x_read_sensors(tsl, &adc0, &adc1);
		goto out;
	}

	/* Set the hi / lo threshold based on current integration time. */
	switch (tsl->tsl_itime) {
	case TIMING_INTEG_13_7ms:
		hi = TSL2561_AGC_THI_13MS;
		lo = TSL2561_AGC_TLO_13MS;
		break;

	case TIMING_INTEG_101ms:
		hi = TSL2561_AGC_THI_101MS;
		lo = TSL2561_AGC_TLO_101MS;
		break;

	case TIMING_INTEG_402ms:
	default:
		hi = TSL2561_AGC_THI_402MS;
		lo = TSL2561_AGC_TLO_402MS;
	}

	/* Read data and adjust the gain until we have a valid range. */
	for (valid = false, did_adjust_gain = false; valid == false; ) {
		if ((error = tsl256x_read_sensors(tsl, &adc0, &adc1)) != 0)
			goto out;

		if (did_adjust_gain == false) {
			if (adc0 < lo && tsl->tsl_gain == TIMING_GAIN_1X) {
				/* Increase the gain and try again. */
				if ((error = tsl256x_set_gain0(tsl,
							TIMING_GAIN_16X)) != 0)
				     	goto out;
				did_adjust_gain = true;
			} else if (adc0 > hi &&
				   tsl->tsl_gain == TIMING_GAIN_16X) {
				/* Decrease the gain and try again. */
				if ((error = tsl256x_set_gain0(tsl,
							TIMING_GAIN_1X)) != 0)
					goto out;
				did_adjust_gain = true;
			} else {
				/*
				 * Reading is either valid or we're already
				 * at the chip's limits.
				 */
				valid = true;
			}
		} else {
			/*
			 * If we've already adjusted the gain once, just
			 * return the new results.  This avoids endless
			 * loops where a value is at one extreme pre-gain
			 * and at the other extreme post-gain.
			 */
			valid = true;
		}
	}

 out:
	if (error == 0) {
		if (broadband != NULL)
			*broadband = adc0;
		if (ir != NULL)
			*ir = adc1;
	}
	return (error);
}

/*
 * Clipping thresholds:
 */
#define	TSL2561_CLIPPING_13MS	(4900)
#define	TSL2561_CLIPPING_101MS	(37000)
#define	TSL2561_CLIPPING_402MS	(65000)

/*
 * Scaling factors:
 */
#define	TSL2561_LUX_LUXSCALE      (14)	   /* Scale by 2^14 */
#define	TSL2561_LUX_RATIOSCALE    (9)      /* Scale ratio by 2^9 */
#define	TSL2561_LUX_CHSCALE       (10)     /* Scale channel values by 2^10 */
#define	TSL2561_LUX_CHSCALE_TINT0 (0x7517) /* 322/11 * 2^TSL2561_LUX_CHSCALE */
#define	TSL2561_LUX_CHSCALE_TINT1 (0x0FE7) /* 322/81 * 2^TSL2561_LUX_CHSCALE */

/*
 * Lux factors (the datasheet explains how these magic constants
 * are used):
 */
/* T, FN and CL package values */
#define TSL2561_LUX_K1T           (0x0040)  /* 0.125 * 2^RATIO_SCALE */
#define TSL2561_LUX_B1T           (0x01f2)  /* 0.0304 * 2^LUX_SCALE */
#define TSL2561_LUX_M1T           (0x01be)  /* 0.0272 * 2^LUX_SCALE */
#define TSL2561_LUX_K2T           (0x0080)  /* 0.250 * 2^RATIO_SCALE */
#define TSL2561_LUX_B2T           (0x0214)  /* 0.0325 * 2^LUX_SCALE */
#define TSL2561_LUX_M2T           (0x02d1)  /* 0.0440 * 2^LUX_SCALE */
#define TSL2561_LUX_K3T           (0x00c0)  /* 0.375 * 2^RATIO_SCALE */
#define TSL2561_LUX_B3T           (0x023f)  /* 0.0351 * 2^LUX_SCALE */
#define TSL2561_LUX_M3T           (0x037b)  /* 0.0544 * 2^LUX_SCALE */
#define TSL2561_LUX_K4T           (0x0100)  /* 0.50 * 2^RATIO_SCALE */
#define TSL2561_LUX_B4T           (0x0270)  /* 0.0381 * 2^LUX_SCALE */
#define TSL2561_LUX_M4T           (0x03fe)  /* 0.0624 * 2^LUX_SCALE */
#define TSL2561_LUX_K5T           (0x0138)  /* 0.61 * 2^RATIO_SCALE */
#define TSL2561_LUX_B5T           (0x016f)  /* 0.0224 * 2^LUX_SCALE */
#define TSL2561_LUX_M5T           (0x01fc)  /* 0.0310 * 2^LUX_SCALE */
#define TSL2561_LUX_K6T           (0x019a)  /* 0.80 * 2^RATIO_SCALE */
#define TSL2561_LUX_B6T           (0x00d2)  /* 0.0128 * 2^LUX_SCALE */
#define TSL2561_LUX_M6T           (0x00fb)  /* 0.0153 * 2^LUX_SCALE */
#define TSL2561_LUX_K7T           (0x029a)  /* 1.3 * 2^RATIO_SCALE */
#define TSL2561_LUX_B7T           (0x0018)  /* 0.00146 * 2^LUX_SCALE */
#define TSL2561_LUX_M7T           (0x0012)  /* 0.00112 * 2^LUX_SCALE */
#define TSL2561_LUX_K8T           (0x029a)  /* 1.3 * 2^RATIO_SCALE */
#define TSL2561_LUX_B8T           (0x0000)  /* 0.000 * 2^LUX_SCALE */
#define TSL2561_LUX_M8T           (0x0000)  /* 0.000 * 2^LUX_SCALE */

/* CS package values */
#define TSL2561_LUX_K1C           (0x0043)  /* 0.130 * 2^RATIO_SCALE */
#define TSL2561_LUX_B1C           (0x0204)  /* 0.0315 * 2^LUX_SCALE */
#define TSL2561_LUX_M1C           (0x01ad)  /* 0.0262 * 2^LUX_SCALE */
#define TSL2561_LUX_K2C           (0x0085)  /* 0.260 * 2^RATIO_SCALE */
#define TSL2561_LUX_B2C           (0x0228)  /* 0.0337 * 2^LUX_SCALE */
#define TSL2561_LUX_M2C           (0x02c1)  /* 0.0430 * 2^LUX_SCALE */
#define TSL2561_LUX_K3C           (0x00c8)  /* 0.390 * 2^RATIO_SCALE */
#define TSL2561_LUX_B3C           (0x0253)  /* 0.0363 * 2^LUX_SCALE */
#define TSL2561_LUX_M3C           (0x0363)  /* 0.0529 * 2^LUX_SCALE */
#define TSL2561_LUX_K4C           (0x010a)  /* 0.520 * 2^RATIO_SCALE */
#define TSL2561_LUX_B4C           (0x0282)  /* 0.0392 * 2^LUX_SCALE */
#define TSL2561_LUX_M4C           (0x03df)  /* 0.0605 * 2^LUX_SCALE */
#define TSL2561_LUX_K5C           (0x014d)  /* 0.65 * 2^RATIO_SCALE */
#define TSL2561_LUX_B5C           (0x0177)  /* 0.0229 * 2^LUX_SCALE */
#define TSL2561_LUX_M5C           (0x01dd)  /* 0.0291 * 2^LUX_SCALE */
#define TSL2561_LUX_K6C           (0x019a)  /* 0.80 * 2^RATIO_SCALE */
#define TSL2561_LUX_B6C           (0x0101)  /* 0.0157 * 2^LUX_SCALE */
#define TSL2561_LUX_M6C           (0x0127)  /* 0.0180 * 2^LUX_SCALE */
#define TSL2561_LUX_K7C           (0x029a)  /* 1.3 * 2^RATIO_SCALE */
#define TSL2561_LUX_B7C           (0x0037)  /* 0.00338 * 2^LUX_SCALE */
#define TSL2561_LUX_M7C           (0x002b)  /* 0.00260 * 2^LUX_SCALE */
#define TSL2561_LUX_K8C           (0x029a)  /* 1.3 * 2^RATIO_SCALE */
#define TSL2561_LUX_B8C           (0x0000)  /* 0.000 * 2^LUX_SCALE */
#define TSL2561_LUX_M8C           (0x0000)  /* 0.000 * 2^LUX_SCALE */

struct lux_factor_table_entry {
	uint16_t	k;
	uint16_t	b;
	uint16_t	m;
};

static const struct lux_factor_table_entry lux_factor_table[] = {
	{ TSL2561_LUX_K1T,	TSL2561_LUX_B1T,	TSL2561_LUX_M1T },
	{ TSL2561_LUX_K2T,	TSL2561_LUX_B2T,	TSL2561_LUX_M2T },
	{ TSL2561_LUX_K3T,	TSL2561_LUX_B3T,	TSL2561_LUX_M3T },
	{ TSL2561_LUX_K4T,	TSL2561_LUX_B4T,	TSL2561_LUX_M4T },
	{ TSL2561_LUX_K5T,	TSL2561_LUX_B5T,	TSL2561_LUX_M5T },
	{ TSL2561_LUX_K6T,	TSL2561_LUX_B6T,	TSL2561_LUX_M6T },
	{ TSL2561_LUX_K7T,	TSL2561_LUX_B7T,	TSL2561_LUX_M7T },
	{ TSL2561_LUX_K8T,	TSL2561_LUX_B8T,	TSL2561_LUX_M8T },
};
static const int lux_factor_table_last_entry =
    (sizeof(lux_factor_table) / sizeof(lux_factor_table[0])) - 1;

static const struct lux_factor_table_entry lux_factor_table_cs_package[] = {
	{ TSL2561_LUX_K1C,	TSL2561_LUX_B1C,	TSL2561_LUX_M1C },
	{ TSL2561_LUX_K2C,	TSL2561_LUX_B2C,	TSL2561_LUX_M2C },
	{ TSL2561_LUX_K3C,	TSL2561_LUX_B3C,	TSL2561_LUX_M3C },
	{ TSL2561_LUX_K4C,	TSL2561_LUX_B4C,	TSL2561_LUX_M4C },
	{ TSL2561_LUX_K5C,	TSL2561_LUX_B5C,	TSL2561_LUX_M5C },
	{ TSL2561_LUX_K6C,	TSL2561_LUX_B6C,	TSL2561_LUX_M6C },
	{ TSL2561_LUX_K7C,	TSL2561_LUX_B7C,	TSL2561_LUX_M7C },
	{ TSL2561_LUX_K8C,	TSL2561_LUX_B8C,	TSL2561_LUX_M8C },
};
static const int lux_factor_table_cs_package_last_entry =
    (sizeof(lux_factor_table_cs_package) /
     sizeof(lux_factor_table_cs_package[0])) - 1;

/*
 * tsl256x_get_lux --
 *	Get the calculated Lux value, tuned to mimic the human eye
 *	response.  We also return the raw sensor values if requested.
 */
int
tsl256x_get_lux(tsl256x_t tsl, uint32_t *luxp, uint16_t *raw_broadband,
		uint16_t *raw_ir)
{
	uint32_t channel0, channel1, scale, ratio, lux = 0;
	uint16_t broadband, ir;
	uint16_t clip_threshold;
	const struct lux_factor_table_entry *table;
	int idx, last_entry, error;
	int32_t temp;

	if ((error = tsl256x_get_sensor_data(tsl, &broadband, &ir)) != 0)
		return (error);

	if (luxp == NULL) {
		/*
		 * Caller doesn't want the calculated Lux value, so
		 * don't bother calculating it.  Maybe they just want
		 * the raw sensor data?
		 */
		goto out;
	}

	/*
	 * Check to see if the sensor is saturated.  If so,
	 * just return a "max brightness" value.
	 */
	switch (tsl->tsl_itime) {
	case TIMING_INTEG_13_7ms:
		clip_threshold = TSL2561_CLIPPING_13MS;
		break;
	
	case TIMING_INTEG_101ms:
		clip_threshold = TSL2561_CLIPPING_101MS;
		break;
	
	case TIMING_INTEG_402ms:
	default:
		clip_threshold = TSL2561_CLIPPING_402MS;
		break;
	}

	if (broadband > clip_threshold || ir > clip_threshold) {
		lux = 65536;
		goto out;
	}

	/* Get correct scale factor based on integration time. */
	switch (tsl->tsl_itime) {
	case TIMING_INTEG_13_7ms:
		scale = TSL2561_LUX_CHSCALE_TINT0;
		break;
	
	case TIMING_INTEG_101ms:
		scale = TSL2561_LUX_CHSCALE_TINT1;
		break;
	
	case TIMING_INTEG_402ms:
	default:
		scale = (1 << TSL2561_LUX_CHSCALE);
	}

	/* Scale for gain. */
	if (tsl->tsl_gain == TIMING_GAIN_1X)
		scale <<= 4;

	/* Scale the channel values. */
	channel0 = ((uint32_t)broadband * scale) >> TSL2561_LUX_CHSCALE;
	channel1 = ((uint32_t)ir * scale) >> TSL2561_LUX_CHSCALE;

	/* Find the ratio of the channel values (ir / broadband) */
	if (channel0 != 0)
		ratio = (channel1 << (TSL2561_LUX_RATIOSCALE + 1)) / channel0;
	else
		ratio = 0;
	
	/* Round the ratio value. */
	ratio = (ratio + 1) >> 1;

	if (tsl->tsl_cs_package) {
		table = lux_factor_table_cs_package;
		last_entry = lux_factor_table_cs_package_last_entry;
	} else {
		table = lux_factor_table;
		last_entry = lux_factor_table_last_entry;
	}
	
	/*
	 * The table is arranged such that we compare <= against
	 * the key, and if all else fails, we use the last entry.
	 * The pseudo-code in the data sheet shows what's going on.
	 */
	for (idx = 0; idx < last_entry; idx++) {
		if (ratio <= table[idx].k)
			break;
	}

	temp = ((channel0 * table[idx].b) - (channel1 * table[idx].m));

	/* Do not allow negative Lux value. */
	if (temp < 0)
		temp = 0;
	
	/* Round lsb (2^(LUX_SCALE-1)) */
	temp += (1 << (TSL2561_LUX_LUXSCALE-1));

	/* Strip off fractional portion */
	lux = temp >> TSL2561_LUX_LUXSCALE;

 out:
	if (error == 0) {
		if (luxp != NULL)
			*luxp = lux;
		if (raw_broadband != NULL)
			*raw_broadband = broadband;
		if (raw_ir != NULL)
			*raw_ir = ir;
	}
	return (error);
}
