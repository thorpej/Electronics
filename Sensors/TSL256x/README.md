# Driver for Taos TSL256x Light-to-Digital Converter

This is a driver for the Taos TSL256x Light-to-Digital Converter, or lux sensor.
The TSL256x combines a broadband photodiode and an IR photodiode to provide a near-photopic response over an effective 20-bit dynamic range (16-bit resolution).
There are two versions of the chip, the TSL2560 (SMBus) and the TSL2561 (I2C), each available in several package options.
I have only used this driver with the TSL2561, specifically the non-CS package flavor available on a [break-out board from Adafruit](https://www.adafruit.com/product/439).

Some of the magic constants and calculations were derived from [Adafruit's TSL2561 driver for Arduino](https://github.com/adafruit/Adafruit_TSL2561), as well as the TSL2561 [data sheet](https://cdn-shop.adafruit.com/datasheets/TSL2561.pdf).

I wrote this driver to run in userspace on a NetBSD system, and so it uses the NetBSD I2C API (in the form of an ioctl) to communicate with the hardware.
The use of NetBSD-specific API is isolated to just a couple of functions and the rest of the code is pretty vanilla POSIX / C99, so porting it to another platform should be pretty easy.
If you provide me with clean and tidy patches to make it run elsewhere, I'll be happy to integrate them.
Likewise, if you successfully use this with the CS package version of the chip or with the TSL2560 flavor, let me know so I can make a note of it here.

As of May 27, 2018, there is a kernel-mode driver in NetBSD for this device, [tsllux](http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/i2c/tsl256x.c), based on this code base.
It integrates with the [envsys(4)](http://netbsd.gw.com/cgi-bin/man-cgi?envsys++NetBSD-current) kernel API, which provides a variety of options for getting the sensor data in the kernel and in user-space applications.

## The API

The API is pretty simple and straight-forward.
As of now, it does not support any of the more advanced features of the chip, specifically manual integration timing or threshold-driven interrupts; it is polled-mode only.
Worth noting, in order to maintain simplicity and reduce external dependencies, the driver does not perform any thread synchronization internally, so if you call this API from more than one thread in your application, you need to provide the synchronization yourself.

    int   tsl256x_alloc(const char *i2c, uint16_t slave_addr, bool cs_package, tsl256x_t *tsl);

Allocates a handle for an instance of the sensor.
Arguments:

* *i2c* -- Name of the I2C bus the device is attached to, e.g. "iic0".
* *slave_addr* -- I2C address of the sensor.
The slave address the sensor responds to is selected with the *ADDR_SEL* pin on the chip.  See *tsl256xreg.h* for the list of valid addresses.
* *cs_package* -- The CS (6-lead chip scale) package uses a different set of coefficients for calculating the Lux value; pass **true** if you are using this chip package, **false** otherwise.
* *tsl* -- Output parameter used to return the handle to the caller.

Returns 0 on success or an **errno** code on failure.

    void  tsl256x_free(tsl256x_t *tsl);

Frees a previously-allocated sensor handle.
Arguments:

* *tsl* -- Valid sensor handle.

This call always succeeds.

    int  tsl256x_set_integration_time(tsl256x_t tsl, uint8_t time);

Sets the integration time for the ADC in the sensor.
A longer integration time results in a more accurate reading, but of
course takes longer, so you must weigh the trade-offs.
There are 3 valid integration time settings: 13.7ms, 101ms, and 402ms.
Manual integration timing is not currently supported.
Arguments:

* *tsl* -- Valid sensor handle.
* *time* -- The integration time to use, specified by a timing constant.

Timing constants:

    TIMING_INTEG_13_7ms, TIMING_INTEG_101ms, TIMING_INTEG_402ms

Returns 0 on success or an **errno** code on failure.

    int  tsl256x_set_gain(tsl256x_t tsl, uint8_t gain);

Sets the gain of the sensor. 
Gain factors of 1x and 16x are available. 
A higher gain is more sensitive to variations in lighting, but is more prone to sensor saturation.
If auto-gain is enabled and the gain is subsequently set explicitly with this call, auto-gain will be disabled.
Arguments:

* *tsl* -- Valid sensor handle.
* *gain* -- Gain to use, specified bty a gain constant.

Gain constants:

    TIMING_GAIN_1X, TIMING_GAIN_16X

Returns 0 on success or an **errno** code on failure.

    int  tsl256x_set_auto_gain(tsl256x_t tsl, bool use_autogain);

Enables or disables an auto-gain control algorithm that adjusts the gain for current lighting conditions.
If auto-gain is disabled after being previously enabled, the gain will remain at whatever the auto-gain algorithm had most recently set.
Arguments:

* *tsl* -- Valid sensor handle.
* *use_autogain* -- **true** enables auto-gain, **false** disables auto-gain.

Returns 0 on success or an **errno** code on failure.

    int  tsl256x_get_lux(tsl256x_t tsl, uint32_t *lux, uint16_t *raw_broadband, uint16_t *raw_ir);

Samples the sensor and returns a Lux reading as well as the raw sensor readings for the broadband and IR photodiodes.
All of the output parameters are optional; specify **NULL** for any you don't care about.
If either the broadband or IR sensor is saturated, 65536 will be returned for Lux to indicate clipping.
Each call will wait for the configured integration time after enabling sensor power, read the sensors, calculate the Lux value, and  disable sensor power.
Arguments:

* *tsl* -- Valid sensor handle.
* *lux* -- Optional output parameter used to return the calculated Lux value.
* *raw_broadband* -- Optional output parameter used to return the raw broadband sensor value.
* *raw_ir* -- Optional output parameter used to return the raw IR sensor value.

Returns 0 on success or an **errno** code on failure.

