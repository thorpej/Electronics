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
L R R3
U 1 1 5A88538B
P 5150 2850
F 0 "R3" V 5230 2850 50  0000 C CNN
F 1 "R" V 5150 2850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 5080 2850 50  0001 C CNN
F 3 "" H 5150 2850 50  0001 C CNN
	1    5150 2850
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5A8853BF
P 5150 3200
F 0 "R4" V 5230 3200 50  0000 C CNN
F 1 "R" V 5150 3200 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 5080 3200 50  0001 C CNN
F 3 "" H 5150 3200 50  0001 C CNN
	1    5150 3200
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 5A8853FF
P 5150 3550
F 0 "R5" V 5230 3550 50  0000 C CNN
F 1 "R" V 5150 3550 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 5080 3550 50  0001 C CNN
F 3 "" H 5150 3550 50  0001 C CNN
	1    5150 3550
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 5A885443
P 5150 3900
F 0 "R6" V 5230 3900 50  0000 C CNN
F 1 "R" V 5150 3900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 5080 3900 50  0001 C CNN
F 3 "" H 5150 3900 50  0001 C CNN
	1    5150 3900
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 5A88546F
P 5600 2700
F 0 "R7" V 5680 2700 50  0000 C CNN
F 1 "R" V 5600 2700 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_Power_L48.0mm_W12.5mm_P55.88mm" V 5530 2700 50  0001 C CNN
F 3 "" H 5600 2700 50  0001 C CNN
	1    5600 2700
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 5A8854C6
P 5500 3550
F 0 "C1" H 5525 3650 50  0000 L CNN
F 1 "1µF" H 5525 3450 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L26.5mm_W10.5mm_P22.50mm_MKS4" H 5538 3400 50  0001 C CNN
F 3 "" H 5500 3550 50  0001 C CNN
	1    5500 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2700 5950 2700
Wire Wire Line
	5950 2700 5950 3150
Wire Wire Line
	4500 2700 5450 2700
$Comp
L IRF540N Q1
U 1 1 5A885558
P 5850 3350
F 0 "Q1" H 6100 3425 50  0000 L CNN
F 1 "STF16N50M2" H 6100 3350 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 6100 3275 50  0001 L CIN
F 3 "" H 5850 3350 50  0001 L CNN
	1    5850 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3000 5150 3050
Wire Wire Line
	5150 3350 5150 3400
Wire Wire Line
	5150 3700 5150 3750
Wire Wire Line
	4800 3350 5650 3350
Wire Wire Line
	5500 3400 5500 3350
Connection ~ 5500 3350
Wire Wire Line
	5500 4050 5500 3700
Wire Wire Line
	4800 4050 5600 4050
$Comp
L R R1
U 1 1 5A8855E8
P 4800 3000
F 0 "R1" V 4880 3000 50  0000 C CNN
F 1 "R" V 4800 3000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 4730 3000 50  0001 C CNN
F 3 "" H 4800 3000 50  0001 C CNN
	1    4800 3000
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5A88563F
P 4800 3700
F 0 "R2" V 4880 3700 50  0000 C CNN
F 1 "R" V 4800 3700 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 4730 3700 50  0001 C CNN
F 3 "" H 4800 3700 50  0001 C CNN
	1    4800 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2850 4800 2700
Connection ~ 5150 2700
Wire Wire Line
	4800 3150 4800 3350
Connection ~ 5150 3350
Wire Wire Line
	4800 3550 4800 3400
Wire Wire Line
	4800 3400 5150 3400
Wire Wire Line
	4800 3850 4800 4050
Connection ~ 5150 4050
Connection ~ 5150 3400
$Comp
L Screw_Terminal_01x03 J1
U 1 1 5A8856F5
P 5500 4600
F 0 "J1" H 5500 4800 50  0000 C CNN
F 1 "TE AMP 282843-3" H 5500 4400 50  0000 C CNN
F 2 "CustomFootprints:TerminalBlock_AMP-3_P10.16mm" H 5500 4600 50  0001 C CNN
F 3 "" H 5500 4600 50  0001 C CNN
	1    5500 4600
	0    -1   1    0   
$EndComp
Wire Wire Line
	5400 4400 4500 4400
Wire Wire Line
	4500 4400 4500 2700
Connection ~ 4800 2700
Wire Wire Line
	5500 4400 5500 4250
Wire Wire Line
	5500 4250 5950 4250
Wire Wire Line
	5950 4250 5950 3550
Wire Wire Line
	5600 4050 5600 4400
Connection ~ 5500 4050
Text Notes 5550 3900 0    60   ~ 0
Film cap: Panasonic ECW-FE2J105J\n630V Polypropylene
Text Notes 5300 4800 0    60   ~ 0
In Out GND
Text Notes 4950 2600 0    60   ~ 0
Vishay Dale RS-series wirewound\npower resistor (voltage pre-drop)
$EndSCHEMATC
