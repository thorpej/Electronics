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
LIBS:EFB_Bias_Supply-cache
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
L Q_PNP_ECB Q1
U 1 1 5B8F12D5
P 7000 3650
F 0 "Q1" H 7200 3700 50  0000 L CNN
F 1 "KSA1013" H 7200 3600 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 7200 3750 50  0001 C CNN
F 3 "" H 7000 3650 50  0001 C CNN
	1    7000 3650
	-1   0    0    -1  
$EndComp
$Comp
L Q_PNP_ECB Q2
U 1 1 5B8F1487
P 6450 3100
F 0 "Q2" H 6650 3150 50  0000 L CNN
F 1 "KSA1013" H 6650 3050 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 6650 3200 50  0001 C CNN
F 3 "" H 6450 3100 50  0001 C CNN
	1    6450 3100
	-1   0    0    -1  
$EndComp
$Comp
L D_Small_ALT D1
U 1 1 5B8F1500
P 7400 3750
F 0 "D1" H 7350 3830 50  0000 L CNN
F 1 "1N4007" H 7250 3670 50  0000 L CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P7.62mm_Horizontal" V 7400 3750 50  0001 C CNN
F 3 "" V 7400 3750 50  0001 C CNN
	1    7400 3750
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C1
U 1 1 5B8F157B
P 7650 3750
F 0 "C1" H 7660 3820 50  0000 L CNN
F 1 ".22µF" H 7660 3670 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L7.2mm_W3.5mm_P5.00mm_FKS2_FKP2_MKS2_MKP2" H 7650 3750 50  0001 C CNN
F 3 "" H 7650 3750 50  0001 C CNN
	1    7650 3750
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5B8F15F9
P 8100 3650
F 0 "R2" V 8180 3650 50  0000 C CNN
F 1 "R" V 8100 3650 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 8030 3650 50  0001 C CNN
F 3 "" H 8100 3650 50  0001 C CNN
	1    8100 3650
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 5B8F1675
P 7500 2900
F 0 "R3" V 7580 2900 50  0000 C CNN
F 1 "R" V 7500 2900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 7430 2900 50  0001 C CNN
F 3 "" H 7500 2900 50  0001 C CNN
	1    7500 2900
	0    1    1    0   
$EndComp
$Comp
L POT RV1
U 1 1 5B8F174C
P 7650 3300
F 0 "RV1" V 7475 3300 50  0000 C CNN
F 1 "50K" V 7550 3300 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_ACP_CA9v_Horizontal_Px10.0mm_Py5.0mm" H 7650 3300 50  0001 C CNN
F 3 "" H 7650 3300 50  0001 C CNN
	1    7650 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 3300 7800 3150
Wire Wire Line
	7800 3150 7650 3150
Wire Wire Line
	7650 3150 7650 2900
Wire Wire Line
	7650 3450 7650 3650
Wire Wire Line
	7200 3650 7950 3650
Connection ~ 7650 3650
Connection ~ 7400 3650
Connection ~ 7650 3150
Text Notes 7900 3450 1    60   ~ 0
CW ->
$Comp
L R R4
U 1 1 5B8F18EA
P 6700 2900
F 0 "R4" V 6780 2900 50  0000 C CNN
F 1 "R" V 6700 2900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 6630 2900 50  0001 C CNN
F 3 "" H 6700 2900 50  0001 C CNN
	1    6700 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 2900 6850 2900
Wire Wire Line
	5400 2900 6550 2900
Wire Wire Line
	6900 3450 6900 2900
Connection ~ 6900 2900
Wire Wire Line
	6650 3100 6900 3100
Connection ~ 6900 3100
$Comp
L Screw_Terminal_01x02 J1
U 1 1 5B8F19EA
P 8250 4350
F 0 "J1" H 8250 4450 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 8250 4150 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 8250 4350 50  0001 C CNN
F 3 "" H 8250 4350 50  0001 C CNN
	1    8250 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	8150 4150 8250 4150
$Comp
L Screw_Terminal_01x03 J2
U 1 1 5B8F1AB2
P 7300 4350
F 0 "J2" H 7300 4550 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 7300 4150 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-3_P5.08mm" H 7300 4350 50  0001 C CNN
F 3 "" H 7300 4350 50  0001 C CNN
	1    7300 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	7400 4150 7400 3850
Wire Wire Line
	6900 3850 7650 3850
Connection ~ 7400 3850
Wire Wire Line
	6350 3300 6350 3950
Wire Wire Line
	6350 3950 7300 3950
