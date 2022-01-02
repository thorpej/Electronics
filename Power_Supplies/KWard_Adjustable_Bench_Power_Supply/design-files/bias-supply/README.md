# Bias supply

The bias supply board provides an adjustable (0 - -100V), current-limted
(approximately 30mA) negative bias supply for the device-under-test, typically
used to bias the power output stages of an amplifier.

The board is powered by a a Triad F4-120 power transfomer, which is nominally
rated as 115Vac -> 120Vac @ 50ma.

The AC input is rectified by a Rectron DB107 diode bridge chip, filtered, and
fed to a MJE5371 PNP power transistor whose base is pinned to a -150V reference
voltage by a Zener diode, providing some voltage drop from the source voltage,
and taking some of the load off of the second MJE5371 PNP power transistor, whose
base is connected to a voltage divider made up of a fixed resistor and a precision
10-turn potentiometer (see note below).  A 1µF film cap at the output shunts out
any noise.

Current limiting is provided by a small KSA1013 PNP transistor (connected to the
base of the second MJE5371) and a 22 Ohm resistor.  As the current increases, the
voltage drop across the resistor increases, which gradually turns on the KSA1013,
which pulls the base of the second MJE5371 closer to GND (more positive), thus
reducing the negative bias voltage.  Note that this is a gradual effect; if there
is significant load on the bias supply, it will become gradually more difficult to
pull the voltage further negative.

Beacuse the second MJE5371 must drop considerable voltage, it dissipates quite a
bit more power than the first MJE5371 (which is merely disposing of excess voltage
from the power transformer).  It is therefore mounted to a much beefier heat sink
than the first MJE5371.  Space for a small fin-type heat sink for the first MJE5371
is provided, along with a specific Aavid part known to fit the footprint.  Other
small fin-type heat sinks may also fit in the alloted space.  However, it is
important that the two heat sinks DO NOT TOUCH, unless the MJE5371s are mounted
using a TO-220 insulated mounting kit (plastic screw bushing + mica sheet).

The board includes protection diodes for the 3 transistors as well as the output.

Note: The voltage adjustment divider contains a 10 Ohm fixed resistor to "back-stop"
the negative bias voltage because without it, the voltage can become positive with
the potentiometer at the full CCW position in simulation.  With this resistor in-place,
you may not be able to get the bias voltage to exactly 0V.  This may vary slightly
due to manufacturing tolerances.  If this is problematic for your application, feel
free to experiment with different resistor values, or to bypass the resistor entirely
with a jumper wire.

The board has standard M3 mounting holes, and is intended to be mounted on the
back of the PSU front panel using stand-offs.

## Parts list

Note that all resistors are 2W metal film unless specified otherwise.  The Mouser
part numbers provided here for standard resistors are for Vishay PR02-series, which
fit the footprints on the board.

* 1x Triad F4-120 power transformer or equivalent.
_Mouser part number 553-F4-120._
* 2x 2-position screw terminal blocks, 5.08mm pitch (CUI TB007-508-02BE or equivalent).
_Mouser part number 490-TB007-508-02BE._
* 2x 3-position screw terminal blocks, 5.08mm pitch (CUI TB006-508-03BE or equivalent).
_Mouser part number 490-TB006-508-03BE._
* 1x Rectron DB107 diode bridge (can substitude a Rectron DB105 or DB106, if desired).
_Mouser part number 583-DB107._
* 2x 220µF 250V electrolytic capacitor, up to 18mm diameter, 7.50mm lead spacing.
_Mouser part number 647-UCS2E221MHD._
* 1x 1µF 250V polypropylene film capacitor, rectangular form-factor, 18mm x 11mm, lead
spacing 15mm.
_Mouser part number 871-B32672L2105J000._
* 1x 1N5385B 150V 5W Zener diode.
_Mouser part number 863-1N5383BG._
* 4x 1N4007 diode.
_Mouser part number 621-1N4007G-T._
* 2x MJE5731 PNP transistors (TO-220 package).
_Mouser part number 863-MJE5731G._
* 1x KSA1013 PNP transistor (TO-92L package).
_Mouser part number 512-KSA1013YBU._
* 1x 100 Ohm resistor.
_Mouser part number 594-5083NW100R0JA100._
* 1x 330K Ohm resistor.
_Mouser part number 594-5083NW330K0J._
* 1x 10K Ohm resistor.
_Mouser part number 594-5083NW10K00J._
* 1x 39K Ohm resistor.
_Mouser part number 594-5083NW39K00J._
* 1x 10 Ohm resistor.
_Mouser part number 594-5083NW10R00J._
* 1x 22 Ohm resistor.
_Mouser part number 594-5083NW22R00J._
* 1x 1M Ohm resistor.
_Mouser part number 594-5083NW1M000F._
* 1x 100K 2W 10-turn panel-mount precision potentiometer.
_Mouser part number 652-3590S-2-104L._
* 1x Aavid Thermalloy ML33G TO-220 heat sink.
_Mouser part number 532-ML33G._
* 1x Aavid 577202B04000G TO-220 heat sink, or suitable substitute that
fits the available board space.
_Mouser part number 532-577202B04000G._
* **Optional but recommended** 2x insulated TO-220 mounting kit, such as
the Aavid 4880SG.
_Mouser part number 532-4880SG._
