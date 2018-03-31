# IN-14 Nixie Tube Breakout Board

This is just a simple breakout board to make it easier to play around with IN-14 Nixie tubes
(or any other Nixie that uses the same basic footprint); I included some old Soviet iconography
on the board just for fun.

To use the board, thread the spindly IN-14 lead wires through the holes and solder it into place.
The arrow on the footprint indicates the anode lead wire, and corresponds to the arrow on the bottom
of the glass.  The R1 resistor footprint is for the required current-limiting resistor.  If your power
supply is already current-limited, yoiu can just place a jumper in this position.  Attach some standard
5.04mm pitch screw terminals and some standoffs with #4 machine screws and you're all set.

https://www.instagram.com/p/Bg9sY63FQ7b/

## Current-limiting Resistor Selection

Nixie tubes work like a neon bulb: a threshold voltage is required to light them up (the "striking"
voltage), and until that threshold is reached, they behave like an open circuit.  However, once the
gas ionizes and the glow discharge begins, the resistance drops very quickly to the low-1000s of Ohms.
In order to avoid destroying the tube, the current must be limited.  For IN-14s, the maximum allowable
current is 2.5mA for the digits (and quite a bit less for the decimal points; on the order of 0.5mA).

A fairly safe way to determine the initial value for your current limiting resistor is to use Ohm's Law
to calculate the resistor needed to drop the supply voltage at the max current.  So, if you have a 180V
supply, and wish to limit to 2.5mA, you would need a 72K resistor; 75K is close enough.  It's done this
way to guarantee that you will not exceed the max current through the tube.  The actual current drawn
in the next step will be significantly less than 2.5mA because there will be some voltage dropped across
the tube.

Now, hook up your Nixie with this resistor in-series with the anode and connect one of the cathodes to
ground, let the digit light up, and measure the voltage drop across the resistor.  For this example, we'll
say that 49V is dropped across the resistor.  Ths means that 0.7mA is flowing through the tube.  Now use
Ohm's law again to calculate a new resistor value to give you the desired current at the voltage drop
that you just measured.  In this case, I want 1mA to flow through my Nixies, which would mean a 49K resistor;
47K is the closest standard value which is what I'll use.  1/2W rating will be sufficient.  If you want
2.5mA to flow, a 22K resistor will get you close enough; I chose 1mA because I can't tell any difference
in brightness, and 1mA gives me plenty of safety margin and should extend the life of the tube.
