EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "KWard Bench PSU - High Voltage supply"
Date "2022-01-06"
Rev "1.0"
Comp "Copyright (c) 2017-2021 Kevin Ward and Jason R. Thorpe. See LICENSE."
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Transformer_1P_2S T1
U 1 1 61CEBEA3
P 3000 3500
F 0 "T1" H 3000 4150 50  0000 C CNN
F 1 "AnTek AS-4T400 (HV)" H 3000 4050 50  0000 C CNN
F 2 "" H 3000 3500 50  0001 C CNN
F 3 "~" H 3000 3500 50  0001 C CNN
	1    3000 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:Transformer_1P_2S T2
U 1 1 61CF194C
P 3000 4450
F 0 "T2" H 3000 3950 50  0000 C CNN
F 1 "AnTek AS-4T400 (Filament)" H 3000 3850 50  0000 C CNN
F 2 "" H 3000 4450 50  0001 C CNN
F 3 "~" H 3000 4450 50  0001 C CNN
	1    3000 4450
	1    0    0    -1  
$EndComp
Text Notes 2200 2750 0    50   ~ 0
AnTek AS-4T400 has 2 400V @ 500mA secondary windings.\nWire them in parallel for the HV supply.
Text Notes 2200 5350 0    50   ~ 0
AnTek AS-4T400 has 2 6.3V @ 4A secondary windings.\nWire them in parallel for the 6550 filament supply.
Text Notes 2200 2150 0    50   ~ 0
AnTek AS-4T400 has 2 primary windings.  Wire them in parallel\nfor a 120VAC @ 60Hz mains supply.  Note the primary is nominal\n115V / 230V, but all simulations have been performed assuming\n120V mains voltage.
Wire Wire Line
	2600 4250 2400 4250
Wire Wire Line
	2400 4250 2400 3300
Wire Wire Line
	2400 3300 2600 3300
Wire Wire Line
	2600 3700 2500 3700
Wire Wire Line
	2500 3700 2500 4650
Wire Wire Line
	2500 4650 2600 4650
Wire Wire Line
	2400 3300 2200 3300
Connection ~ 2400 3300
Wire Wire Line
	2500 4650 2200 4650
Connection ~ 2500 4650
Text GLabel 2200 3300 0    50   Input ~ 0
B+_120Vac
Text GLabel 2200 4650 0    50   Input ~ 0
B+_120Vac
Wire Wire Line
	3400 4050 3600 4050
Wire Wire Line
	3600 4050 3600 4550
Wire Wire Line
	3600 4550 3400 4550
Wire Wire Line
	3400 4350 3500 4350
Wire Wire Line
	3500 4350 3500 4850
Wire Wire Line
	3500 4850 3400 4850
Wire Wire Line
	3600 4050 3800 4050
Connection ~ 3600 4050
Wire Wire Line
	3500 4850 3800 4850
Connection ~ 3500 4850
Text GLabel 3800 4050 2    50   Output ~ 0
6.3Vac
Text GLabel 3800 4850 2    50   Output ~ 0
6.3Vac
Wire Wire Line
	3400 3100 3600 3100
Wire Wire Line
	3600 3100 3600 3600
Wire Wire Line
	3600 3600 3400 3600
Wire Wire Line
	3400 3400 3500 3400
Wire Wire Line
	3500 3400 3500 3900
Wire Wire Line
	3500 3900 3400 3900
$Comp
L Device:D_Bridge_+-AA D1
U 1 1 61CF6937
P 5050 3500
F 0 "D1" H 5250 3900 50  0000 L CNN
F 1 "Vishay GBPC3510-E4/51" H 5250 3800 50  0000 L CNN
F 2 "" H 5050 3500 50  0001 C CNN
F 3 "~" H 5050 3500 50  0001 C CNN
	1    5050 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3900 5050 3900
Wire Wire Line
	5050 3900 5050 3800
Connection ~ 3500 3900
Wire Wire Line
	3600 3100 5050 3100
Wire Wire Line
	5050 3100 5050 3200
Connection ~ 3600 3100
$Comp
L Device:CP1 C1
U 1 1 61CF9678
P 5800 3650
F 0 "C1" H 5915 3696 50  0000 L CNN
F 1 "560µF" H 5915 3605 50  0000 L CNN
F 2 "" H 5800 3650 50  0001 C CNN
F 3 "~" H 5800 3650 50  0001 C CNN
F 4 "661-E92L401SN561MR65" H 5800 3650 50  0001 C CNN "Mouser"
	1    5800 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 61CFA233
P 6300 3650
F 0 "R1" H 6370 3696 50  0000 L CNN
F 1 "100K" H 6370 3605 50  0000 L CNN
F 2 "" V 6230 3650 50  0001 C CNN
F 3 "~" H 6300 3650 50  0001 C CNN
	1    6300 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C2
