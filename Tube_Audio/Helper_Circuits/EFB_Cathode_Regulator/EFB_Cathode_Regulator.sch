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
L LM337_TO220 U1
U 1 1 5B7998BC
P 5850 3400
F 0 "U1" H 5700 3275 50  0000 C CNN
F 1 "LM337_TO220" H 5850 3275 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 5850 3200 50  0001 C CIN
F 3 "" H 5850 3400 50  0001 C CNN
	1    5850 3400
	0    1    1    0   
$EndComp
$Comp
L Screw_Terminal_01x03 J1
U 1 1 5B799A05
P 7250 3400
F 0 "J1" H 7250 3600 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 7250 3200 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-3_P5.08mm" H 7250 3400 50  0001 C CNN
F 3 "" H 7250 3400 50  0001 C CNN
	1    7250 3400
	1    0    0    -1  
$EndComp
Text Notes 7500 3300 0    60   ~ 0
Vref
Text Notes 7500 3450 0    60   ~ 0
Vout
Text Notes 7500 3550 0    60   ~ 0
GND
$Comp
L R R1
U 1 1 5B799B3A
P 6550 3000
F 0 "R1" V 6630 3000 50  0000 C CNN
F 1 "330K" V 6550 3000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 6480 3000 50  0001 C CNN
F 3 "" H 6550 3000 50  0001 C CNN
	1    6550 3000
	1    0    0    -1  
$EndComp
$Comp
L POT RV1
U 1 1 5B799B7C
P 6550 3400
F 0 "RV1" V 6375 3400 50  0000 C CNN
F 1 "10K" V 6450 3400 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Piher_PT-10h2.5_Vertical_Px2.5mm_Py5.0mm" H 6550 3400 50  0001 C CNN
F 3 "" H 6550 3400 50  0001 C CNN
	1    6550 3400
	-1   0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5B79B07D
P 6550 3800
F 0 "R2" V 6630 3800 50  0000 C CNN
F 1 "22K" V 6550 3800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 6480 3800 50  0001 C CNN
F 3 "" H 6550 3800 50  0001 C CNN
	1    6550 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 3950 7050 3950
Wire Wire Line
	7050 3950 7050 3500
Wire Wire Line
	6550 3150 6550 3250
Wire Wire Line
	6550 3550 6550 3650
Wire Wire Line
	6400 3400 6150 3400
$Comp
L R R3
U 1 1 5B79B137
P 5850 3950
F 0 "R3" V 5930 3950 50  0000 C CNN
F 1 "10R" V 5850 3950 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 5780 3950 50  0001 C CNN
F 3 "" H 5850 3950 50  0001 C CNN
	1    5850 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3700 5850 3800
Wire Wire Line
	5600 4100 6850 4100
Wire Wire Line
	6850 4100 6850 3400
Wire Wire Line
	6850 3400 7050 3400
Wire Wire Line
	7050 3300 7050 2850
Wire Wire Line
	7050 2850 6550 2850
$Comp
L CP1_Small C2
U 1 1 5B79B1E2
P 6050 3850
F 0 "C2" H 6060 3920 50  0000 L CNN
F 1 "22µF" H 6060 3770 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D6.3mm_P2.50mm" H 6050 3850 50  0001 C CNN
F 3 "" H 6050 3850 50  0001 C CNN
	1    6050 3850
	1    0    0    -1  
$EndComp
$Comp
L CP1_Small C1
U 1 1 5B79B247
P 6250 3550
F 0 "C1" H 6260 3620 50  0000 L CNN
F 1 "4.7µF" H 6260 3470 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.00mm" H 6250 3550 50  0001 C CNN
F 3 "" H 6250 3550 50  0001 C CNN
	1    6250 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3450 6250 3400
Connection ~ 6250 3400
Wire Wire Line
	5600 3750 6050 3750
Connection ~ 5850 3750
Connection ~ 6550 3950
Wire Wire Line
	6250 3650 6250 3950
Connection ~ 6250 3950
Wire Wire Line
	5850 3100 6350 3100
Wire Wire Line
	6350 3100 6350 3950
Connection ~ 6350 3950
$Comp
L Screw_Terminal_01x02 J2
U 1 1 5B79B569
P 5400 4000
F 0 "J2" H 5400 4100 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5400 3800 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 5400 4000 50  0001 C CNN
F 3 "" H 5400 4000 50  0001 C CNN
	1    5400 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	5600 4000 5600 4100
Connection ~ 5850 4100
Wire Wire Line
	5600 3900 5600 3750
Text Notes 4650 4100 0    60   ~ 0
            -\nTest point\n            +
Text Notes 6750 3050 1    60   ~ 0
2W
Text Notes 6500 4350 0    60   ~ 0
Adjust R2 as needed to provide the correct\ninput voltage range to the LM337.
Text Notes 5250 4350 0    60   ~ 0
Capacitors should be\nelectrolytics rated 50V.
Text Notes 6500 4550 0    60   ~ 0
Pot is TE 409VA103M.
Text Notes 5250 4550 0    60   ~ 0
R3 is 1% tolerance, 2W
$EndSCHEMATC
