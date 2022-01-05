# Pass tube array

The pass tube array board holds the 6550 pentodes that are used as the
pass element for the Maida regulator on the [screen supply and regulator
board](../screen-supply-and-regulator).

This board is incredibly simple.  On one end of the board are terminals
for the 4 connections made to a beam pentode:

* Anodes / plates (_A_)
* Screens / G2 (S)
* Cathodes (K)
* Control grids (G)

The _A_ terminal connects to the output of the [B+ supply](../hv-supply).
The _S_, _K_, and _G_ terminals connect to the corresponding terminals on
the [screen supply and regulator board](../screen-supply-and-regulator).

On the other end of the board are terminals for the 6.3Vac filament supply
provided by the AkTek AS-4T400 power transformer that powers the B+ supply.

The board itself holds between 1 and 4 6550 pentodes, which are wired in
parallel.  Each 6550 supplies 100mA of current for the PSU output.  The
tubes installed should be a matched set so that they share the current
toughly equally.  10 Ohm ballast resistors in series with each 6550 cathode
aids in load sharing.

Each 6550 also contains a 150 Ohm screen protection resistor, in addition
to a 1K Ohm grid stopper resistor to suppress any oscillation.

The board has standard M3 mounting holes (one in each corner plus one in
the center), and is intended to be mounted in a location convenient to the
screen supply and regulator board.  The board should be mounted such that
the 6550s are in a vertical position.  The 12V DC fan should be mounted
such as to provide forced-air cooling to the pass tube array.

The board includes a virtual center tap to float the 6550 filament supply
on top of the 6550 cathode voltage.

## Parts list

Note that all resistors are 2W metal film unless specified otherwise.  The Mouser
part numbers provided here for standard resistors are for Vishay PR02-series, which
fit the footprints on the board.

* 4x PCB-mount octal tube sockets, [AES P-ST8-193](https://www.tubesandmore.com/products/socket-8-pin-octal-ceramic-pc-mount) or
equivalent (26mm pin circle diameter, 2mm pin width).
* 1x 2-position screw terminal block, 5.08mm pitch (CUI TB007-508-02BE or equivalent).
_Mouser part number 490-TB007-508-02BE._
* 1x 4-position screw terminal block, 10.16mm pitch (Molex 39910-0104 or equivalent).
_Mouser part number 538-39910-0104._
* 4x 1K Ohm resistors.
_Mouser part number 594-5083NW1K000J._
* 4x 150 Ohm resistors.
_Mouser part number 594-5083NW150R0J._
* 4x 10 Ohm resistors.
_Mouser part number 594-5083NW10R00J._
* 2x 220 Ohm resistors.
_Mouser part number 594-5083NW220R0J._
