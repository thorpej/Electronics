# Driver for 8-bit Shift Registers

This is a driver for generic 8-bit shift registers, such as the 74HC595 or TPIC6B595.
Shift registers allow a relatively small number of pins on a microcontroller (3, typically) to
control a much larger number of pins - 8 or more - by shifting the bits one-by-one into
the shift register and then, once all of the bits have been shifted into place, atomically
moving them into a storage register which activates or deactivates the output pins of
the shift register chip.  The shift register chips can also be chained together to control even
an even larger number of pins.  This is typically done by tying the clock and latch pins of all
of the shift register chips together, and tying the overflow pin of one chip to the data pin of
the next.  In typical usage, the first register in the chain is the least-significant byte, and the
last in the chain is the most-significant.  The details vary from chip to chip, but they all work
pretty much the same way, and they typically all use a clock pin, a data pin, and a latch pin.

This driver uses a buffer to provide a virtualized view of the shift register chain.  By default,
when a bit is modified, the entire buffer is then shifted out and made active.  However, it
is possible to create a transaction to batch several bit changes into a single hardware
update.  The API allows for nesting transactions; only when the outer-most transaction is
closed is the hardware updated.

I wrote this driver to run in userspace on a NetBSD system, and so it uses the NetBSD
GPIO API (in the form of an ioctl) to communicate with the hardware.  Note that the NetBSD
API requires GPIO configuration to be performed at kern.securelevel = 0, so some addional
configuration of /etc/gpio.conf will be required in addition to use of this API.  This API does
not support using named GPIO pins in the NetBSD GPIO API, only numbered pins, but I
don't consider that to be a great burden.

The use of NetBSD-specific API is isolated to just a couple of functions and the rest of the
code is pretty vanilla POSIX / C99, so porting it to another platform should be pretty easy.
If you provide me with clean and tidy patches to make it run elsewhere, I'll be happy to
integrate them.  Likewise, if you successfully use this with chips other than the ones
mentioned above, let me know so I can make a note of it here.

## The API

The API is pretty simple and straight-forward.  Worth noting, in order to maintain simplicity
and reduce external dependencies, the driver does not perform any thread synchronization
internally, so if you call this API from more than one thread in your application, you need to
provide the synchronization yourself.

    int   shift_register_alloc(const char *gpio, int nbits,
		int clock_pin, int data_pin, int latch_pin,
		shift_register_t *sreg);

Allocates a handle for an instance of the register (or register chain).
Arguments:

* *gpio* -- Name of the GPIO controller instance device is attached to, e.g. "gpio0".
* *nbits* -- The number of bits to be managed by a shift register chain.  Must be a multiple
of 8.
* *clock_pin* -- The GPIO pin to which the shift register chain clock is attached.
* *data_pin* --The GPIO pin to which the data pin of the first shift register in the chain is
attached.
* *latch_pin* -- The GPIO pin to which the shift register chain latch (sometimes called
*storage register clock*) is attached.
* *sreg* -- Output parameter used to return the handle to the caller.

Returns 0 on success or an **errno** code on failure.

    void  shift_register_free(shift_register_t sreg);

Frees a previously-allocated register handle.
Arguments:

* *sreg* -- Valid register handle.

This call always succeeds.

    int  shift_register_transaction_begin(shift_register_t sreg);

Begins a transaction for batching a set of bit updates together.  Transactions can be
nested, and only completion of the outer-most transaction will cause the hardware to
be updated.
Arguments:

* *sreg* -- Valid register handle.

Returns 0 on success or an **errno** code on failure.  An error code of **ERANGE**
indicates that an attempt was made to start a new transaction when the maximum
number of transactions was already open.

    int  shift_register_transaction_end(shift_register_t sreg);

Ends the most recently-opened transaction.  If the outer-most transaction is being ended,
then the hardware will be updated.
Arguments:

* *sreg* -- Valid register handle.

Returns 0 on success or an **errno** code on failure.  An error code of **ERANGE**
indicates that there were no open transactions to end.  Otherwise, the an error indicates
a problem communicating with the hardware, in which case the transaction is still
considered to have been closed.

    int  shift_register_set_bit(shift_register_t sreg, int bit, bool val);

Sets the value of the specified bit to the indicated value (on or off).
Arguments:

* *sreg* -- Valid register handle.
* *bit* -- The bit value to change.  Must be in the range of 0 .. *nbits* as specified at
allocation time.
* *val* -- **true** to set the bit / pin to logical-1, **false** to set it to logical-0.

Returns 0 on success or an **errno** code on failure.
 
