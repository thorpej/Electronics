EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "Snap-in Capacitor Stack board"
Date "2022-01-05"
Rev "3.0"
Comp "Copyright (c) 2019 Jason R. Thorpe. See LICENSE.txt."
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:CP1 C1
U 1 1 61E47A75
P 4800 3600
F 0 "C1" H 4915 3646 50  0000 L CNN
F 1 "CP1" H 4915 3555 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D35.0mm_P10.00mm_3pin_SnapIn" H 4800 3600 50  0001 C CNN
F 3 "~" H 4800 3600 50  0001 C CNN
	1    4800 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 61E48204
P 5300 3600
F 0 "R1" H 5370 3646 50  0000 L CNN
F 1 "R" H 5370 3555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P5.08mm_Vertical" V 5230 3600 50  0001 C CNN
F 3 "~" H 5300 3600 50  0001 C CNN
	1    5300 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J1
U 1 1 61E49350
P 6000 3850
F 0 "J1" H 6080 3892 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 6080 3801 50  0000 L CNN
F 2 "jrt-TerminalBlocks:TE_AMP-3_P10.16mm" H 6000 3850 50  0001 C CNN
F 3 "~" H 6000 3850 50  0001 C CNN
	1    6000 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3450 5300 3450
Wire Wire Line
	5300 3450 5800 3450
Wire Wire Line
	5800 3450 5800 3750
Connection ~ 5300 3450
Wire Wire Line
	4800 3750 4800 3850
Wire Wire Line
	4800 3850 5300 3850
Wire Wire Line
	5300 3750 5300 3850
Connection ~ 5300 3850
Wire Wire Line
	5300 3850 5800 3850
$Comp
L Device:CP1 C2
U 1 1 61E4BF51
P 4800 4100
F 0 "C2" H 4915 4146 50  0000 L CNN
F 1 "CP1" H 4915 4055 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D35.0mm_P10.00mm_3pin_SnapIn" H 4800 4100 50  0001 C CNN
F 3 "~" H 4800 4100 50  0001 C CNN
	1    4800 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 61E4C7A3
P 5300 4100
F 0 "R2" H 5370 4146 50  0000 L CNN
F 1 "R" H 5370 4055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P5.08mm_Vertical" V 5230 4100 50  0001 C CNN
F 3 "~" H 5300 4100 50  0001 C CNN
	1    5300 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3850 4800 3950
Connection ~ 4800 3850
Wire Wire Line
	5300 3850 5300 3950
Wire Wire Line
	4800 4250 5300 4250
Wire Wire Line
	5300 4250 5800 4250
Wire Wire Line
	5800 4250 5800 3950
Connection ~ 5300 4250
$EndSCHEMATC
