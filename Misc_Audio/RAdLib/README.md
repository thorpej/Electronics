# The RAdLib - An OPL2 FM synthesizer board for Raspberry Pi

**NOTE: This is a work-in-progress.  Watch this space for updates.**

This project is an attempt to being the glorious sound of the classic
AdLib sound card to the Raspberry Pi (and other single-board computers
with a compatible 40-pin GPIO header).  If you think this is a dumb
idea, you're right!  That's really the whole point, actually.  (Well, that
and I wanted to practice with more complex PCB layouts.)

This borrows a lot from Sergey Malinov's
[ISA OPL2 Card](http://www.malinov.com/Home/sergeys-projects/isa-opl2-card).

The OPL2 synthesizer circuit is essentially lifted from Sergey's board.
Because there's no ISA bus clock on the Raspberry Pi, used a self-contained
3.58MHz crystal oscillator in a DIP-8 "half-can" package.  My main task was
to interface the OPL2 to the Raspberry Pi.

Even though practically all software for the OPL2 treats it as a write-only
device, technically here is a status register that is accessed when you
issue a read cycle with the A0 pin low.  The only documented function of this
status register is to report if the OPL2 is asserting its interrupt line,
and which of the 2 timers is responsible for the interrupt.  I wasn't able
to find any software that actually uses the timer (and interrupt) capabilities
of the OPL2.  The only use for reading the status register I've seen is for
using undocumented bits to determine if the chip is an OPL2 or OPL3.  But
one of my goals was for the board to be able to do everything the original
AdLib could do, and that included reading the status register and generating
an interrupt.

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
(software) timing artifacts.

So, I scrapped the SPI idea and decided to go with a naive
drive-each-Dx-pin-directly approach.  More to come.

**NOTE: This is a work-in-progress.  Watch this space for updates.**

