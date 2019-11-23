# The RAdLib - An OPL2 FM synthesizer board for Raspberry Pi

**NOTE: This is a work-in-progress.  Watch this space for updates.**

This project is an attempt to being the glorious sound of the classic
AdLib sound card to the Raspberry Pi (and other single-board computers
with a compatible 40-pin GPIO header).  If you think this is a dumb
idea, you're right!  The purpose of the project is really to teach myself
and practice some design techniques and apply them to a piece of obsolete
technology with no practical application other than one of simple amusement.

My intent is for the board to be, to the extent possible, "100% software-
compatible" with the original AdLib, which was esentially the thinnest of
wrappers around the YM3812 "OPL2" synthesizer chip.  Practically speaking,
this means exposing all of the same capabilities of the OPL2 synthesizer
to the host system; obviously there are going to be some software-visible
differences because the Raspberry Pi does not have an ISA bus.

The OPL2 synthesizer circuit is essentially lifted from Sergey Malinov's
[ISA OPL2 Card](http://www.malinov.com/Home/sergeys-projects/isa-opl2-card),
and the analog section of the board is inspired by it, but has been reworked
to fit within the constraints of the Raspberry Pi's power supply.  The
bus interface, of course, is completely different.

## Bus Interface

The original AdLib is an 8-bit ISA card with fairly straight-forward address
decode logic that allows it to be accessed at one of 4 jumper-selectable
I/O-mapped addresses.  It occupies 2 bytes of I/O space.  The address decode
logic on the board is responsible for asserting the OPL2's /CS signal, and
the OPL2's /RD, /WR, and A0 signals are responsible for selecting which
internal register the bus cycle will access.  The OPL2 also has 0 data
signals, D[0-7].  /CS, /RD, and /WR are active-low.  The OPL2 responds
to these signals as follows:

* /CS=0, /RD=1, /WR=0, A0=0: write to the OPL2 index register (selects
which internal register to access)
* /CS=0, /RD=1, /WR=0, A0=1: write to the OPL2 data register (writes
this data to the previously selected internal register)
* /CS=0, /RD=0, /WR=1, A0=0: read the OPL2 status register
* /CS=1, /RD=x, /WR=x, A0=x: D[0-7] are high-Z
* The result of all other signal combinations is undefined.

As you can see, sending a command to the OPL2 requires two write cycles
(one for the index register, one for the data register).

The original AdLib is also capable of interrupting the host in the event
the host wants to use the built-in timers.  This was achieved by routing
the open-drain /IRQ signal of the OPL2 though a 7404 inverter to drive
one of the jumper-selected active-high ISA IRQ lines.

On the original AdLib, the clock is derived from the ISA bus clock.  We
have no such clock on the Raspberry Pi, so the clock is provided by a
3.58MHz crystal oscillator module in a DIP-8 "half-can" package.

Even though practically all software for the OPL2 treats it as a write-only
device, here is a status register that is accessed when you issue a read
cycle with the A0 pin low.  The only documented function of this status
register is to report if the OPL2 is asserting its interrupt line,
and which of the 2 timers is responsible for the interrupt.  I wasn't able
to find any (modern) software that actually uses the timer (and interrupt)
capabilities of the OPL2.  The only use for reading the status register I've
seen is for using undocumented bits to determine if the chip is an OPL2 or
OPL3.  But one of my goals was for the board to be able to do everything the
original AdLib could do, and that included reading the status register and
generating an interrupt.

At the bare minimum, there are 8 data lines and 5 non-data lines (A0,
READ/WRITE, CS, RESET, and IRQ) needed to interface to the OPL2.
Technically, the OPL2 has separate inputs for READ and WRITE, but a single
signal from the host can be used to generate both.  The data lines need to
be bi-directional.  A0, READ/WRITE, CS, and RESET are host->OPL2, and IRQ
is OPL2->host.  All of the control signals except A0 are active-low on the
OPL2.

I initially considered using SPI as the data interface between the host
and the RAdLib.  But this would have required an additional logic to trigger
loading of parallel-to-serial shift register from the OPL D[0..7] pins at
the right time after the OPL /CS and /RD signals are asserted in the read
case (which as stated before, is exceedingly rare).  The software overhead
of setting up the SPI transfers for each OPL2 register access also seemed
like it could be excessive and possibly difficult to avoid unpredictable
(software) timing artifacts.  It would have been hardware-intensive, as well;
2 shift registers (one for each direction) would have been required.

So, I scrapped the SPI idea and decided to go with a naive
drive-each-Dx-pin-directly approach.

Before we get into the details, here are the signals between the Raspberry
Pi and the OPL2 used by the RAdLib:

* D[0-7]: Bi-directional data signals
* A0: Address bit 0 (active high)
* READ: Indicates that the bus cycle is a READ access (active high)
* /CS: Chip-select (active low)
* /RST: OPL2 reset (active low)

The main challenge interfacing the OPL2 to the Raspberry Pi is that the
OPL2 is a CMOS device that uses 5V TTL logic levels, whereas the Raspberry
Pi's GPIO uses 3.3V CMOS logic levels.  This is not a problem for writing
to the OPL2, because a 3.3V CMOS logical "1" is 2.4V, which is above the
2V input threshold of TTL.  However, it is a problem if you want to be
able to read the OPL2 status register.  To support reading the OPL2 data
lines (which may output voltages in excess of 3.3V) safely, we need some
logic to level-shift the 5V TTL data signals from the OPL2 down to 3.3V CMOS
logic levels.  For this we use a 74LVC245A bus transceiver.  The 74LVC245A's
Vcc is connected to the 3.3V rail and has 5.5V-tolerant inputs.  The
transciever passes through the 3.3V signals on writes to the OPL2 and
level-shifts the signals from the OPL2 on reads.  The OPL2 is connected
to the "A" side of the 74LVC245A, and the Raspberry Pi is connected to
the "B" side.

The A0, /CS, and /RST control signals can be connected directly to the OPL2.

The READ signal needs to be converted into two discrete active-low control
signals for the OPL2: /RD and /WR.  Conveniently, READ being low translates
directly to /WR, and so it is directly connected to the OPL2.  We also
connect this signal to the DIR pin of the 74LVC245A.  When READ is low, B
is the input and A is the output.  When the READ signal goes high, A is
the input and B is the output.  That just leaves generating the /RD signal
at the OPL2.  This is achieved by connecting the OPL2 /RD pin to Vcc with
a 4.7K resistor and to GND using a discrete MOSFET.  The MOSFET is turned
on by the READ signal going high, which pulls the OPL2 /RD pin to GND.

## Active Filter

The original AdLib features an active low-pass filter comprised of 2
op-amps in a Butterworth configuration.  Simulation of this circuit
shows a voltage gain of 8dB with a flat response to 10KHz, is 3dB down
at 15KHz, and is 10dB down at 20KHz.

Unfortunately, the performance of this circuit relies on the headroom
afforded by the +12V/-12V split rail supply available on the ISA bus.
No such headroom is available on the Raspberry Pi; all we have is a
+5V rail.

The YM3014B DAC outputs a signal from 1/4 Vcc to 3/4 Vcc.  This means a
maximum output sine wave is centered at +2.5V and has a voltage swing of
2.5Vpp (slightly higher than a standard consumer line-level output).  This
leaves us with very little headroom to amplify the signal for the filter.

This required a re-work of the 2-stage active low-pass filter.  The reworked
filter achieves unity gain and performance similar to that of the original
filter circuit, but requires the use of a rail-to-rail op-amp.

## Audio Output Section

The original AdLib also includes an LM386 audio power amplifier IC connected
to the +12V/-12V rails to drive headphones or a small loudspeaker.  Again, the
Raspberry Pi does not have adequate power supply headroom in order to provide
any voltage gain, so we will have to be content with the 2.5Vpp swing we get
from the DAC, and rely on an external power amplifier with a line-level
input to drive a loudspeaker.  However, I still wanted to include a volume
control.  The high side of the volume control pot is AC-coupled to the output
of the filter circuit, and the wiper is AC-coupled to an emitter-follower
to isolate the volume control from the load connected to the output jack.
AC coupling is used on either side of the volume control to deep DC off of
the pot (no one likes scratchy volume controls).  The 2N3904 is biased with
a voltage divider taken off the +5V rail.  This should be capable of driving
any line-level output, and may also be able to drive headphones to some degree.

As built, unfortunately, this uses 3 large electrolytic caps to maintain
the flat frequency response, but I don't think it's the end of the world.

## Bill of Materials

You can source most of the components at Mouser.  Links to individual
components follow.

All resistors are 1/8W 1%.

* 6x .1uF ceramic capacitor (C1, C2, C3, C4, C201, C203) [Mouser 81-RHSN12A104K1DGH1A](https://www.mouser.com/ProductDetail/81-RHSN12A104K1DGH1A)
* 4x 10uF tantalum capacitor (C5, C6, C7, C51, C202) [Mouser 581-TAP106K016SCS](https://www.mouser.com/ProductDetail/581-TAP106K016SCS)
* 1x 680pF ceramic capacitor (C52) [Mouser 81-RCER72A681K0DBH3A](https://www.mouser.com/ProductDetail/81-RCER72A681K0DBH3A)
* 2x 1000pF ceramic capacitor (C53, C56) [Mouser 81-RCER72A102K0DBH3A](https://www.mouser.com/ProductDetail/81-RCER72A102K0DBH3A)
* 2x 100pF ceramic capacitor (C54, C57) [Mouser 594-K101K15C0GH5TK2](https://www.mouser.com/ProductDetail/594-K101K15C0GH5TK2)
* 1x 470pF ceramic capacitor (C55) [Mouser 81-RCER72A471K0DBH3A](https://www.mouser.com/ProductDetail/81-RCER72A471K0DBH3A)
* 3x 220uF electrolytic capacitor (C58, C59, C61) [Mouser 75-516D227M016MM6AE3](https://www.mouser.com/ProductDetail/75-516D227M016MM6AE3)
* 1x .047uF ceramic capacitor (C60) [Mouser 81-RCER72A473K1DBH3A](https://www.mouser.com/ProductDetail/81-RCER72A473K1DBH3A)
* 1x 10-position break-away 2.54mm vertical header (J2, J3, J4, JP1) [Mouser 538-22-28-5101](https://www.mouser.com/ProductDetail/538-22-28-5101)
* 1x Audio jack (J5) [Mouser 806-STX-31203B577C](https://www.mouser.com/ProductDetail/806-STX-31203B577C)
* 1x 2N3904 NPN transistor (Q1) [Mouser 610-2N3904](https://www.mouser.com/ProductDetail/610-2N3904)
* 1x 2N7000 N-channel MOSFET (Q201) [Mouser 512-2N700](https://www.mouser.com/ProductDetail/512-2N7000)
* 5x 10K resistor (R1, R2, R3, R4, R9) [Mouser 270-10K-RC](https://www.mouser.com/ProductDetail/270-10K-RC)
* 2x 1K resistor (R5, R7) [Mouser 270-1K-RC](https://www.mouser.com/ProductDetail/270-1K-RC)
* 1x 2.7K resistor (R6) [Mouser 270-2.7K-RC](https://www.mouser.com/ProductDetail/270-2.7K-RC)
* 3x 10R resistor (R8, R10, R11) [Mouser 270-10-RC](https://www.mouser.com/ProductDetail/270-10-RC)
* 5x 3.3K resistor (R201, R202, R203, R204, R205) [Mouser 270-3.3K-RC](https://www.mouser.com/ProductDetail/270-3.3K-RC)
* 1x 10K audio taper potentiometer (RV1) [Mouser 652-91A1A-B24-D15L](https://www.mouser.com/ProductDetail/652-91A1A-B24-D15L)
* 1x OP495 op amp (U3) [Mouser 584-OP495GPZ](https://www.mouser.com/ProductDetail/584-OP495GPZ)
* 1x 74LVC245A bus transciever (U201) [Mouser 595-SN74LVC245ANE4](https://www.mouser.com/ProductDetail/595-SN74LVC245ANE4)
* 1x XXX 24Cxx serial EEPROM (U204) (optional)
* 1x DIP-8 3.579545MHz crystal oscillator (X1) [Mouser 520-TCH357X](https://www.mouser.com/ProductDetail/520-TCH357-X)

I sourced the female connector that mates to the Raspberry Pi from
Adafruit.  If someone has a Mouser part # for an equivalent part,
please share it with me!

* 1x Tall 2x20 female header (J1) [Adafruit 1992](https://www.adafruit.com/product/1992)

Things you'll need to find yourself (on eBay, perhaps):

* 1x Yamaha YM3812 (U1)
* 1x Yamaha YM3014B (U2)

I provisioned space for sockets for the expensive / old-stock / optional ICs.
You can get these from Jameco, Amazon, etc.

* YM3812 (U1) - DIP-24 15.24mm
* YM3014B (U2) - DIP-8 7.62mm
* OP495 (U3) (most expensive part) - DIP-14 7.62mm
* 24Cxx (U204) (optional) - DIP-8 7.62mm

**NOTE: This is a work-in-progress.  Watch this space for updates.**

