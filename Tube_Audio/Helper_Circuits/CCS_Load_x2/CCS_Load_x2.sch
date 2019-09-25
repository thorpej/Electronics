EESchema Schematic File Version 4
LIBS:CCS_Load_x2-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "2 Channel CCS Load"
Date "2019-09-24"
Rev "2.0"
Comp "San Francisco Electronworks"
Comment1 "For hobbyist use only."
Comment2 "Copyright 2018, 2019 Jason R. Thorpe.  All rights reserved."
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L jrt-Regulators:10M45S U1
U 1 1 5A108D29
P 5300 3300
F 0 "U1" H 5500 3350 50  0000 L CNN
F 1 "IXCP10M45S" H 5500 3250 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 5500 3400 50  0001 C CNN
F 3 "" H 5300 3300 50  0001 C CNN
	1    5300 3300
	1    0    0    -1  
$EndComp
$Comp
L jrt-Regulators:10M45S U2
U 1 1 5A108FB8
P 6900 3300
F 0 "U2" H 7100 3350 50  0000 L CNN
F 1 "IXCP10M45S" H 7100 3250 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 7100 3400 50  0001 C CNN
F 3 "" H 6900 3300 50  0001 C CNN
	1    6900 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5A108FE1
P 4900 3850
F 0 "R1" V 4980 3850 50  0000 C CNN
F 1 "1K" V 4900 3850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 4830 3850 50  0001 C CNN
F 3 "" H 4900 3850 50  0001 C CNN
	1    4900 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5A10901B
P 6500 3850
F 0 "R3" V 6580 3850 50  0000 C CNN
F 1 "1K" V 6500 3850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 6430 3850 50  0001 C CNN
F 3 "" H 6500 3850 50  0001 C CNN
	1    6500 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5A10905C
P 5300 3850
F 0 "R2" V 5380 3850 50  0000 C CNN
F 1 "10" V 5300 3850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 5230 3850 50  0001 C CNN
F 3 "" H 5300 3850 50  0001 C CNN
	1    5300 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5A1090A7
P 6900 3850
F 0 "R4" V 6980 3850 50  0000 C CNN
F 1 "10" V 6900 3850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 6830 3850 50  0001 C CNN
F 3 "" H 6900 3850 50  0001 C CNN
	1    6900 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 5A1090E1
P 5300 4150
F 0 "RV1" V 5125 4150 50  0000 C CNN
F 1 "1K LIN" V 5200 4150 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3339P_Vertical_HandSoldering" H 5300 4150 50  0001 C CNN
F 3 "" H 5300 4150 50  0001 C CNN
	1    5300 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV2
U 1 1 5A10913A
P 6900 4150
F 0 "RV2" V 6725 4150 50  0000 C CNN
F 1 "1K LIN" V 6800 4150 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3339P_Vertical_HandSoldering" H 6900 4150 50  0001 C CNN
F 3 "" H 6900 4150 50  0001 C CNN
	1    6900 4150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J1
U 1 1 5A109F90
P 6100 2500
F 0 "J1" H 6100 2700 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 6100 2300 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-3_P5.08mm" H 6100 2500 50  0001 C CNN
F 3 "" H 6100 2500 50  0001 C CNN
	1    6100 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 2900 5300 2900
Wire Wire Line
	4900 3300 4900 3700
Wire Wire Line
	4900 4000 4900 4300
Wire Wire Line
	4900 4300 5300 4300
Wire Wire Line
	5450 4150 5450 4300
Wire Wire Line
	5450 4300 5300 4300
Connection ~ 5300 4300
Wire Wire Line
	6100 2900 6900 2900
Connection ~ 6100 2900
Wire Wire Line
	6000 2700 6000 4300
Wire Wire Line
	6000 4300 5450 4300
Connection ~ 5450 4300
Wire Wire Line
	6900 4300 7050 4300
Wire Wire Line
	7050 4300 7050 4150
Wire Wire Line
	6500 3700 6500 3300
Wire Wire Line
	6500 4000 6500 4300
Wire Wire Line
	6500 4300 6900 4300
Connection ~ 6900 4300
Wire Wire Line
	6100 2700 6100 2900
Wire Wire Line
	6500 4300 6200 4300
Wire Wire Line
	6200 4300 6200 2700
Connection ~ 6500 4300
$EndSCHEMATC
