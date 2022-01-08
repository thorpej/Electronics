# Remote Power Controller (controlled by Raspberry Pi)

**NOTE: This is provided for informational purposes only.  If you use this information,
or any of these design files, you do so at your own risk.**

This board is for, essentially, a remote-controlled power strip.  A Raspberry Pi Zero W (or a
Banana Pi M2 Zero) controls a Microchip MCP230008 I/O expander over I2C, which in turn drives
the outputs of a pair of ULN2003 Darlington arrays with open-collector outputs (7 on one, 1 on
the other, for a total of 8 outputs).  Each Darlington pair in the ULN2003 features a flyback
diode, making them suitable for driving inductive loads.

The ULN2003 outputs are connected to one end of the coil on a Rayex LB2-12DS-R DPDT relay, the other end being connected to a +12Vdc power supply.  The relay switches are connect to AC Mains input, switching both the hot and neutral leads.

A 12V - 5V @ 5A regulator provides power to the Raspberry Pi Zero W over the 40-pin GPIO header.
The regulator is attached to a relatively beefy Aavid ML33G heat sink.  A 2200µF reservoir
capacitor is provided to handle any transient current surges.

The console UART on the Raspberry Pi is brought out to a sepate 3-pin header on the board
for convenience.

The board will also accommodate a Banana Pi M2 Zero.  This board has the same basic footprint
as the Raspberry Pi Zero W, and also includes built-in WiFi.  The Banana Pi board also has
a compatible GPIO header.  _NOTE: The Banana Pi's console (debug) UART is routed to a separate
pin header on the Banana Pi itself; if you use a Banana Pi, you don't need to use the console
pin header on the power controller board; solder a pin header onto the Banana Pi board, and
use that for console I/O._.

The board's mains input should be fused with a 12A fuse, as that is the current rating of
the Rayex relays, and was used as a design parameter for the PCB.  The mains traces on the
PCB are capable of carrying a 12A load **_if and only if the board is fabricated with
2oz copper_**.  If the board is fabriacated with 1oz copper, then the mains input fuse should be limited to 6A.
