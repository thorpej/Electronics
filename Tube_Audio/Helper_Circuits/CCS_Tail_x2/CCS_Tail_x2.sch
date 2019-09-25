EESchema Schematic File Version 4
LIBS:CCS_Tail_x2-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "2 Channel CCS Tail"
Date "2019-09-24"
Rev "3.0"
Comp "San Francisco Electronworks"
Comment1 "For hobbyist use only."
Comment2 "Copyright 2017, 2019 Jason R. Thorpe.  All rights reserved."
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L jrt-Regulators:10M45S U1
U 1 1 5A108D29
P 5050 4000
F 0 "U1" H 5250 4050 50  0000 L CNN
F 1 "IXCP10M45S" H 5250 3950 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 5250 4100 50  0001 C CNN
F 3 "" H 5050 4000 50  0001 C CNN
	1    5050 4000
	1    0    0    -1  
$EndComp
$Comp
L jrt-Regulators:10M45S U2
U 1 1 5A108FB8
P 6550 4000
F 0 "U2" H 6750 4050 50  0000 L CNN
F 1 "IXCP10M45S" H 6750 3950 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 6750 4100 50  0001 C CNN
F 3 "" H 6550 4000 50  0001 C CNN
	1    6550 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5A108FE1
P 4650 4350
F 0 "R1" V 4730 4350 50  0000 C CNN
F 1 "1K" V 4650 4350 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 4580 4350 50  0001 C CNN
F 3 "" H 4650 4350 50  0001 C CNN
	1    4650 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5A10901B
P 6150 4350
F 0 "R3" V 6230 4350 50  0000 C CNN
F 1 "1K" V 6150 4350 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 6080 4350 50  0001 C CNN
F 3 "" H 6150 4350 50  0001 C CNN
	1    6150 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5A10905C
P 5050 4550
F 0 "R2" V 5130 4550 50  0000 C CNN
F 1 "10" V 5050 4550 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 4980 4550 50  0001 C CNN
F 3 "" H 5050 4550 50  0001 C CNN
	1    5050 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5A1090A7
P 6550 4550
F 0 "R4" V 6630 4550 50  0000 C CNN
F 1 "10" V 6550 4550 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 6480 4550 50  0001 C CNN
F 3 "" H 6550 4550 50  0001 C CNN
	1    6550 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 5A1090E1
P 5050 4850
F 0 "RV1" V 4875 4850 50  0000 C CNN
F 1 "1K LIN" V 4950 4850 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3339P_Vertical_HandSoldering" H 5050 4850 50  0001 C CNN
F 3 "" H 5050 4850 50  0001 C CNN
F 4 "Bourns 3339P-1-102LF" V 5050 4850 50  0001 C CNN "Part"
	1    5050 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV2
U 1 1 5A10913A
P 6550 4850
F 0 "RV2" V 6375 4850 50  0000 C CNN
F 1 "1K LIN" V 6450 4850 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3339P_Vertical_HandSoldering" H 6550 4850 50  0001 C CNN
F 3 "" H 6550 4850 50  0001 C CNN
F 4 "Bourns 3339P-1-102LF" V 6550 4850 50  0001 C CNN "Part"
	1    6550 4850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J1
U 1 1 5A109F90
P 5800 3400
F 0 "J1" H 5800 3600 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 5800 3200 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-3_P5.08mm" H 5800 3400 50  0001 C CNN
F 3 "" H 5800 3400 50  0001 C CNN
	1    5800 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4650 4500 4650 5000
Connection ~ 5800 5000
Wire Wire Line
	5700 3600 5050 3600
Wire Wire Line
	5800 3600 5800 5000
Wire Wire Line
	5900 3600 6550 3600
Wire Wire Line
	5800 5000 6150 5000
Wire Wire Line
	6150 4200 6150 4000
Wire Wire Line
	6150 4500 6150 5000
Connection ~ 5050 5000
Wire Wire Line
	5050 5000 5200 5000
Wire Wire Line
	4650 5000 5050 5000
Wire Wire Line
	4650 4200 4650 4000
Wire Wire Line
	5200 4850 5200 5000
Connection ~ 5200 5000
Wire Wire Line
	5200 5000 5800 5000
Wire Wire Line
	6150 5000 6550 5000
Connection ~ 6150 5000
Wire Wire Line
	6700 4850 6700 5000
Wire Wire Line
	6700 5000 6550 5000
Connection ~ 6550 5000
$EndSCHEMATC
