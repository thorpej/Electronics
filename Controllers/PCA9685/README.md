# Driver for NXP PCA9685 LED Controller

This is a driver for the NXP PCA9685 16-channel, 12-bit PWM Fm+ I2C LED controller.
The PCA9685 is designed for RGBA color backlighting applications, but is flexible enough
to work in a variety of applications, including servo control.  Each channel has a 12-bit
resolution that provides phase-shift capability.  All channels share a common PWM update
frequency, adjustable from 24Hz to 1526Hz.

The PCA9685 is available on a handy [break-out board from Adafruit](https://www.adafruit.com/product/815).

I wrote this driver to run in userspace on a NetBSD system, and so it uses the NetBSD
I2C API (in the form of an ioctl) to communicate with the hardware.  The use of
NetBSD-specific API is isolated to just a couple of functions and the rest of the code
is pretty vanilla POSIX / C99, so porting it to another platform should be pretty easy.
If you provide me with clean and tidy patches to make it run elsewhere, I'll be happy to
integrate them.

## The API

The API is pretty simple and straight-forward.  You should be able to use most / all of
the advanced features of the chip, including all-call and sub-call addressing to group
set of channels for e.g. red, green, and blue, as well as an external reference oscillator
to synchronize multiple PCA9685s.  Worth noting, in order to maintain simplicity and
reduce external dependencies, the driver does not perform any thread synchronization
internally, so if you call this API from more than one thread in your application, you
need to provide the synchronization yourself.

    int   pca9685_alloc(const char *i2c, uint16_t slave_addr, bool is_group, pca9685_t *scp);

Allocates a handle for an instance of the controller.  This call will not perform any
initialization of the controller, only allocate resources necessary to communicate
with it.  This is to allow this call to also allocate virtual instances to control
groups of PCA9685s using the all-call and sub-call addresses.

Controller instances allocated for group call use are only allowed to set the duty cycle
of the controller channels, and may not perform any hardware configuration calls, such
as setting the frequency or output mode.  Conversely, controller instances that are *not*
allocated for group call use *must* set both the frequency and output mode before the
duty cycle may be set for any channel.

Arguments:

* *i2c* -- Name of the I2C bus the device is attached to, e.g. "iic0".
* *slave_addr* -- I2C address of the controller.  This may be the I2C address of a
hardware instance or one of the all-call or sub-call addresses (group call).
See *pca9685reg.h* and the datasheet for more information about addressing.
* *is_group* -- Indicates that this controller instance is being initialized for
a group call address.
* *scp* -- Output parameter used to return the handle to the caller.

Returns 0 on success or an **errno** code on failure.

    void  pca9685_free(pca9685_t sc);

Frees a previously-allocated controller handle.

Arguments:

* *sc* -- Valid controller handle.

This call always succeeds.

    int  pca9685_set_freq(pca9685_t sc, unsigned int pwm_freq, int ext_freq);

Sets the reference clock frequency and the PWM frequency. **NOTE: calling this function
while a channel is active will result in undefined behavior.**  This is due to lack of
support for the PCA9685 "restart" sequence.

Arguments:

* *sc* -- Valid controller handle.
* *pwm_freq* -- The frequency which defines the maximum pulse period.  The minimum
PWM frequency is 24Hz and the maximum PWM frequency is 1526Hz.  Each PWM period will be
subdivided into 4096 steps which are used to control the duty cycle and phase shift of
each channel.
* *ext_freq* -- The frequency of the reference clock.  To use the internal 25MHz reference
oscillator, use the value `PCA9685_SET_FREQ_INTERNAL_CLOCK`.  Note that to correctly
control a group of PCA9685s, they must all use the same external reference clock.  Also
note that once the PCA9685 has been configured to use an external reference clock, that
setting is "sticky" until a power-on-reset.

Returns 0 on success or an **errno** code on failure.

    int  pca9685_set_group_call(pca9685_t sc, uint8_t which, uint16_t call_addr, bool enable);

Enable / disable one of the i2c group call addresses.  Configuring one of these group
call addresses allows multiple PCA9685s to be grouped to controller larger banks of LEDs,
or to control a group of servos simultaneously.

Arguments:

* *sc* -- Valid controller handle.
* *which* -- Specifies which group call address is being configured.  See constants below.
* *call_addr* -- Specifies the I2C address that should function as the specified group
call address.  Use caution; any I2C address may be specified.
* *enable* -- Specifies if the group call address is to be enabled or disabled.

Group call address constants:

    MODE1_ALLCALL, MODE1_SUB1, MODE1_SUB2, MODE1_SUB3

Returns 0 on success or an **errno** code on failure.

    int  pca9685_set_output_mode(pca9685_t sc, uint8_t mode2);

Configures the output mode.  This function sets the MODE2 register directly.  Consult
the datasheet for information on how to configure the output mode.

Arguments:

* *sc* -- Valid controller handle.
* *mode2* -- Value to set in the MODE2 register.

Returns 0 on success or an **errno** code on failure.

    int  pca9685_sleep(pca9685_t sc);

Puts the controller in sleep mode by disabling the internal oscillator, when power
savings are required.  This is not available if using an external clock.  If using an
external clock, it is possible to save power simply by disabling the external clock at
its source.

Arguments:

* *sc* -- Valid controller handle.

Return 0 on success or an **errno** code on failure.

    int  pca9685_wake(pca9685_t sc);

Wakes up the controller from a previous call to `pca9685_sleep()` by restarting the
internal oscillator and performing the "restart" sequence; this restart sequence is
required because the internal oscillator is unstable for 500uS after it is enabled.
If using an external clock, restarting the external clock at its source is sufficient
so long as the PCA9685 only sees this clock input once it has stabilized.

Arguments:

* *sc* -- Valid controller handle.

Returns 0 on success or an **errno** code on failure.

    int  pca9685_start_transaction(pca9685_t sc);

Starts a transaction that allows multiple channels to be updated atomically, using
the register auto-increment feature of the PCA9685.  A limited number of transactions
may be nested, if needed.

Arguments:

* *sc* -- Valid controller handle.

Returns 0 on success or an **errno** code on failure.

    int  pca9685_end_transaction(pca9685_t sc);

End a (possibly nested) transaction.  If the the last transaction is being closed out,
the PCA9685 channel registers will be updated.  For best results, update only
contiguous channels in any given series of nested transactions.

Arguments:

* *sc* -- Valid controller handle.

Returns 0 on success or an **errno** code on failure.

    int  pca9685_set_channel(pca9685_t sc, unsigned int channel, bool on);

Sets the specified channel either fully-on or fully-off.

Arguments:

* *sc* -- Valid controller handle.
* *channel* -- Channel to set on or off.  The special value `PCA9685_ALL_CHANNELS`
indicates that all channels are to be set simultaneously.  `PCA9685_ALL_CHANNELS` may
not be specified inside a nested transaction.
* *on* -- Indicates if the channel should be on or off.

Returns 0 on success or an **errno** code on failure.

    int  pca9685_pulse_channel(pca9685_t sc, unsigned int channel, uint16_t delay_ticks, uint16_t active_ticks);

Sets the specified channel to pulse for a specified number of ticks (out of 4096) after an
initial phase delay.

Arguments:

* *sc* -- Valid controller handle.
* *channel* -- Channel to pulse.  The special value `PCA9685_ALL_CHANNELS` indicates that
all channels are to be set simultaneously.  `PCA9685_ALL_CHANNELS` may not be specified
inside a nested transaction.
* *delay_ticks* -- Number of ticks (out of 4096) to delay the initial pulse.
* *active_ticks* -- Number of ticks in the PWM period (out of 4096) that the pulse should
be active.

Returns 0 on success or an **errno** code on failure.

    int  pca9685_percent_to_ticks(unsigned int percent, uint16_t *ticksp);

Convenience function to turn an integer duty cycle percentage into a tick count suitable
for using with `pca9685_pulse_channe()`.

Arguments:

* *percent* -- An integer number from 0 to 100, representing a duty cycle percentage.
* *ticksp* -- Output parameter containing the computed number of ticks.

Returns 0 on success or an **errno** code on failure.
