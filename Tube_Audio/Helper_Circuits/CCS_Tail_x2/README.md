# Constant Current Sink for Long Tail Pair

This is a simple solid-state constant current sink board intended for differential pair amplifiers such as the long tail pair phase inverter.
It is based on the IXYS 10M45S 3-pin current regulator.
An IXYS 10M90S can be substituted if you _really_ need the increased voltatge rating, but I suspect that you don't.
The main advantage of using a CCS in the tail of a long tail pair is that nearly perfect balance will result;
any current drop in one half of the LTP results in an equal current increase in the other half.
I use this circuit frequently in Hi-Fi amplifiers (usually Mullard 5-20 style topology), so I decided to have some boards made to save me some time.

The circuit is pretty simple: the cathode of each half of the LTP connects to one of the channel inputs.
The board shares a common ground.  A 1K linear trim pot is provided to dial-in the desired current for each channel.
The channel's current may be sensed at the 10R 1% resistor that's in series with the trim pot.

Board space is allocated for heat sinks, but you probably won't need any as beefy as afforded.
In a typical application, you're dropping less than 200V across the tail, at currents less than 15mA.
(I.e. typically less than 3 watts.)
If you need any heat sink at all, those small fin-type sinks will probably suffice (that's what I use).
