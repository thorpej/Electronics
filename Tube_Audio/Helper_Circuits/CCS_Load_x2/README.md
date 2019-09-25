# Constant Current Source for plate load

This is a simple solid-state constant current source board intended for
use as a plate load in a triode or pentode voltage gain stage.  It is based
on the IXYS 10M45S 3-pin current regulator.  An IXYS 10M90S can be substituted
if you _really_ need the increased voltatge rating, but I suspect that you
don't.  A CCS plate loads provide a near "infinite" resistance to a loaded
device, resulting in a nearly horizontal load line.  This results in maximized
gain (nearly achieving the mu of the loaded device) and reduced distortion.
I have used this board to provide the plate load for a low-gain Hi-Fi pre-amp
based on power triodes.

This circuit is pretty simple: The high-voltage supply is connected to the
anode of each 10M45S, and the cathode of each 10M45S is connected to one
output channel.  A 1K linear trim pot is provided to dial-in the desired
current for each channel.  The channel's current may be sensed at the 10R 1%
resistor that's in series with the trim pot.

Board space is allocated for heat sinks, but you probably won't need any as
beefy as afforded.  In a typical application, you're dropping less than 200V
across the CCS, at currents less than 7mA.  (I.e. typically less than 1.5
watts.) If you need any heat sink at all, those small fin-type sinks will
probably suffice (that's what I use most of the time).
