# MOSFET Pass Regulator

This is a regulator circuit intended for high voltage / low current applications (i.e. tube circuits)
with simple voltage regulation and ripple filtering requirements.  It has a provision for a power
resistor in series with the MOSFET drain in order to share some of the dissipation burden.

The circuit consists of a voltage divider, a series dropping resistor, a filter capacitor, and a
MOSFET pass element.  Both the upper and lower legs of the voltage divider each consist of
a pair of series resistors and another resistor in parallel to the series pair.  This combination of
3 resistors in each leg should provide sufficient flexibility for just about any configuration.  If
needed, flying leads to a potentiometer could also be used to dial-in a precise voltage.  A 1µF
630V film capacitor takes filters the gate voltage; when used in combination with a relatively
high-value upper voltage divider leg, a significant amount of ripple filtering can be achieved.

## Parts you'll need to build the board

There are a few specific components required to properly assemble this board.

* A TO-220 power MOSFET with a GDS pin configuration.  Pick a MOSFET with a suitable Vds rating; examples include IRF820 (500V), STF16N50M2 / STP16N50M2 (550V), or IXTP8N70X2M (700V).  The STF16N50M2 / STP16N50M2 is my go-to for most applications.
* An Aavid Thermalloy ML33G TO-220 heatsink, available from Mouser.  This heatsink has a flat back that sits right at the edge of the board, to give you the option to mount the board to the chassis by the heatsink itself.
* Panasonic ECW-FE2J105J 630V 1µF radial film capacitor, avaiable from Mouser, or equivalent.
* (Optional) Vishay Dale RS-series 10W wire-wound power resistor, if the application calls for it.  The board may accept other wire-wound power resistors, but the RS-series are what I used on mine, so your mileage may vary.
* (Optional) TE AMP 282843-3 screw terminal block, available from Mouser or Digi-Key.  You can opt to solder flying leads to the pads instead.

In addition, you'll need a few other parts based on your chosen configuration.  See the next
section.

## Example configurations

The following examples are meant to demonstrate this simple board's flexiiblity in a variety of
applications.  Please note the following component assignments (see schematic):

* Vin - Input supply from power rail
* Vout - Output from MOSFET source
* GND - Ground connection
* R1 - Upper voltage divider leg (between Vin and GND)
* R2 - Lower voltage divider leg (between Vin and GND)
* R3 and R4 - Series resistors in parallel with R1
* R5 and R6 - Series resistors in parallel with R2
* R7- Power resistor in series between Vin and MOSFET drain

### Capacitance Multiplier / ripple filter

This is probably the simplest configuration of the board, used simply to provide power supply
ripple filtering using a low-value capacitor.  You only need to select an appropriate resistor for
R1 in order to set the cut-off point of the low-pass filter.  For example, a 200K resistor would
set the cut-off point of the low pass filter to approx. 0.8Hz, which will provide a signifant amount
of filtering.  If the peak-to-peak ripple at Vin is already less than the MOSFET Vgs threshold
voltage (typically 2-4V for power MOSFETs), then you are good to go.  If the ripple coming in
is more than the MOSFET's threshold voltage, then you will need to add a lower leg to the voltage
divider in order to provide some additional headroom for ripple rejection (at the cost of a lower
nominal voltage output from the regulator and more heat dissipation from the MOSFET).  Install
a wire jumper in place of R7, and the board is ready for use.

### Zener-referenced Regulator

In this configuration, Zener diodes are used in the bottom leg of the voltage divider to set the
output voltage of the regulator.  Use either a single Zener in the R2 position or two Zeners in
series in the R5 and R6 positions.  The output voltage will be the summed Zener voltages minus
the MOSFET Vgs threshold voltage.  Please a resistor in position R1 to set the current (make sure
sufficient current is avaiable for the Zeners to regulate properly, without exceeding the Zener's
power rating).  The film capacitor will filter ripple as in the Capacitance Multiplier configuration,
as well as shunt Zener noise.

In this configuration, depending on how much voltage is being dropped by the MOSFET, it may
be useful to install a power resistor in position R7 to take some dissipation load off the MOSFET
at higher current levels.  Otherwise, install a wire jumper in place of R7.

As an example, consider a Vin of 600V, and a nominal Vout of 400V, with a steady current load of 20mA.
2 1N5388BG 200V 5W Zener diodes would be installed at R5 and R6, and a 100K resistor installled
at R1.  An 8.2K 10W power resistor is installed at R7.  R1 will dissipate 400mW (use a 1W-rated
part).  The Zeners in the R5 and R6 positions will also each dissipate 400mW.    R7 will dissipate
3.28W and drop 164V, meaning that the voltage at the MOSFET drain will be 436V.  The MOSFET
will drop ~38V (36V + Vgs) and dissipate 760mW.  Vout will be 398V.

### Floating / Proportional Regulator

This is similar to the Zener-referenced Regulator, but rather than using a fixed reference voltage,
a voltage divider is used to set the gate voltage of the MOSFET.  In this way, the output of the
regulator "floats" up and down with Vin, maintaining Vout as a fixed proportion of Vin.  Output
voltage will be the voltage at the junction of the voltage divider minus the MOSFET Vgs threshold
voltage.

In this configuration, depending on how much voltage is being dropped by the MOSFET, it may
be useful to install a power resistor in position R7 to take some dissipation load off the MOSFET
at higher current levels.  Otherwise, install a wire jumper in place of R7.

As an example, consider a Vin of 600V and a nominal Vout of 300V, with a current load that fluctuates
between 2mA and 30mA.  2 330K 1% resistors would be installed at R1 and R2.  A 4.7K 10W power
resistor is installed at R7.  R1 and R2 will dissipate 272mW and set the gate voltage at 300V.

At the low end of the current range (2mA):
* R7 will dissipate 18mW and drop 9.4V.   288.6 (577mW)
* The MOSFET will dissipate 577 mW and drop ~288.6V.

At the high end of the current range (30mA):
* R7 will dissipate 4.23W and drop 141V.
* The MOSFET will dissipate 4.7W and drop 157V
