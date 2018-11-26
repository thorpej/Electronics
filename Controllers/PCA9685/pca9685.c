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
#include <dev/i2c/i2c_io.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>

#include "pca9685.h"

/*****************************************************************************
 * INTERNAL FUNCTIONS AND DATA STRUCTURES
 *****************************************************************************/

struct pca9685_context {
	char *		sc_i2c_name;
	int		sc_i2c_fd;

	uint16_t	sc_slave_addr;

	unsigned int	sc_clk_freq;
	unsigned int	sc_pwm_freq;
	bool		sc_ext_clk;
	bool		sc_is_group_call;
	bool		sc_freq_initialized;
	bool		sc_mode_initialized;

	bool		sc_asleep;

	uint8_t		sc_regbuf[PCA9685_NCHANNELS * 4];
	unsigned int	sc_transactions;
	unsigned int	sc_transaction_first_channel;
	unsigned int	sc_transaction_last_channel;
};

static int
pca9685_read1(pca9685_t sc, uint8_t reg, uint8_t *valp)
{
	i2c_ioctl_exec_t op;
	int error = 0;

	op.iie_op	= I2C_OP_READ_WITH_STOP;
	op.iie_addr	= sc->sc_slave_addr;
	op.iie_cmd	= &reg;
	op.iie_cmdlen	= sizeof(reg);
	op.iie_buf	= valp;
	op.iie_buflen	= 1;

	if (ioctl(sc->sc_i2c_fd, I2C_IOCTL_EXEC, &op) == -1)
		error = errno;

	return (error);
}

static int
pca9685_write1(pca9685_t sc, uint8_t reg, uint8_t val)
{
	i2c_ioctl_exec_t op;
	int error = 0;

	op.iie_op	= I2C_OP_WRITE_WITH_STOP;
	op.iie_addr	= sc->sc_slave_addr;
	op.iie_cmd	= &reg;
	op.iie_cmdlen	= sizeof(reg);
	op.iie_buf	= &val;
	op.iie_buflen	= 1;

	if (ioctl(sc->sc_i2c_fd, I2C_IOCTL_EXEC, &op) == -1)
		error = errno;
	
	return (error);
}

static int
pca9685_write_LEDn(pca9685_t sc, uint8_t reg, uint8_t *buf, size_t buflen)
{
	i2c_ioctl_exec_t op;
	int error = 0;

	op.iie_op	= I2C_OP_WRITE_WITH_STOP;
	op.iie_addr	= sc->sc_slave_addr;
	op.iie_cmd	= &reg;
	op.iie_cmdlen	= sizeof(reg);
	op.iie_buf	= buf;
	op.iie_buflen	= buflen;

	if (ioctl(sc->sc_i2c_fd, I2C_IOCTL_EXEC, &op) == -1)
		error = errno;
	
	return (error);
}

static int
pca9685_is_valid_address(uint16_t addr)
{
	static const uint16_t blacklist[] = PCA9685_I2CADDR_BLACKLIST;
	static const unsigned int blacklist_count =
	    sizeof(blacklist) / sizeof(blacklist[0]);
	unsigned int i;

	if (addr < PCA9685_I2CADDR_MIN || addr > PCA9685_I2CADDR_MAX)
		return false;
	
	for (i = 0; i < blacklist_count; i++) {
		if (addr == blacklist[i])
			return false;
	}

	return true;
}

static int
pca9685_update_channel(pca9685_t sc, unsigned int channel, uint16_t on_tick,
		       uint16_t off_tick)
{
	uint8_t all_regs[4];
	uint8_t *regs;

	if (channel == PCA9685_ALL_CHANNELS) {
		/*
		 * Don't allow all-channel updates in a nested transaction.
		 */
		if (sc->sc_transactions > 1)
			return EBUSY;
		regs = all_regs;
	} else if (channel >= PCA9685_NCHANNELS)
		return EINVAL;
	else {
		if (channel < sc->sc_transaction_first_channel)
			sc->sc_transaction_first_channel = channel;
		if (channel > sc->sc_transaction_last_channel)
			sc->sc_transaction_last_channel = channel;
	
		regs = &sc->sc_regbuf[channel * 4];
	}

	regs[0] = (uint8_t)(on_tick & 0xff);
	regs[1] = (uint8_t)((on_tick >> 8) & 0xff);
	regs[2] = (uint8_t)(off_tick & 0xff);
	regs[3] = (uint8_t)((off_tick >> 8) & 0xff);

	/*
	 * If we're doing an all-channel update, then update the
	 * hardware now.
	 */
	if (channel == PCA9685_ALL_CHANNELS) {
		return pca9685_write_LEDn(sc, PCA9685_ALL_LED_ON_L,
					  regs, sizeof(regs));
	}

	return 0;
}

