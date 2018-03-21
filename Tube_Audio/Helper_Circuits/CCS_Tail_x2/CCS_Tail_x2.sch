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
LIBS:CCS_Tail_x2-cache
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
L Q_NMOS_GDS Q1
U 1 1 5A108D29
P 4850 3650
F 0 "Q1" H 5050 3700 50  0000 L CNN
F 1 "IXCP10M45S" H 5050 3600 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 5050 3750 50  0001 C CNN
F 3 "" H 4850 3650 50  0001 C CNN
	1    4850 3650
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_GDS Q2
U 1 1 5A108FB8
P 6650 3650
F 0 "Q2" H 6850 3700 50  0000 L CNN
F 1 "IXCP10M45S" H 6850 3600 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 6850 3750 50  0001 C CNN
F 3 "" H 6650 3650 50  0001 C CNN
	1    6650 3650
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5A108FE1
P 4650 3800
F 0 "R1" V 4730 3800 50  0000 C CNN
F 1 "1K" V 4650 3800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 4580 3800 50  0001 C CNN
F 3 "" H 4650 3800 50  0001 C CNN
	1    4650 3800
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5A10901B
P 6450 3800
F 0 "R3" V 6530 3800 50  0000 C CNN
F 1 "1K" V 6450 3800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 6380 3800 50  0001 C CNN
F 3 "" H 6450 3800 50  0001 C CNN
	1    6450 3800
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5A10905C
P 4950 4000
F 0 "R2" V 5030 4000 50  0000 C CNN
F 1 "10" V 4950 4000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 4880 4000 50  0001 C CNN
F 3 "" H 4950 4000 50  0001 C CNN
	1    4950 4000
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5A1090A7
P 6750 4000
F 0 "R4" V 6830 4000 50  0000 C CNN
F 1 "10" V 6750 4000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 6680 4000 50  0001 C CNN
F 3 "" H 6750 4000 50  0001 C CNN
	1    6750 4000
	1    0    0    -1  
$EndComp
$Comp
L POT RV1
U 1 1 5A1090E1
P 4950 4300
F 0 "RV1" V 4775 4300 50  0000 C CNN
F 1 "1K LIN" V 4850 4300 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Vishay_T73XX_Vertical" H 4950 4300 50  0001 C CNN
F 3 "" H 4950 4300 50  0001 C CNN
	1    4950 4300
	1    0    0    -1  
$EndComp
$Comp
L POT RV2
U 1 1 5A10913A
P 6750 4300
F 0 "RV2" V 6575 4300 50  0000 C CNN
F 1 "1K LIN" V 6650 4300 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Vishay_T73XX_Vertical" H 6750 4300 50  0001 C CNN
F 3 "" H 6750 4300 50  0001 C CNN
	1    6750 4300
	1    0    0    -1  
$EndComp
$Comp
L Screw_Terminal_01x03 J1
U 1 1 5A109F90
P 5800 3100
F 0 "J1" H 5800 3300 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 5800 2900 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-3_P5.08mm" H 5800 3100 50  0001 C CNN
F 3 "" H 5800 3100 50  0001 C CNN
	1    5800 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6900 4450 6900 4300
Wire Wire Line
	4650 4450 6900 4450
Wire Wire Line
	5100 4450 5100 4300
Wire Wire Line
	4650 3950 4650 4450
Connection ~ 4950 4450
Wire Wire Line
	6450 4450 6450 3950
Connection ~ 6750 4450
Connection ~ 5100 4450
Wire Wire Line
	5100 4450 6450 4450
Connection ~ 5800 4450
Connection ~ 6450 4450
Wire Wire Line
	5800 3300 5800 4450
Wire Wire Line
	6750 3450 5900 3450
Wire Wire Line
	5900 3450 5900 3300
Wire Wire Line
	4950 3450 5700 3450
Wire Wire Line
	5700 3450 5700 3300
$EndSCHEMATC
