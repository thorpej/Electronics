# EFB Bias Supply

## EFB - Enhanced Fixed Bias

This is a negative bias supply and regulator circuit for use in push-pull Class AB1 fixed bias output
stages of a tube power amplifier.  It is an adaptation of the "EFB II" circuit, developed by
David Gillespie and documented in this thread on AudioKarma: [Improving the Fisher SA-100 with EFB II](http://audiokarma.org/forums/index.php?threads/improving-the-fisher-sa-100-with-efb-ii.476431/).
The idea behind "EFB II" is to maintain the optimum relationship between the negative bias
voltage applied to the tube grids and a reference voltage (the screen supply voltage in a pentode
output stage; the plate supply voltage in an ultra-linear or triode output stage) at any power output
conditions, up to the maximum power the output stage is capable of delivering.  When the
reference voltage sags during, for example, maximum output conditions, the bias voltage will be
reduced (made less negative) proportionally to the change in reference voltage in order to maintain
the desired operating point (avoid an over-bias condition).  This leads to improved performance
(higher power output with less distortion) while also frequently leading to improved tube life
(because the output stage does not need to be under-biased in order to achieve maximum
performance under maximum power conditions).

David's circuit is very clever: a current is passed from the voltage reference through a sense
resistor.  This current produces a voltage drop across another resistor (or resistor network).
This voltage drop is inverted and buffered by a pair of PNP transistors that drive the bias
adjustment and balance network that is tied to the output tube grids.  Any change in the reference
voltage (up or down) results in a change in the sense current, resulting in a proportional change
in the voltage drop across the resistor(s) that set the base bias voltage.

This board is intended to more or less fully encapsulate a bias supply; it contains a half-wave
rectifier and two filter capacitors, in addition to the "EFB II" circuitry.  To use it, simply determine
what your "raw bias voltage" should be, plug in a few values into a handy spreadsheet I've
provided, and then install the calculated components onto the board, *et viola*!  It's tailored for
your particular application.

## Parts you'll need to build your EFB Bias Supply board

There are a few specific components required to properly assemble your EFB Bias Supply board.

* A PCB-mounted 50K linear trim pot, TE 409HA503M or equivalent.
* A rectangular radial .22µF (220nF) 50V film capacitor, Kemet SMR5224J50J02L16.5 or equivalent.
* A radial 100µF 250V electrolytic capacitor, 7.5mm lead spacing, up to 16.0mm diameter, Panasonic EEU-ED2E101 or equivalent.
* A radial 47µF 250V electrolytic capacitor, 5.0mm lead spacing, up to 12.5mm diameter, Panasonic EEU-ED2E470 or equivalent.

(All of the above mentioned parts are available from Mouser.)

You will also need:

* 2x 1N4007 diodes.
* 2x KSA1013 or equivalent PNP transistors in TO-92 packages, ECB pin configuration.

...plus a handful of resistors (see the following section about configuring the board), and optional
screw terminal blocks (you can opt to use flying leads if you wish).

Please note that the KSA1013 has a maximum Vce rating of -160V.  If your application requires
a bias voltage in excess of -70V, the KSA1013 may not be suitable.  If you can find another
PNP transistor with a suitable Vce rating in a TO-92 package with an ECB pin configuration, you
should be able to substitute it.  If there's sufficient interest, I could spin another revision of the
board that uses a different TO-92 pin configuration if a suitable high-voltage ECB transistor
proves elusive.  I chose the KSA1013 because that's what David used originally and the price
is right.  Note that higher-voltage transistors would also require higher-voltage electrolytic
capacitors.

## Configuring the EFB Bias Supply board

This board is meant to be flexible and configurable to make it easy to adapt to a wide variety
of amplifiier applications.  I've provided a handy EFB Bias Supply Calculator in the form of an
Excel spreadsheet that makes configuring the board for your application fairly easy.  The calculator
ignores things like diode forward voltage and transistor base-emitter voltage drop, but this has
barely any effect on the results because the voltages used with tube amplifiers are typically
much higher in comparison; these small errors are thus lost in the noise.

[Click here](https://github.com/thorpej/Electronics/blob/master/Tube_Audio/Helper_Circuits/EFB_Bias_Supply/EFB_Bias_Supply_Calculator.xlsx) to download the spreadsheet and get started!

### Step 1

Determine is your **Sense_Voltage**.  This is the nominal value you will be using as your
voltage reference for the circuit.  For a pentode output stage, this is the nominal screen grid
voltage.  For an ultra-linear or triode output stage, this is the voltage at the primary center tap
of the output transformer.  In the example spreadsheet, we will use 475V.

Enter the **Sense_Voltage** value into cell *B2* of the spreadsheet.

### Step 2

Determine your **Sense_Resistor** values.  The spreadsheet will suggest values that would
be appropriate for your specified **Sense_Voltage** in rows 5 and 6, along with the voltage
drop across those resistors so that you may select resistors with the appropriate voltage rating.
Select the nearest standard values with a 5% tolerance or better whose sum is reasonably close
to the target value in row 7.  A provision for two resistors is provided specifically in order to avoid
exceeding voltage ratings.  If you can safely use a single resistor, then use 0 for one of the resistor
values (and solder a wire jumper on the board in that location).

Enter your **Sense_Resistor** values into cells *B10* and *B11*.

The actual **Sense_Current** that will be generated in the circuit will be shown in cell
*H12*.  It should be reasonably close to 0.75mA (.00075A).

### Step 3

Determine your target **Raw\_Bias\_Voltage**.

The negative voltage produced by the EFB Bias Supply is not the voltage that will be directly
applied to the grids of the output tubes.  You will want some headroom to adjust up and down
from the nominal value that's appropriate for your application.  Let's say you have an output
stage design that calls for a -35V bias voltage; you might want to have that be the center of a
range that can swing as much as 15% in either direction (from -40.25V to -29.75V).  To get that
range, you're going to be feeding the "raw bias voltage" from the bias supply though a voltage
divider network (maybe individual bias pots for each output tube, or maybe a bias pot combined
with a balance pot for each push-pull pair).  In any case, to provide that -35V +/- 15% range,
you may need as much as -45V to -55V of "raw bias voltage".  Spend some time experimenting
with the included LTSpice simulations of bias / balance networks to determine the appropriate
raw bias voltage for your application.

Enter the **Raw\_Bias\_Voltage** into cell *B16*.

### Step 4

Determine your **Bias\_Set\_Resistor** value.  The spreadsheet will suggest a value that would
be appropriate for your specified **Raw\_Bias\_Voltage** that would allow the bias adjust pot
to be roughly centered.  Select the nearest standard value with a 5% tolerance or better.

Enter the **Bias\_Set\_Resistor** value into cell *B20*.

### Step 5

Determine your **Bias\_Balance\_Network\_Resistance** value.  This is the effective resistance
to ground of the bias / balance adjuster network (resistors and potentiometers).  Calculate this
with alll of the network's potentiometers centered to determine the nominal value.  Note that
several portions of your network may be in parallel to one another, and that you may need to
account for multiple instances of the network if your amplifier has more than one channel.  If you
have trouble calculating this manually, a great way to determine this reliabily is to simulate your
bias / balance circuit in LTSpice, measure the current flowing through the circuit in simulation,
and use Ohm's Law to calculate the resistance.

Enter the **Bias\_Balance\_Network\_Resistance** value in cell *B33*.

### Step 6

Determine your **auxillary bias supply current**, if any.  This is applicable if you are using the
**Vneg** terminal on the board to provide a voltage source for e.g. a long-tail pair tail circuit.

Enter the **auxillary bias supply current** value in cell *B38*.  If your application does not use
this feature of the board, enter the value 0.

### Step 7

Determine the AC voltage of your bias supply transformer secondary winding.  This is used to
estimate the **Raw\_Neg\_Voltage** that will be present at the bias supply rectifier and first
filter cap.  This is merely an estimate; it's always better to measure, but this estimate is a reasonable
approximation.

Enter the bias transfomer AC voltage in cell *B41*.

Whether you use the estimate or measure, enter the **Raw\_Neg\_Voltage** in cell *B47*.
Note that this voltage is also present at the **Vneg** terminal (see discussion in Step 6).

### Step 8

Determine your **Qpoint\_Dropping\_Resistor** value.  This resistor will drop the **Raw\_Neg\_Voltage**
to the quiescent **Qpoint_Voltage**, which should be roughly double the **Raw\_Bias\_Voltage**
in order to provide even voltage swing on either side of the **Raw\_Bias\_Voltage**.

The target Qpoint voltage drop is calculated by the spreadsheep and reported in cell *H46*.
A target resistor value is suggested by the spreadsheet in cell *H51*.  Select the nearest standard
value with a 5% tolerance or better.

Enter the **Qpoint\_Dropping\_Resistor** value in cell *B56*.

### Step 9

Determine your **Inverter\_Current\_Set\_Resistor** value.  This resistor will set the current of
the inverter transistor (Q1) based on the difference between **Qpoint_Voltage** and
**Raw\_Bias\_Voltage**.  The target current is 1.5mA (0.0015A).  The spreadsheet will suggest
a resistor value in row 60.  Select the nearest standard value with a 5% tolerance or better.

Enter the **Inverter\_Current\_Set\_Resistor** value in cell *B65*.  The resulting current calculated
by the spreadsheet will be displayed in cell *H64*, and should be reasonably close to 1.5mA.

### Step 10

It's time to install parts onto the board!  The spreadsheet will provide resistor values for
R1, R2, R3, R4, and R5 in rows 70-74.  The spreadsheet will also provide the initial bias adjuster
pot setting in row 77.

## Acknowledgements

Please let me know if you find this useful.  Thanks to Kevin Ward for reviewing this content and
providing several helpful suggestions.  And many thanks to David Gillespie for sharing this circuit
with the tube audio community.  Check out his work at [Tronola](http://www.tronola.com/html/dave_s_lab.html).