static int
pca9685_wait_clock(pca9685_t sc)
{
	struct timespec ts = { .tv_sec = 0, .tv_nsec = 500000000 };
	int rv;

	/*
	 * 500us delay is required after enabling the internal
	 * oscillator.
	 */

	do {
		rv = nanosleep(&ts, &ts);
	} while (rv != 0 && errno == EINTR);
	
	if (rv != 0)
		rv = errno;

	return rv;
}

/*****************************************************************************
 * PUBLIC FUNCTIONS
 *****************************************************************************/

/*
 * pca9685_alloc --
 *	Allocates driver context.
 */
int
pca9685_alloc(const char *i2c, uint16_t slave_addr, bool is_group_call,
	      pca9685_t *scp)
{
	pca9685_t sc = NULL;
	size_t i2c_namelen;
	char *i2c_devpath = NULL;
	int i, error = 0;

	if (i2c == NULL) {
		error = EINVAL;
		goto out;
	}

	if (is_group_call == false &&
	    pca9685_is_valid_address(slave_addr) == false) {
		error = EINVAL;
		goto out;
	}

	if (scp == NULL) {
		error = EINVAL;
		goto out;
	}

	sc = malloc(sizeof(*sc));
	if (sc == NULL) {
		error = ENOMEM;
		goto out;
	}

	memset(sc, 0, sizeof(*sc));
	sc->sc_i2c_fd = -1;
	sc->sc_slave_addr = slave_addr;
	if (is_group_call) {
		/* Pretend we're fully initialized. */
		sc->sc_freq_initialized = true;
		sc->sc_mode_initialized = true;
	}

	i2c_namelen = strlen(i2c);
	if (i2c_namelen > 5 && memcmp(i2c, "/dev/", 5) == 0)
		i2c += 5;
	sc->sc_i2c_name = strdup(i2c);
	if (sc->sc_i2c_name == NULL) {
		error = ENOMEM;
		goto out;
	}

	asprintf(&i2c_devpath, "/dev/%s", sc->sc_i2c_name);
	if (i2c_devpath == NULL) {
		error = ENOMEM;
		goto out;
	}

	sc->sc_i2c_fd = open(i2c_devpath, O_RDWR);
	if (sc->sc_i2c_fd == -1) {
		error = errno;
		goto out;
	}

	/*
	 * We don't do any additional configuration because we
	 * might be allocating a "virtual" instance of the controller
	 * in order to use all-call or one of the sub-call addresses.
	 *
	 * We do, however, initialize the shadow register buffer so
	 * that any uninitialized channels (holes) in a transaction
	 * get set to "full off" (which is the default after a power-on-
	 * reset).
	 */
	for (i = 0; i < PCA9685_NCHANNELS; i++) {
		(void) pca9685_update_channel(sc, i, PCA9685_PWM_TICKS, 0);
	}

 out:
	if (error == 0)
		*scp = sc;
	else if (sc != NULL)
		pca9685_free(sc);
	
	if (i2c_devpath != NULL)
		free(i2c_devpath);
	
	return error;
}

/*
 * pca9685_free --
 *	Frees driver context and any resources associated with it.
 */
void
pca9685_free(pca9685_t sc)
{

	if (sc->sc_i2c_fd != -1)
		(void)close(sc->sc_i2c_fd);
	if (sc->sc_i2c_name != NULL)
		free(sc->sc_i2c_name);

	free(sc);
}

/*
 * pca9685_set_freq --
 *	Sets the reference clock frequency and the PWM frequency.
 *	Note that once the controller has been configured to use
 *	an external clock, this setting is "sticky" until a power-
 *	on-reset.
 */
