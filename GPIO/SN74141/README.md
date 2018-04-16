# SN74141 BCD decoder / Nixie driver

This is a driver for the SN74141 BCD decoder / Nixie driver, that also works with
the Russian and other Soviet-era Eastern European equivalents.  This implementation
is intended for use with a shifter register (such as the SN74595) to drive the SN74141
inputs.

The SN74141 is a TTL BCD decoder combined with a set of 10 open-collector outputs
suitable for directly driving Nixie display tubes.  The anode of the Nixie is connected to
an appropriate high-voltage supply, and each cathode (one for each digit) is connected to
the corresponding SN74141 output; upon decoding, the base of the selected internal output
transistor is driven, thus completing the selected cathode circuit and illuminating the
digit by the ionization of the gas mixture in the tube and the resulting glow-discharge.

## The API

The API is pretty simple and straight-forward.  Worth noting, in order to maintain simplicity
and reduce external dependencies, the driver does not perform any thread synchronization
internally, so if you call this API from more than one thread in your application, you need to
provide the synchronization yourself.

    int   sn74141_alloc(shift_register_t reg, int pinbase,
		sn74141_t *bcdp);

Allocates a handle for an instance of the BCD decoder.
Arguments:

* *sreg* -- The shift register to use as the input to the BCD decoder.
* *pinbase* -- The base of the 'A' pin of the BCD decoder relative to the least-significant
bit of the shift regisger.
* *bcdp* -- Output parameter used to return the handle to the caller.

Returns 0 on success or an **errno** code on failure.

    void  sn74141_free(sn74141_t bcd);

Frees a previously-allocated handle.
Arguments:

* *bcd* -- Valid register handle.

This call always succeeds.

    int  sn74141_set_digit(sn74141_t bcd, uint8_t digit);

Sets the logical digit on the BCD decoder to the specified value.  The value
**SN74141\_DIGIT\_BLANK** can be used to blank the digit.
Arguments:

* *bcd* -- Valid register handle.
* *digit* -- The digit to set; 0..9 or **SN74141\_DIGIT\_BLANK**.

Returns 0 on success or an **errno** code on failure.
 
