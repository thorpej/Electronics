# B+ (HV) Supply

The B+, or high-voltage / high-tension supply, provides the power that is
ultimately delivered to the device-under-test by the PSU.  This part of
the PSU is made up of several large components that do not fit onto a PCB.
The one exception is the first stage of filter / reservoir capacitors,
for which you may wish to employ my [snap-in capacitor stack board](../../../../Tube_Audio/Helper_Circuits/SnapInCapStack), which makes it really easy to deal with the
capacitors spec'd in the schematic.

The B+ supply is powered by the AnTek AS-4T400 toroidal power transformer,
whch is nominally 2x 115Vac -> 400Vac @ 500mA plus 2x 6.3Vac @ 4A.  Each
pair of secondary windings are connected in parallel, providing a
400Vac @ 1A source and a 6.3Vac @ 8A source.

The high-voltage AC is recitfied (see note below) and CLC filtered by:
* A pair of United Chemi-Con E92L401VSN561MR65U 560µF 400V capacitors
(selected for their long life and ripple current rating).
* An Edcor XC100-1H-600mA choke.
* A pair of JJ 800µF 385V capacitors.

Each pair of capacitors are wired in series (a "stack") with 100K Ohm load sharing
resistors.  This results in a CLC filter of 280µF - 1H - 400µF.  The specified
choke has a DC resistance of 11 Ohms.  The output of the filter is fed to the
pass tube array's anode (_A_) terminal.

The 6.3Vac source is connected to the 6.3Vac input of the pass tube array
board and powers the 6550 heater filaments.

Note that the B+ supply's power transformer is switched by a separate switch
from the main PSU power switch, which is noted in the schematic wtih the
"_B+\_120Vac_" label.

Note: The recifier specified (a Vishay GBPC3510-E4/51) is, quite admittedly,
overkill.  That particular device is rated 1000V 35A, and is screw-mounted
with heat sinking capabilities.  I generally use this component because it is
convenient to mount, has quick-connect tabs, and is rated such that I will
never have to worry about it.  4 1N4007s (or UF4007s, which is what Kevin used
in his original build) configured as a diode bridge are a perfectly acceptable
substitute.

## Parts list

Note that all resistors are 2W metal film unless specified otherwise.  I am
not specifying a specific part for the resistors here, since they don't need
to fit a PCB footprint; use whatever you have handy, or order your favorite.

* 1x AnTek AS-4T400 power transformer, or equivalent, available directly
from [AnTek](https://www.antekinc.com/as-4t400-400va-400v-transformer/).
* 1x Vishay GBPC3510-E4/51 or equivalent diode bridge.
_Mouser part number 625-GBPC3510-E4._
* 2x United Chemi-Con E92L401VSN561MR65U 560µF 400V electrolytic
capacitors, or equivalent.
_Mouser part number 661-E92L401SN561MR65._
* 1x Edcor XC100-1H-600mA choke, or equivalent, available directly
from [Edcor USA](https://edcorusa.com/products/xc100-1h-600ma-1h-600ma-choke).
* 2x JJ TC309 800µF 385V electrolytic capacitors,
or equivalent, available from [AES](https://www.tubesandmore.com/products/capacitor-jj-electronics-385v-800-f-electrolytic).
* 4x 100K Ohm resistors.
* Miscellaneous mounting hardware, terminal strips, etc., depending on your build.
