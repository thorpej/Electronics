# Adjustable Bench Power Supply

This is a slight variation on an adjustable regulated bench power supply developed by
Kevin Ward and [documented on the AudioKarma forums](http://audiokarma.org/forums/index.php?threads/adjustable-bench-power-supply-redux.748700/)

The design is essentialy a Maida-style floating regulator that uses an array of 6550 pentodes
as the pass elements rather than a Darlington voltage follower as in the original Maida tech
note.  The 6550s also require a power supply for their screens, which also floats on the B+
rail's output voltage.  A major advantage of using pentode pass elements is the ability to
current-limit the supply, which is a natural result of how pentodes operate.  The current limit
could be adjusted by adjusting the 6550 screen supply voltage, although this feature is not
offered in this build.

There is also a current-limited negative bias supply that provides a nominal 0 - -100V adjustable
voltage range, in addition to an AC filament supply that can provide either 6.3Vac or 12.6Vac.

The main differences between this and Kevin's version are the transformers used.  Kevin's
build uses an Edcor XPWR133 for the B+ rail, floating 6550 screen supply, and the 6550 array's
heaters.  In my build, an AnTek AS-4T400 is used, which necessitates a separate transformer
for the floating 6550 screen supply.  I also opted to use a different transformer for the C-
rail.  The design is otherwise un-changed from Kevin's design.

The interesting files here are:

	1. B+Supply.asc: LTSpice simulation of the B+ rail with the adjustments necessary for the choke and transformer differences.
	2. ScreenSupply.asc: LTSpice simulation of the floating 6550 screen supply with adjustments necessary for a Triad F6-120 transformer.
	3. BiasSupply.asc: LTSpice simulation of the C- rail with adjustments necessary for a Triad F4-120 transformer.
	
The remaining materials are either directly from the AudioKarma thread about Kevin's work (copied
locally for convenience) or Spice models needed for the simulations.

To be added in the future:

	1. Chassis layout drawings.
	2. Control panel CAD file for submitting to Front Panel Express.
	3. Descriptions / photographs of the hand-wired circuit boards.  (What a pain; I should have done proper PCBs...)

## ADDENDUM

I am going to be rebuilding this project using proper PCBs!  Watch here for the KiCad design files!
