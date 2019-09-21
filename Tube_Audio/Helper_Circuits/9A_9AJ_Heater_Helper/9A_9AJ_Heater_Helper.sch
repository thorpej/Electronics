EESchema Schematic File Version 4
LIBS:9A_9AJ_Heater_Helper-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "9A / 9AJ Heater Helper"
Date "2019-09-20"
Rev "1.0"
Comp "San Francisco Electronworks"
Comment1 "For hobbyist use only."
Comment2 "Copyright 2019 Jason R. Thorpe.  All rights reserved."
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Switch:SW_DPDT_x2 SW1
U 1 1 5D85BFFE
P 5950 3000
F 0 "SW1" H 5700 3300 50  0000 C CNN
F 1 "SW_DPDT_x2" H 5650 3200 50  0000 C CNN
F 2 "jrt-Switches:SW_SPDT_CandK-V80212MS02Q" H 5950 3000 50  0001 C CNN
F 3 "~" H 5950 3000 50  0001 C CNN
F 4 "C&K V80212MS02Q" H 5950 3000 50  0001 C CNN "Part"
	1    5950 3000
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DPDT_x2 SW1
U 2 1 5D85D5AF
P 5950 4000
F 0 "SW1" H 5700 4300 50  0000 C CNN
F 1 "SW_DPDT_x2" H 5650 4200 50  0000 C CNN
F 2 "jrt-Switches:SW_SPDT_CandK-V80212MS02Q" H 5950 4000 50  0001 C CNN
F 3 "~" H 5950 4000 50  0001 C CNN
F 4 "C&K V80212MS02Q" H 5950 4000 50  0001 C CNN "Part"
	2    5950 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 3900 6150 3100
Text Notes 6300 3650 0    50   ~ 0
9A (12AX7 / ECC83)\n\n\n9AJ (6N2P)
Wire Wire Line
	6150 2900 6150 2450
Wire Wire Line
	5750 3000 5250 3000
Wire Wire Line
	5750 4000 5250 4000
$Comp
L Connector:Screw_Terminal_01x03 J2
U 1 1 5D8630DC
P 8550 3400
F 0 "J2" H 8400 3750 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 8200 3650 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-3_P5.08mm" H 8550 3400 50  0001 C CNN
F 3 "~" H 8550 3400 50  0001 C CNN
	1    8550 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J1
U 1 1 5D863D9F
P 3950 3400
F 0 "J1" H 3868 3717 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 3868 3626 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-3_P5.08mm" H 3950 3400 50  0001 C CNN
F 3 "~" H 3950 3400 50  0001 C CNN
	1    3950 3400
	-1   0    0    -1  
$EndComp
Text Notes 6000 4200 0    50   Italic 0
A
Text Notes 6000 3200 0    50   Italic 0
A
Text Notes 6000 2850 0    50   Italic 0
B
Text Notes 6000 3850 0    50   Italic 0
B
Text Notes 5750 2950 0    50   Italic 0
1
Text Notes 5750 3950 0    50   Italic 0
2
Wire Wire Line
	6150 2450 4500 2450
Wire Wire Line
	4500 2450 4500 3300
Wire Wire Line
	4500 3300 4150 3300
Wire Wire Line
	5250 3000 5250 3400
Wire Wire Line
	5250 3400 4150 3400
Wire Wire Line
	5250 4000 5250 3500
Wire Wire Line
	5250 3500 4150 3500
Wire Wire Line
	8350 3300 8050 3300
Wire Wire Line
	8350 3400 8050 3400
Wire Wire Line
	8050 3400 8050 3900
Wire Wire Line
	8050 3900 6150 3900
Connection ~ 6150 3900
Wire Wire Line
	8350 3500 8350 4100
Wire Wire Line
	8350 4100 6150 4100
Text Notes 3600 3300 0    50   Italic 0
Pin 4
Text Notes 3600 3400 0    50   Italic 0
Pin 5
Text Notes 3600 3550 0    50   Italic 0
Pin 9
Text Notes 8650 3550 0    50   Italic 0
GND
Text Notes 8650 3300 0    50   Italic 0
6.3Vac
Text Notes 8650 3400 0    50   Italic 0
6.3Vac
Wire Wire Line
	8050 2900 6150 2900
Wire Wire Line
	8050 2900 8050 3300
Connection ~ 6150 2900
$EndSCHEMATC