int
pca9685_set_freq(pca9685_t sc, unsigned int pwm_freq, int ext_freq)
{
	uint8_t mode1;
	int error;
	unsigned int clk_freq;
	unsigned int prescale;

	if (sc->sc_freq_initialized)
		return EBUSY;

	if (ext_freq < 0 && ext_freq != PCA9685_SET_FREQ_INTERNAL_CLOCK)
		return EINVAL;

	if (ext_freq == PCA9685_SET_FREQ_INTERNAL_CLOCK && sc->sc_ext_clk)
		return EBUSY;

	if (ext_freq > PCA9685_EXTERNAL_FREQ_MAX)
		return EINVAL;

	if (ext_freq == PCA9685_SET_FREQ_INTERNAL_CLOCK)
		clk_freq = PCA9685_INTERNAL_FREQ;
	else
		clk_freq = ext_freq;

	/*
	 * Formula for the prescale is:
	 *
	 *	     (     clk_freq      )
	 *	round( ----------------- ) - 1
	 *	     (  4096 * pwm_freq  )
	 *
	 * To do the rounding step, we scale the oscillator_freq
	 * by 100, check for the rounding condition, and then
	 * de-scale before the subtraction step.
	 */
	prescale = (clk_freq * 100) / (PCA9685_PWM_TICKS * pwm_freq);
	if ((prescale % 100) >= 50)
		prescale += 100;
	prescale = (prescale / 100) - 1;
	if (prescale < PCA9685_PRESCALE_MIN || prescale > PCA9685_PRESCALE_MAX)
		return EINVAL;

	error = pca9685_read1(sc, PCA9685_MODE1, &mode1);
	if (error)
		return error;
	
	/* Disable the internal oscillator. */
	mode1 |= MODE1_SLEEP;
	error = pca9685_write1(sc, PCA9685_MODE1, mode1);
	if (error)
		return error;

	error = pca9685_write1(sc, PCA9685_PRE_SCALE,
			       (uint8_t)(prescale & 0xff));
	if (error)
		return error;

	/*
	 * If we're using an external clock source, keep the
	 * internal oscillator turned off.
	 *
	 * XXX The datasheet is a little ambiguous about how this
	 * XXX is supposed to work -- on the same page it says to
	 * XXX perform this procedure, and also that PWM control of
	 * XXX the channels is not possible when the oscillator is
	 * XXX disabled.  I haven't tested this with an external
	 * XXX oscillator yet, so I don't know for sure.
	 */
	if (ext_freq != PCA9685_SET_FREQ_INTERNAL_CLOCK)
		mode1 |= MODE1_EXTCLK;
	else
		mode1 &= ~MODE1_SLEEP;
	error = pca9685_write1(sc, PCA9685_MODE1, mode1);
	if (error)
		return error;

	/* If using the internal oscillator, need to wait for it to settle. */
	if (ext_freq == PCA9685_SET_FREQ_INTERNAL_CLOCK) {
		error = pca9685_wait_clock(sc);
		if (error)
			return error;
	}

	/*
	 * We rely on auto-increment for the PWM register updates.
	 */
	mode1 |= MODE1_AI;
	error = pca9685_write1(sc, PCA9685_MODE1, mode1);
	if (error)
		return error;

	sc->sc_pwm_freq = pwm_freq;
	sc->sc_clk_freq = clk_freq;
	sc->sc_ext_clk = ext_freq != PCA9685_SET_FREQ_INTERNAL_CLOCK;

	sc->sc_freq_initialized = true;
	return 0;
}

/*
 * pca9685_set_group_call --
 *	Enable / disable one of the i2c group call addresses.
 *
 *	Exercise caution: the controller allows any i2c address
 *	to be selected, so the caller must ensure that there are
 *	no collisions and that the address is valid!
 */
