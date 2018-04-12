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
LIBS:thorpej-Tubes
LIBS:Nixie_IN-14_Breakout-cache
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
L IN-14 N1
U 1 1 5AA69F49
P 5650 3600
F 0 "N1" H 5550 4325 50  0000 L BNN
F 1 "IN-14" H 5650 3600 50  0000 L BNN
F 2 "thorpej-TubeFootprints:Nixie-IN-14" H 5650 3600 60  0001 C CNN
F 3 "" H 5650 3600 60  0001 C CNN
	1    5650 3600
	1    0    0    -1  
$EndComp
$Comp
L Screw_Terminal_01x03 J1
U 1 1 5AA6AA62
P 4500 3300
F 0 "J1" H 4650 3400 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 5050 3300 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-3_P5.08mm" H 4500 3300 50  0001 C CNN
F 3 "" H 4500 3300 50  0001 C CNN
	1    4500 3300
	-1   0    0    -1  
$EndComp
$Comp
L Screw_Terminal_01x03 J2
U 1 1 5AA6AB14
P 4500 3600
F 0 "J2" H 4650 3700 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 5050 3600 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-3_P5.08mm" H 4500 3600 50  0001 C CNN
F 3 "" H 4500 3600 50  0001 C CNN
	1    4500 3600
	-1   0    0    -1  
$EndComp
$Comp
L Screw_Terminal_01x03 J3
U 1 1 5AA6AB87
P 4500 3900
F 0 "J3" H 4650 4000 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 5050 3900 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-3_P5.08mm" H 4500 3900 50  0001 C CNN
F 3 "" H 4500 3900 50  0001 C CNN
	1    4500 3900
	-1   0    0    -1  
$EndComp
$Comp
L Screw_Terminal_01x02 J4
U 1 1 5AA6ABDC
P 5650 4850
F 0 "J4" V 5650 4950 50  0000 C CNN
F 1 "Screw_Terminal_01x02" V 5800 4800 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 5650 4850 50  0001 C CNN
F 3 "" H 5650 4850 50  0001 C CNN
	1    5650 4850
	0    -1   1    0   
$EndComp
$Comp
L Screw_Terminal_01x02 J5
U 1 1 5AA6AD08
P 6900 3600
F 0 "J5" H 6900 3700 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 7400 3550 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 6900 3600 50  0001 C CNN
F 3 "" H 6900 3600 50  0001 C CNN
	1    6900 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3200 5350 3200
Wire Wire Line
	4700 3300 5350 3300
Wire Wire Line
	4700 3400 5350 3400
Wire Wire Line
	4700 3500 5350 3500
Wire Wire Line
	4700 3600 5350 3600
Wire Wire Line
	4700 3700 5350 3700
Wire Wire Line
	4700 3800 5350 3800
Wire Wire Line
	4700 3900 5350 3900
Wire Wire Line
	4700 4000 5350 4000
Wire Wire Line
	5650 4650 5350 4650
Wire Wire Line
	5350 4650 5350 4100
Wire Wire Line
	5750 4650 6050 4650
Wire Wire Line
	6050 4650 6050 4100
$Comp
L R R1
U 1 1 5AA6AE9E
P 6400 3700
F 0 "R1" V 6480 3700 50  0000 C CNN
F 1 "R" V 6400 3700 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 6330 3700 50  0001 C CNN
F 3 "" H 6400 3700 50  0001 C CNN
	1    6400 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 3700 6550 3700
Wire Wire Line
	6250 3700 6050 3700
Wire Wire Line
	6700 3600 6700 3200
Wire Wire Line
	6700 3200 6050 3200
$EndSCHEMATC
