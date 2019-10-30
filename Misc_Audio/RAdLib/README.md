# The RAdLib - An OPL2 FM synthesizer board for Raspberry Pi

**NOTE: This is a work-in-progress.  Watch this space for updates.**

This project is an attempt to being the glorious sound of the classic
AdLib sound card to the Raspberry Pi (and other single-board computers
with a compatible 40-pin GPIO header).  If you think this is a dumb
idea, you're right!  That's really the whole point, actually.  (Well, that
and I wanted to practice with more complex PCB layouts.)

This borrows a lot from Sergey Malinov's
[ISA OPL2 Card](http://www.malinov.com/Home/sergeys-projects/isa-opl2-card).

The OPL2 synthesizer circuit and audio output stage is essentially lifted
from Sergey's board and then adapted to the Raspberry Pi environemnt:

* Because there's no ISA bus clock on the Raspberry Pi, I used a
self-contained 3.58MHz crystal oscillator in a DIP-8 "half-can" package.
* Because there is no +12V/-12V split rail supply on the Raspberry Pi,
the entire analog section of the board needed to be reworked.

## Bus Interface

Even though practically all software for the OPL2 treats it as a write-only
device, technically here is a status register that is accessed when you
issue a read cycle with the A0 pin low.  The only documented function of this
status register is to report if the OPL2 is asserting its interrupt line,
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

I initially thought about using SPI as the data interface between the host
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
able to read the OPL2 status register (a goal of the project, as stated
above).  To support reading the OPL2 data lines (which may output voltages
in excess of 3.3V) safely, we need to use a bus transciever to level-shift
down to 3.3V CMOS logic levels.  For this we use a 74LVC245A bus transceiver.
The 74LVC245A's Vcc is connected to the 3.3V rail and has 5.5V-tolerant
inputs.  This transciever pass through the 3.3V signals on writes to the OPL2
and level shifts the signals from the OPL2 on reads.  The OPL2 is connected
to the "A" side of the 74LVC245A, and the Raspberry Pi is connected to the "B"
side.

The A0, /CS, and /RST control signals can be connected directly to the OPL2.

The READ signal needs to be converted into two discrete active-low control
signals for the OPL2: /RD and /WR.  Conveniently, READ being low translates
directly to /WR, and so it is directly connected to the OPL2.  We also
connect this signal to the DIR pin of the 74LVC245A.  When READ is low, B
is the input and A is the output.  When the READ signal goes high, A is
the input and B is the output.  That just leaves generating the /RD signal
at the OPL2.  This is achieved by connecting the /RD pin to Vcc with a 4.7K
resistor and to GND using a discrete MOSFET.  The MOSFET is turned on by
the READ signal going high, which pulls the OPL2 /RD pin to GND.

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

The original AdLib also includes an audio power amplifier IC to drive
headphones or a small loudspeaker.  Contemporary ISA AdLib clones typically
use an LM386 connected to the +12V rail for this purpose.  Again, the
Raspberry Pi does not have adequate power supply headroom in order to provide
any voltage gain, so we will have to be content with the 2.5Vpp swing we get
from the DAC, and rely on an external power amplifier with a line-level
input to drive a loudspeaker.  However, I still want to include a volume
control.  The high side of the volume control pot is AC-coupled to the output
of the filter circuit, and the wiper is AC-coupled to an emitter-follower
to isolate the volume control from the load connected to the output jack.
AC coupling is used on either side of the volume control to deep DC off of
the pot (no one likes scratchy volume controls).  The 2N3904 is biased with
a voltage divider taken off the +5V rail.  This should be capable of driving
any line-level output, and may also be able to drive headphones to some degree.

As built, unfortunately, this uses 3 large electrolytic caps to maintain
the flat frequency response, but I don't think it's the end of the world.

**NOTE: This is a work-in-progress.  Watch this space for updates.**

