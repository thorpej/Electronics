EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:2ChanBiasBalance-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Screw_Terminal_01x06 J1
U 1 1 5A11D344
P 5150 2150
F 0 "J1" H 5150 2450 50  0000 C CNN
F 1 "Screw_Terminal_01x06" H 5150 1750 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-6_P5.08mm" H 5150 2150 50  0001 C CNN
F 3 "" H 5150 2150 50  0001 C CNN
	1    5150 2150
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 5A11D40D
P 5200 2900
F 0 "R1" V 5280 2900 50  0000 C CNN
F 1 "150K" V 5200 2900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5130 2900 50  0001 C CNN
F 3 "" H 5200 2900 50  0001 C CNN
	1    5200 2900
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5A11D440
P 5450 2900
F 0 "R2" V 5530 2900 50  0000 C CNN
F 1 "150K" V 5450 2900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5380 2900 50  0001 C CNN
F 3 "" H 5450 2900 50  0001 C CNN
	1    5450 2900
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5A11D464
P 6700 2900
F 0 "R3" V 6780 2900 50  0000 C CNN
F 1 "150K" V 6700 2900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6630 2900 50  0001 C CNN
F 3 "" H 6700 2900 50  0001 C CNN
	1    6700 2900
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5A11D4E2
P 6950 2900
F 0 "R4" V 7030 2900 50  0000 C CNN
F 1 "150K" V 6950 2900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6880 2900 50  0001 C CNN
F 3 "" H 6950 2900 50  0001 C CNN
	1    6950 2900
	1    0    0    -1  
$EndComp
$Comp
L CP1 C1
U 1 1 5A11D50D
P 5200 3200
F 0 "C1" H 5225 3300 50  0000 L CNN
F 1 "CP1" H 5225 3100 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P2.50mm" H 5200 3200 50  0001 C CNN
F 3 "" H 5200 3200 50  0001 C CNN
	1    5200 3200
	-1   0    0    1   
$EndComp
$Comp
L CP1 C2
U 1 1 5A11D562
P 5450 3200
F 0 "C2" H 5475 3300 50  0000 L CNN
F 1 "CP1" H 5475 3100 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P2.50mm" H 5450 3200 50  0001 C CNN
F 3 "" H 5450 3200 50  0001 C CNN
	1    5450 3200
	-1   0    0    1   
$EndComp
$Comp
L CP1 C3
U 1 1 5A11D59C
P 6700 3200
F 0 "C3" H 6725 3300 50  0000 L CNN
F 1 "CP1" H 6725 3100 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P2.50mm" H 6700 3200 50  0001 C CNN
F 3 "" H 6700 3200 50  0001 C CNN
	1    6700 3200
	-1   0    0    1   
$EndComp
$Comp
L CP1 C4
U 1 1 5A11D5DF
P 6950 3200
F 0 "C4" H 6975 3300 50  0000 L CNN
F 1 "CP1" H 6975 3100 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P2.50mm" H 6950 3200 50  0001 C CNN
F 3 "" H 6950 3200 50  0001 C CNN
	1    6950 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	4950 3350 6950 3350
Connection ~ 6700 3350
Connection ~ 5450 3350
Wire Wire Line
	4950 2350 4950 3350
Connection ~ 5200 3350
Wire Wire Line
	5050 2350 5050 2750
Wire Wire Line
	5050 2750 6950 2750
Connection ~ 5200 2750
Connection ~ 5450 2750
Connection ~ 6700 2750
Wire Wire Line
	5350 2600 5350 2350
Wire Wire Line
	5450 2550 5450 2350
Wire Wire Line
	5300 2700 5150 2700
Wire Wire Line
	5150 2700 5150 2350
Wire Wire Line
	5200 3050 5300 3050
Wire Wire Line
	5300 3050 5300 2700
Wire Wire Line
	5450 3050 5350 3050
Wire Wire Line
	5350 3050 5350 2650
Wire Wire Line
	5350 2650 5250 2650
Wire Wire Line
	5250 2650 5250 2350
Wire Wire Line
	6700 3050 6600 3050
Wire Wire Line
	6600 3050 6600 2600
Wire Wire Line
	6600 2600 5350 2600
Wire Wire Line
	6950 3050 6850 3050
Wire Wire Line
	6850 3050 6850 2550
Wire Wire Line
	6850 2550 5450 2550
Text Notes 4700 3600 0    60   ~ 0
150K is merely an example.  Select the appropriate value\nfor your own application.
$EndSCHEMATC
