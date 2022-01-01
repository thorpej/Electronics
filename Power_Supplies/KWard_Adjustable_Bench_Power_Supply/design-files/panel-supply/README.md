# Panel supply

The panel supply board provides a regulated supply to the pass tube array's
cooling fan and the PSU's meters: B+ voltage, B+ current, and C- voltage.

The board is powered by a 12Vac @ 1A transformer, such as the Triad F5-12.
The AC input is rectified by a Rectron DB101 diode bridge chip, filtered,
and fed to an LM2940 12V LDO regulator.

The 12Vdc output for the cooling fan has a provision for a resistor that can
be used to limit the current or drop the voltage to the fan, if desired.  If
you don't want to put a resistor there, just install a jumper wire at the R1
position.  Note the resistor is mounted vertically (to save board space).

The board also has a provisions for 3 Murata MEE1S12xxDC DC-DC converters if
your panel meters have limited operating voltage ranges.  The use of these
DC-DC converters is optional; if your panel meters are capable of running
at 12Vdc (fixed, or have their own on-board regulators), then you can simply
install jumpers in those locations (standard DIP-8 pin numbering):

* Pin 4 to Pin 5 (+Vin to +Vout)
* Pin 1 to Pin 7 (-Vin to -Vout)

Refer to the MEE1S12xxDC data sheet if you have any questions about these
DC-DC converters or their pinouts.  If you look at the traces on the board,
it should be pretty obvious where the jumpers need to go.

There is room on the board for a small heat sink for the LM2940, if necessary,
although there is no dedicated footprint outline for it.  If your LM2940 is
getting warm, there are a variety of heat sinks availble from outlets such as
Amazon (just search for "TO-220 heatsink") that should fit in the slotted space.