U 1 1 61CFA853
P 5800 3950
F 0 "C2" H 5915 3996 50  0000 L CNN
F 1 "560µF" H 5915 3905 50  0000 L CNN
F 2 "" H 5800 3950 50  0001 C CNN
F 3 "~" H 5800 3950 50  0001 C CNN
F 4 "661-E92L401SN561MR65" H 5800 3950 50  0001 C CNN "Mouser"
	1    5800 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 61CFA978
P 6300 3950
F 0 "R2" H 6370 3996 50  0000 L CNN
F 1 "100K" H 6370 3905 50  0000 L CNN
F 2 "" V 6230 3950 50  0001 C CNN
F 3 "~" H 6300 3950 50  0001 C CNN
	1    6300 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3800 6300 3800
Connection ~ 5800 3800
Connection ~ 6300 3800
Wire Wire Line
	5800 3500 6300 3500
Wire Wire Line
	5800 4100 6300 4100
Text Notes 5150 4650 0    50   ~ 0
First set of filter caps are 400V\nUnited Chemi-Con E92L401VSN561MR65U\n(selected for high ripple current rating and\n10000 hour lifetime rating).
$Comp
L power:GND #PWR01
U 1 1 61CFBDA3
P 5800 4100
F 0 "#PWR01" H 5800 3850 50  0001 C CNN
F 1 "GND" H 5805 3927 50  0000 C CNN
F 2 "" H 5800 4100 50  0001 C CNN
F 3 "" H 5800 4100 50  0001 C CNN
	1    5800 4100
	1    0    0    -1  
$EndComp
Connection ~ 5800 4100
$Comp
L Device:L L1
U 1 1 61CFC4F7
P 6850 3500
F 0 "L1" V 7040 3500 50  0000 C CNN
F 1 "1H" V 6949 3500 50  0000 C CNN
F 2 "" H 6850 3500 50  0001 C CNN
F 3 "~" H 6850 3500 50  0001 C CNN
	1    6850 3500
	0    -1   -1   0   
$EndComp
Text Notes 7950 3250 2    50   ~ 0
Edcor XC100-1H-600mA (11 ohms DCR)
$Comp
L Device:CP1 C3
U 1 1 61D01295
P 7400 3650
F 0 "C3" H 7515 3696 50  0000 L CNN
F 1 "800µF" H 7515 3605 50  0000 L CNN
F 2 "" H 7400 3650 50  0001 C CNN
F 3 "~" H 7400 3650 50  0001 C CNN
	1    7400 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 61D0129B
P 7900 3650
F 0 "R3" H 7970 3696 50  0000 L CNN
F 1 "100K" H 7970 3605 50  0000 L CNN
F 2 "" V 7830 3650 50  0001 C CNN
F 3 "~" H 7900 3650 50  0001 C CNN
	1    7900 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C4
U 1 1 61D012A1
P 7400 3950
F 0 "C4" H 7515 3996 50  0000 L CNN
F 1 "800µF" H 7515 3905 50  0000 L CNN
F 2 "" H 7400 3950 50  0001 C CNN
F 3 "~" H 7400 3950 50  0001 C CNN
	1    7400 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 61D012A7
P 7900 3950
F 0 "R4" H 7970 3996 50  0000 L CNN
F 1 "100K" H 7970 3905 50  0000 L CNN
F 2 "" V 7830 3950 50  0001 C CNN
F 3 "~" H 7900 3950 50  0001 C CNN
	1    7900 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3800 7900 3800
Connection ~ 7400 3800
Connection ~ 7900 3800
Wire Wire Line
	7400 3500 7900 3500
Wire Wire Line
	7400 4100 7900 4100
Text Notes 7100 4500 0    50   ~ 0
Second set of filter caps are 385V\nJJ TC309.
Wire Wire Line
	5350 3500 5800 3500
Connection ~ 5800 3500
Wire Wire Line
	6300 3500 6700 3500
Connection ~ 6300 3500
Wire Wire Line
	7000 3500 7400 3500
Connection ~ 7400 3500
Text GLabel 8500 3500 2    50   Output ~ 0
B+
Wire Wire Line
	7900 3500 8500 3500
Connection ~ 7900 3500
Text Notes 8500 3750 0    50   ~ 0
590Vdc @ 1mA\n520Vdc @ 500mA\n
Wire Wire Line
	4750 3500 4650 3500
Wire Wire Line
	4650 3500 4650 4100
Wire Wire Line
	4650 4100 5800 4100
Wire Wire Line
	7400 4100 6300 4100
Connection ~ 7400 4100
Connection ~ 6300 4100
$EndSCHEMATC