Wire Wire Line
	7300 3950 7300 4150
Text Notes 7450 4650 1    60   ~ 0
GND
Text Notes 7350 4650 1    60   ~ 0
Vbias
Text Notes 7250 4650 1    60   ~ 0
Vneg
$Comp
L CP1_Small C2
U 1 1 5B8F1E30
P 6250 4300
F 0 "C2" H 6260 4370 50  0000 L CNN
F 1 "100µF" H 6300 4450 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D16.0mm_P7.50mm" H 6250 4300 50  0001 C CNN
F 3 "" H 6250 4300 50  0001 C CNN
	1    6250 4300
	-1   0    0    1   
$EndComp
Wire Wire Line
	6250 4200 6250 4100
Wire Wire Line
	6250 4100 7200 4100
Wire Wire Line
	7200 4100 7200 4150
$Comp
L D_Small_ALT D2
U 1 1 5B8F1ECF
P 6650 4200
F 0 "D2" H 6600 4280 50  0000 L CNN
F 1 "1N4007" H 6500 4120 50  0000 L CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P7.62mm_Horizontal" V 6650 4200 50  0001 C CNN
F 3 "" V 6650 4200 50  0001 C CNN
	1    6650 4200
	-1   0    0    1   
$EndComp
$Comp
L Screw_Terminal_01x02 J3
U 1 1 5B8F1F9E
P 6850 4850
F 0 "J3" H 6850 4950 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 6850 4650 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 6850 4850 50  0001 C CNN
F 3 "" H 6850 4850 50  0001 C CNN
	1    6850 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	6850 4650 7550 4650
Wire Wire Line
	7550 4650 7550 4150
Wire Wire Line
	7550 4150 7400 4150
Connection ~ 7400 4150
Wire Wire Line
	6750 4650 6750 4200
Text Notes 6700 5050 0    60   ~ 0
AC in
Wire Wire Line
	6000 4200 6550 4200
Wire Wire Line
	6250 4400 6250 5100
Wire Wire Line
	5400 5100 7050 5100
Wire Wire Line
	7050 5100 7050 4650
Connection ~ 7050 4650
Connection ~ 6250 4200
Text Notes 6250 4500 0    60   ~ 0
250V
Text Notes 8850 4200 0    60   ~ 0
C2: Panasonic\nEEU-ED2E101
Text Notes 7650 3950 0    60   ~ 0
50V
Text Notes 8850 3950 0    60   ~ 0
C1: Kemet\nSMR5224J50J02L16.5
$Comp
L R R5
U 1 1 5B8F2558
P 5850 4200
F 0 "R5" V 5930 4200 50  0000 C CNN
F 1 "R" V 5850 4200 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 5780 4200 50  0001 C CNN
F 3 "" H 5850 4200 50  0001 C CNN
	1    5850 4200
	0    1    1    0   
$EndComp
$Comp
L CP1_Small C3
U 1 1 5B8F25AE
P 5400 4300
F 0 "C3" H 5410 4370 50  0000 L CNN
F 1 "47µF" H 5450 4450 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D12.5mm_P5.00mm" H 5400 4300 50  0001 C CNN
F 3 "" H 5400 4300 50  0001 C CNN
	1    5400 4300
	-1   0    0    1   
$EndComp
Text Notes 5400 4500 0    60   ~ 0
250V
Wire Wire Line
	5700 4200 5400 4200
Wire Wire Line
	5400 4400 5400 5100
Connection ~ 6250 5100
Wire Wire Line
	5400 4200 5400 2900
Connection ~ 6350 2900
Connection ~ 5400 4200
Connection ~ 8250 4150
Text Notes 8850 4450 0    60   ~ 0
C3: Panasonic\nEEU-ED2E470
Text Notes 8000 3300 0    60   ~ 0
TE 409HA503M
$Comp
L R R1
U 1 1 5B8FF981
P 8250 3900
F 0 "R1" V 8330 3900 50  0000 C CNN
F 1 "R" V 8250 3900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 8180 3900 50  0001 C CNN
F 3 "" H 8250 3900 50  0001 C CNN
	1    8250 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 4150 8250 4050
Wire Wire Line
	8250 3750 8250 3650
Text Notes 5400 5800 0    60   ~ 0
EFB(tm) and Enhanced Fixed Bias(tm) are trademarks of\nD Gillespie Designs and are used with permission.\n\nCircuit is copyright D Gillespie Designs, and is used with permission.
$EndSCHEMATC
