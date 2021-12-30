EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "KWard Bench PSU - High Voltage supply"
Date ""
Rev "0.1"
Comp "Copyright (c) 2021 Jason R. Thorpe. See LICENSE."
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Transformer_1P_2S T1
U 1 1 61CEBEA3
P 2150 3200
F 0 "T1" H 2150 3850 50  0000 C CNN
F 1 "AnTek AS-4T400 (HV)" H 2150 3750 50  0000 C CNN
F 2 "" H 2150 3200 50  0001 C CNN
F 3 "~" H 2150 3200 50  0001 C CNN
	1    2150 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:Transformer_1P_2S T2
U 1 1 61CF194C
P 2150 4150
F 0 "T2" H 2150 3650 50  0000 C CNN
F 1 "AnTek AS-4T400 (Filament)" H 2150 3550 50  0000 C CNN
F 2 "" H 2150 4150 50  0001 C CNN
F 3 "~" H 2150 4150 50  0001 C CNN
	1    2150 4150
	1    0    0    -1  
$EndComp
Text Notes 1350 2450 0    50   ~ 0
AnTek AS-4T400 has 2 400V @ 500mA secondary windings.\nWire them in parallel for the HV supply.
Text Notes 1350 5050 0    50   ~ 0
AnTek AS-4T400 has 2 6.3V @ 4A secondary windings.\nWire them in parallel for the 6550 filament supply.
Text Notes 1350 1850 0    50   ~ 0
AnTek AS-4T400 has 2 primary windings.  Wire them in parallel\nfor a 120VAC @ 60Hz mains supply.  Note the primary is nominal\n115V / 230V, but all simulations have been performed assuming\n120V mains voltage.
Wire Wire Line
	1750 3950 1550 3950
Wire Wire Line
	1550 3950 1550 3000
Wire Wire Line
	1550 3000 1750 3000
Wire Wire Line
	1750 3400 1650 3400
Wire Wire Line
	1650 3400 1650 4350
Wire Wire Line
	1650 4350 1750 4350
Wire Wire Line
	1550 3000 1350 3000
Connection ~ 1550 3000
Wire Wire Line
	1650 4350 1350 4350
Connection ~ 1650 4350
Text GLabel 1350 3000 0    50   Input ~ 0
120Vac
Text GLabel 1350 4350 0    50   Input ~ 0
120Vac
Wire Wire Line
	2550 3750 2750 3750
Wire Wire Line
	2750 3750 2750 4250
Wire Wire Line
	2750 4250 2550 4250
Wire Wire Line
	2550 4050 2650 4050
Wire Wire Line
	2650 4050 2650 4550
Wire Wire Line
	2650 4550 2550 4550
Wire Wire Line
	2750 3750 2950 3750
Connection ~ 2750 3750
Wire Wire Line
	2650 4550 2950 4550
Connection ~ 2650 4550
Text GLabel 2950 3750 2    50   Output ~ 0
6.3Vac
Text GLabel 2950 4550 2    50   Output ~ 0
6.3Vac
Wire Wire Line
	2550 2800 2750 2800
Wire Wire Line
	2750 2800 2750 3300
Wire Wire Line
	2750 3300 2550 3300
Wire Wire Line
	2550 3100 2650 3100
Wire Wire Line
	2650 3100 2650 3600
Wire Wire Line
	2650 3600 2550 3600
$Comp
L Device:D_Bridge_+-AA D1
U 1 1 61CF6937
P 4200 3200
F 0 "D1" H 4400 3600 50  0000 L CNN
F 1 "Vishay GBPC3510-E4/51" H 4400 3500 50  0000 L CNN
F 2 "" H 4200 3200 50  0001 C CNN
F 3 "~" H 4200 3200 50  0001 C CNN
	1    4200 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 3600 4200 3600
Wire Wire Line
	4200 3600 4200 3500
Connection ~ 2650 3600
Wire Wire Line
	2750 2800 4200 2800
Wire Wire Line
	4200 2800 4200 2900
Connection ~ 2750 2800
$Comp
L Device:CP1 C1
U 1 1 61CF9678
P 4950 3350
F 0 "C1" H 5065 3396 50  0000 L CNN
F 1 "560µF" H 5065 3305 50  0000 L CNN
F 2 "" H 4950 3350 50  0001 C CNN
F 3 "~" H 4950 3350 50  0001 C CNN
	1    4950 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 61CFA233
P 5450 3350
F 0 "R1" H 5520 3396 50  0000 L CNN
F 1 "100K" H 5520 3305 50  0000 L CNN
F 2 "" V 5380 3350 50  0001 C CNN
F 3 "~" H 5450 3350 50  0001 C CNN
	1    5450 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C2