int
pca9685_set_group_call(pca9685_t sc, uint8_t which, uint16_t call_addr,
		       bool enable)
{
	uint8_t mode1;
	uint8_t addr;
	uint8_t callreg;
	int error;

	switch (which) {
	case MODE1_ALLCALL:
		callreg = PCA9685_ALLCALLADR;
		break;

	case MODE1_SUB3:
		callreg = PCA9685_SUBADR3;
		break;

	case MODE1_SUB2:
		callreg = PCA9685_SUBADR2;
		break;

	case MODE1_SUB1:
		callreg = PCA9685_SUBADR1;
		break;

	default:
		return EINVAL;
	}

	error = pca9685_read1(sc, PCA9685_MODE1, &mode1);
	if (error)
		return error;

	if (enable) {
		error = pca9685_read1(sc, callreg, &addr);
		if (error)
			return error;
		if (addr != call_addr) {
			error = pca9685_write1(sc, callreg, call_addr);
			if (error)
				return error;
		}
		if ((mode1 & which) == 0) {
			mode1 |= which;
			error = pca9685_write1(sc, PCA9685_MODE1, mode1);
		}
	} else {
		if (mode1 & which) {
			mode1 &= ~which;
			error = pca9685_write1(sc, PCA9685_MODE1, mode1);
		}
	}

	return error;
}

/*
 * pca9685_set_output_mode --
 *	Set the output mode of the controller.  The caller is responsible
 *	for consulting the data sheet and providing the correct MODE2
 *	register value for how their circuit is designed.
 */
int
pca9685_set_output_mode(pca9685_t sc, uint8_t mode2)
{
	int error;

	if (sc->sc_mode_initialized)
		return EBUSY;

	/* Don't allow reserved bits to be set. */
	if (mode2 & ~(MODE2_OUTNE_MASK |
		      MODE2_OUTDRV |
		      MODE2_OCH |
		      MODE2_INVRT))
		return EINVAL;
	
	error = pca9685_write1(sc, PCA9685_MODE2, mode2);
	if (error)
		return error;
	
	sc->sc_mode_initialized = true;
	return 0;
}

/*
 * pca9685_sleep --
 *	Put the controller to sleep to save power by disabling the
 *	internal oscillator.
 */
int
pca9685_sleep(pca9685_t sc)
{
	int error;
	uint8_t mode1;

	if (sc->sc_freq_initialized == false)
		return ENXIO;
	
	if (sc->sc_ext_clk)
		return EBUSY;

	if (sc->sc_asleep)
		return 0;

	error = pca9685_read1(sc, PCA9685_MODE1, &mode1);
	if (error)
		return error;
	
	error = pca9685_write1(sc, PCA9685_MODE1, mode1 | MODE1_SLEEP);
	if (error)
		return error;
	
	sc->sc_asleep = true;
	return 0;
}

/*
 * pca9685_wake --
 *	Wake up the controller by re-enabling the internal oscillator
 *	and restarting the PWM channels.
 */
int
pca9685_wake(pca9685_t sc)
{
	int error;
	uint8_t mode1;

	if (sc->sc_freq_initialized == false)
		return ENXIO;
	
	if (sc->sc_ext_clk)
		return EBUSY;

	if (sc->sc_asleep == false)
		return 0;
	
	error = pca9685_read1(sc, PCA9685_MODE1, &mode1);
	if (error)
		return error;
	
	mode1 &= ~MODE1_SLEEP;
	error = pca9685_write1(sc, PCA9685_MODE1, mode1 & ~MODE1_RESTART);
	if (error)
		return error;
	error = pca9685_wait_clock(sc);
	if (error)
		return error;
	
	if (mode1 & MODE1_RESTART) {
		error = pca9685_write1(sc, PCA9685_MODE1, mode1);
		if (error)
			return error;
	}

	sc->sc_asleep = false;
	return 0;
}

/*
 * pca9685_start_transaction --
 *	Start a transaction allowing multiple channels to be updated
 *	atomically.
 */
int
pca9685_start_transaction(pca9685_t sc)
{

	if ((sc->sc_transactions + 1) == 0)
		return EINVAL;

	if (sc->sc_transactions == 0) {
		if (sc->sc_freq_initialized == false ||
		    sc->sc_mode_initialized == false)
		    	return ENXIO;
		sc->sc_transaction_first_channel = PCA9685_NCHANNELS;
		sc->sc_transaction_last_channel = 0;
	}

	sc->sc_transactions++;
	return 0;
}

/*
 * pca9685_end_transaction --
 *	End a transaction.  If this is the last of a set of nested
 *	transactions, update the hardware.
 */