U 1 1 61CFA853
P 4950 3650
F 0 "C2" H 5065 3696 50  0000 L CNN
F 1 "560µF" H 5065 3605 50  0000 L CNN
F 2 "" H 4950 3650 50  0001 C CNN
F 3 "~" H 4950 3650 50  0001 C CNN
	1    4950 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 61CFA978
P 5450 3650
F 0 "R2" H 5520 3696 50  0000 L CNN
F 1 "100K" H 5520 3605 50  0000 L CNN
F 2 "" V 5380 3650 50  0001 C CNN
F 3 "~" H 5450 3650 50  0001 C CNN
	1    5450 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3500 5450 3500
Connection ~ 4950 3500
Connection ~ 5450 3500
Wire Wire Line
	4950 3200 5450 3200
Wire Wire Line
	4950 3800 5450 3800
Text Notes 4600 4300 0    50   ~ 0
First set of filter caps are 385V\nTDK B43501B3567M2 (selected\nfor high ripple current rating).
$Comp
L power:GND #PWR01
U 1 1 61CFBDA3
P 4950 3800
F 0 "#PWR01" H 4950 3550 50  0001 C CNN
F 1 "GND" H 4955 3627 50  0000 C CNN
F 2 "" H 4950 3800 50  0001 C CNN
F 3 "" H 4950 3800 50  0001 C CNN
	1    4950 3800
	1    0    0    -1  
$EndComp
Connection ~ 4950 3800
$Comp
L Device:L L1
U 1 1 61CFC4F7
P 6000 3200
F 0 "L1" V 6190 3200 50  0000 C CNN
F 1 "1H" V 6099 3200 50  0000 C CNN
F 2 "" H 6000 3200 50  0001 C CNN
F 3 "~" H 6000 3200 50  0001 C CNN
	1    6000 3200
	0    -1   -1   0   
$EndComp
Text Notes 7100 2950 2    50   ~ 0
Edcor XC100-1H-600mA (11 ohms DCR)
$Comp
L Device:CP1 C3
U 1 1 61D01295
P 6550 3350
F 0 "C3" H 6665 3396 50  0000 L CNN
F 1 "800µF" H 6665 3305 50  0000 L CNN
F 2 "" H 6550 3350 50  0001 C CNN
F 3 "~" H 6550 3350 50  0001 C CNN
	1    6550 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 61D0129B
P 7050 3350
F 0 "R3" H 7120 3396 50  0000 L CNN
F 1 "100K" H 7120 3305 50  0000 L CNN
F 2 "" V 6980 3350 50  0001 C CNN
F 3 "~" H 7050 3350 50  0001 C CNN
	1    7050 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C4
U 1 1 61D012A1
P 6550 3650
F 0 "C4" H 6665 3696 50  0000 L CNN
F 1 "800µF" H 6665 3605 50  0000 L CNN
F 2 "" H 6550 3650 50  0001 C CNN
F 3 "~" H 6550 3650 50  0001 C CNN
	1    6550 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 61D012A7
P 7050 3650
F 0 "R4" H 7120 3696 50  0000 L CNN
F 1 "100K" H 7120 3605 50  0000 L CNN
F 2 "" V 6980 3650 50  0001 C CNN
F 3 "~" H 7050 3650 50  0001 C CNN
	1    7050 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3500 7050 3500
Connection ~ 6550 3500
Connection ~ 7050 3500
Wire Wire Line
	6550 3200 7050 3200
Wire Wire Line
	6550 3800 7050 3800
Text Notes 6250 4200 0    50   ~ 0
Second set of filter caps are 385V\nJJ TC309.
Wire Wire Line
	4500 3200 4950 3200
Connection ~ 4950 3200
Wire Wire Line
	5450 3200 5850 3200
Connection ~ 5450 3200
Wire Wire Line
	6150 3200 6550 3200
Connection ~ 6550 3200
Text GLabel 7650 3200 2    50   Output ~ 0
B+
Wire Wire Line
	7050 3200 7650 3200
Connection ~ 7050 3200
Text Notes 7650 3450 0    50   ~ 0
590Vdc @ 1mA\n520Vdc @ 500mA\n
Wire Wire Line
	3900 3200 3800 3200
Wire Wire Line
	3800 3200 3800 3800
Wire Wire Line
	3800 3800 4950 3800
Wire Wire Line
	6550 3800 5450 3800
Connection ~ 6550 3800
Connection ~ 5450 3800
$EndSCHEMATC