int
pca9685_end_transaction(pca9685_t sc)
{
	unsigned int channel, nchannels;

	if (sc->sc_transactions == 0)
		return EINVAL;

	sc->sc_transactions--;

	if (sc->sc_transactions) {
		/* Not done yet. */
		return 0;
	}

	/* Last one; update the hardware. */

	if (sc->sc_transaction_first_channel == PCA9685_NCHANNELS) {
		/*
		 * ...unless we didn't actually do anything.
		 * (This case will also fire if we did an all-channel
		 * update).
		 */
		return 0;
	}

	channel = sc->sc_transaction_first_channel;
	nchannels = (sc->sc_transaction_last_channel -
	    sc->sc_transaction_first_channel) + 1;
	
	return pca9685_write_LEDn(sc, PCA9685_LEDx_ON_L(channel),
				  &sc->sc_regbuf[channel * 4],
				  nchannels * 4);
}

static void
pca9685_abort_implied_transaction(pca9685_t sc)
{

	/*
	 * This is used to abort the implicit transaction taken in
	 * channel manipulation functions below in error cases where
	 * we know the hardware update should be skipped.
	 */
	sc->sc_transactions--;
}

/*
 * pca9685_set_channel --
 *	Special-case: Use the channel as a GPIO pin and turn it
 *	fully-on or fully-off.
 */
int
pca9685_set_channel(pca9685_t sc, unsigned int channel, bool on)
{
	uint16_t on_tick, off_tick;
	int error;

	error = pca9685_start_transaction(sc);
	if (error)
		return error;

	if (on) {
		on_tick = 0;
		off_tick = PCA9685_PWM_TICKS;	/* magic */
	} else {
		on_tick = PCA9685_PWM_TICKS;	/* magic */
		off_tick = 0;
	}

	error = pca9685_update_channel(sc, channel, on_tick, off_tick);
	if (error) {
		pca9685_abort_implied_transaction(sc);
		return error;
	}
	return pca9685_end_transaction(sc);
}

/*
 * pca9685_pulse_channel --
 *	Pulse the channel, with a phase-shift delay of delay_ticks,
 *	with an active duration of active_ticks.
 */
int
pca9685_pulse_channel(pca9685_t sc, unsigned int channel, uint16_t delay_ticks,
		      uint16_t active_ticks)
{
	uint16_t on_tick, off_tick;
	int error;

	/*
	 * It doesn't make sense to delay for an entire period (or more).
	 */
	if (delay_ticks >= PCA9685_PWM_TICKS)
		return EINVAL;
	
	/*
	 * Use the full-on setting if we want to be active for the
	 * entire period.
	 */
	if (active_ticks >= PCA9685_PWM_TICKS)
		return pca9685_set_channel(sc, channel, true);

	/*
	 * ...and use the full-off setting if we don't want to be
	 * active for any of the period.
	 */
	if (active_ticks == 0)
		return pca9685_set_channel(sc, channel, false);

	error = pca9685_start_transaction(sc);
	if (error)
		return error;
	
	on_tick = delay_ticks;
	
	active_ticks += on_tick;
	if (active_ticks >= PCA9685_PWM_TICKS)
		off_tick = active_ticks - PCA9685_PWM_TICKS;
	else
		off_tick = active_ticks - 1;

	error = pca9685_update_channel(sc, channel, on_tick, off_tick);
	if (error) {
		pca9685_abort_implied_transaction(sc);
		return error;
	}
	return pca9685_end_transaction(sc);
}

/*
 * pca9685_percent_to_ticks --
 *	Convenience function that converts a whole-number percentage
 *	to a "ticks" value suitable for pulsing a channel.
 */
int
pca9685_percent_to_ticks(unsigned int percent, uint16_t *ticksp)
{

	if (percent > 100)
		return EINVAL;
	
	if (percent == 100)
		*ticksp = PCA9685_PWM_TICKS;
	else if (percent == 0)
		*ticksp = 0;
	else {
		/* Scale up to detect rounding condition. */
		unsigned int ticks = PCA9685_PWM_TICKS * 100;

		ticks = (ticks * percent) / 100;
		if ((ticks % 100) >= 50)
			ticks += 100;
		*ticksp = (uint16_t)(ticks / 100);
	}
	return 0;
}
