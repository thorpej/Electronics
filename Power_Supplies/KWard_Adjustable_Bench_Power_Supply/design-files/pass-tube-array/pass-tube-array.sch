EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "KWard Bench PSU - Pass tube array"
Date "2022-01-04"
Rev "1.0"
Comp "Copyright (c) 2017-2021 Kevin Ward and Jason R. Thorpe. See LICENSE."
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L jrt-Valves:6550 U1
U 1 1 61D35673
P 3500 2750
F 0 "U1" H 3750 3100 50  0000 L CNN
F 1 "6550" H 3750 3000 50  0000 L CNN
F 2 "jrt-TubeSockets:AES_P-ST8-193_Octal_T14" H 3500 2750 50  0001 C CNN
F 3 "" H 3500 2750 50  0001 C CNN
	1    3500 2750
	1    0    0    -1  
$EndComp
$Comp
L jrt-Valves:6550 U2
U 1 1 61D36D03
P 5000 2750
F 0 "U2" H 5250 3100 50  0000 L CNN
F 1 "6550" H 5250 3000 50  0000 L CNN
F 2 "jrt-TubeSockets:AES_P-ST8-193_Octal_T14" H 5000 2750 50  0001 C CNN
F 3 "" H 5000 2750 50  0001 C CNN
	1    5000 2750
	1    0    0    -1  
$EndComp
$Comp
L jrt-Valves:6550 U3
U 1 1 61D3CEF9
P 6500 2750
F 0 "U3" H 6750 3100 50  0000 L CNN
F 1 "6550" H 6750 3000 50  0000 L CNN
F 2 "jrt-TubeSockets:AES_P-ST8-193_Octal_T14" H 6500 2750 50  0001 C CNN
F 3 "" H 6500 2750 50  0001 C CNN
	1    6500 2750
	1    0    0    -1  
$EndComp
$Comp
L jrt-Valves:6550 U4
U 1 1 61D3CEFF
P 8000 2750
F 0 "U4" H 8250 3100 50  0000 L CNN
F 1 "6550" H 8250 3000 50  0000 L CNN
F 2 "jrt-TubeSockets:AES_P-ST8-193_Octal_T14" H 8000 2750 50  0001 C CNN
F 3 "" H 8000 2750 50  0001 C CNN
	1    8000 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 2350 8000 2200
Wire Wire Line
	8000 2200 6500 2200
Wire Wire Line
	6500 2200 6500 2350
Wire Wire Line
	6500 2200 5000 2200
Wire Wire Line
	5000 2200 5000 2350
Connection ~ 6500 2200
Wire Wire Line
	5000 2200 3500 2200
Wire Wire Line
	3500 2200 3500 2350
Connection ~ 5000 2200
$Comp
L Device:R R2
U 1 1 61D3DA40
P 3400 3300
F 0 "R2" H 3470 3346 50  0000 L CNN
F 1 "10" H 3470 3255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 3330 3300 50  0001 C CNN
F 3 "~" H 3400 3300 50  0001 C CNN
F 4 "594-5083NW10R00J" H 3400 3300 50  0001 C CNN "Mouser"
	1    3400 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 61D3E004
P 4900 3300
F 0 "R5" H 4970 3346 50  0000 L CNN
F 1 "10" H 4970 3255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 4830 3300 50  0001 C CNN
F 3 "~" H 4900 3300 50  0001 C CNN
F 4 "594-5083NW10R00J" H 4900 3300 50  0001 C CNN "Mouser"
	1    4900 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 61D3E3E5
P 6400 3300
F 0 "R8" H 6470 3346 50  0000 L CNN
F 1 "10" H 6470 3255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 6330 3300 50  0001 C CNN
F 3 "~" H 6400 3300 50  0001 C CNN
F 4 "594-5083NW10R00J" H 6400 3300 50  0001 C CNN "Mouser"
	1    6400 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 61D3E7AA
P 7900 3300
F 0 "R11" H 7970 3346 50  0000 L CNN
F 1 "10" H 7970 3255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 7830 3300 50  0001 C CNN
F 3 "~" H 7900 3300 50  0001 C CNN
F 4 "594-5083NW10R00J" H 7900 3300 50  0001 C CNN "Mouser"
	1    7900 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3450 4900 3450
Wire Wire Line
	4900 3450 6400 3450
Connection ~ 4900 3450
Wire Wire Line
	6400 3450 7900 3450
Connection ~ 6400 3450
$Comp
L Device:R R1
U 1 1 61D3F290
P 3000 3000
F 0 "R1" H 3070 3046 50  0000 L CNN
F 1 "1K" H 3070 2955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 2930 3000 50  0001 C CNN
F 3 "~" H 3000 3000 50  0001 C CNN
F 4 "594-5083NW1K000J" H 3000 3000 50  0001 C CNN "Mouser"
	1    3000 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 61D3F913
P 4500 3000
F 0 "R4" H 4570 3046 50  0000 L CNN
F 1 "1K" H 4570 2955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 4430 3000 50  0001 C CNN
F 3 "~" H 4500 3000 50  0001 C CNN
F 4 "594-5083NW1K000J" H 4500 3000 50  0001 C CNN "Mouser"
	1    4500 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 61D3FCCC
P 6000 3000
F 0 "R7" H 6070 3046 50  0000 L CNN
F 1 "1K" H 6070 2955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 5930 3000 50  0001 C CNN
F 3 "~" H 6000 3000 50  0001 C CNN
F 4 "594-5083NW1K000J" H 6000 3000 50  0001 C CNN "Mouser"
	1    6000 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 61D4012D
P 7500 3000
F 0 "R10" H 7570 3046 50  0000 L CNN
F 1 "1K" H 7570 2955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 7430 3000 50  0001 C CNN
F 3 "~" H 7500 3000 50  0001 C CNN
F 4 "594-5083NW1K000J" H 7500 3000 50  0001 C CNN "Mouser"
	1    7500 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2850 3200 2850
Wire Wire Line
	4500 2850 4700 2850
Wire Wire Line
	6000 2850 6200 2850
Wire Wire Line
	7500 2850 7700 2850
Wire Wire Line
	3000 3150 3000 3550
Wire Wire Line
	3000 3550 4500 3550
Wire Wire Line
	4500 3550 4500 3150
Wire Wire Line
	4500 3550 6000 3550
Wire Wire Line
	6000 3550 6000 3150
Connection ~ 4500 3550
Wire Wire Line
	6000 3550 7500 3550
Wire Wire Line
	7500 3550 7500 3150
Connection ~ 6000 3550
$Comp
L Device:R R3
U 1 1 61D41F48
P 3800 2900
F 0 "R3" H 3870 2946 50  0000 L CNN
F 1 "150" H 3870 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 3730 2900 50  0001 C CNN
F 3 "~" H 3800 2900 50  0001 C CNN
F 4 "594-5083NW150R0J" H 3800 2900 50  0001 C CNN "Mouser"
	1    3800 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 61D4220B
P 5300 2900
F 0 "R6" H 5370 2946 50  0000 L CNN
F 1 "150" H 5370 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 5230 2900 50  0001 C CNN
F 3 "~" H 5300 2900 50  0001 C CNN
F 4 "594-5083NW150R0J" H 5300 2900 50  0001 C CNN "Mouser"
	1    5300 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 61D425D0
P 6800 2900
F 0 "R9" H 6870 2946 50  0000 L CNN
F 1 "150" H 6870 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 6730 2900 50  0001 C CNN
F 3 "~" H 6800 2900 50  0001 C CNN
F 4 "594-5083NW150R0J" H 6800 2900 50  0001 C CNN "Mouser"
	1    6800 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 61D42995
P 8300 2900
F 0 "R12" H 8370 2946 50  0000 L CNN
F 1 "150" H 8370 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 8230 2900 50  0001 C CNN
F 3 "~" H 8300 2900 50  0001 C CNN
F 4 "594-5083NW150R0J" H 8300 2900 50  0001 C CNN "Mouser"
	1    8300 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 3050 3800 3650
Wire Wire Line
	3800 3650 5300 3650
Wire Wire Line
	5300 3650 5300 3050
Wire Wire Line
	5300 3650 6800 3650
Wire Wire Line
	6800 3650 6800 3050
Connection ~ 5300 3650
Wire Wire Line
	6800 3650 8300 3650
Wire Wire Line
	8300 3650 8300 3050
Connection ~ 6800 3650
$Comp
L jrt-Valves:6550 U1
U 2 1 61D45AEA
P 3500 4550
F 0 "U1" H 3728 4513 50  0000 L CNN
F 1 "6550" H 3728 4422 50  0000 L CNN
F 2 "jrt-TubeSockets:AES_P-ST8-193_Octal_T14" H 3500 4550 50  0001 C CNN
F 3 "" H 3500 4550 50  0001 C CNN
	2    3500 4550
	1    0    0    -1  
$EndComp
$Comp
L jrt-Valves:6550 U2
U 2 1 61D46395
P 5000 4550
F 0 "U2" H 5228 4513 50  0000 L CNN
F 1 "6550" H 5228 4422 50  0000 L CNN
F 2 "jrt-TubeSockets:AES_P-ST8-193_Octal_T14" H 5000 4550 50  0001 C CNN
F 3 "" H 5000 4550 50  0001 C CNN
	2    5000 4550
	1    0    0    -1  
$EndComp
$Comp
L jrt-Valves:6550 U3
U 2 1 61D47016
P 6500 4550
F 0 "U3" H 6728 4513 50  0000 L CNN
F 1 "6550" H 6728 4422 50  0000 L CNN
F 2 "jrt-TubeSockets:AES_P-ST8-193_Octal_T14" H 6500 4550 50  0001 C CNN
F 3 "" H 6500 4550 50  0001 C CNN
	2    6500 4550
	1    0    0    -1  
$EndComp
$Comp
L jrt-Valves:6550 U4
U 2 1 61D47C97
P 8000 4550
F 0 "U4" H 8228 4513 50  0000 L CNN
F 1 "6550" H 8228 4422 50  0000 L CNN
F 2 "jrt-TubeSockets:AES_P-ST8-193_Octal_T14" H 8000 4550 50  0001 C CNN
F 3 "" H 8000 4550 50  0001 C CNN
	2    8000 4550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x04 J1
U 1 1 61D53E8C
P 1500 2900
F 0 "J1" H 1418 3217 50  0000 C CNN
F 1 "Screw_Terminal_01x04" H 1418 3126 50  0000 C CNN
F 2 "jrt-TerminalBlocks:TE_AMP-4_P10.16mm" H 1500 2900 50  0001 C CNN
F 3 "~" H 1500 2900 50  0001 C CNN
	1    1500 2900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1700 2800 2050 2800
Wire Wire Line
	2050 2800 2050 2200
Wire Wire Line
	2050 2200 3500 2200
Connection ~ 3500 2200
Wire Wire Line
	1700 2900 2050 2900
Wire Wire Line
	2050 2900 2050 3650
Wire Wire Line
	2050 3650 3800 3650
Connection ~ 3800 3650
Wire Wire Line
	2150 3550 3000 3550
Connection ~ 3000 3550
Wire Wire Line
	2250 3450 3400 3450
Connection ~ 3400 3450
Text Notes 1400 2850 2    50   Italic 10
Anode
Text Notes 1400 2950 2    50   Italic 10
Screen
Text Notes 1400 3150 2    50   Italic 10
Grid
Text Notes 1400 3050 2    50   Italic 10
Cathode
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 61D5C0FE
P 1500 5100
F 0 "J2" H 1418 5317 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 1418 5226 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 1500 5100 50  0001 C CNN
F 3 "~" H 1500 5100 50  0001 C CNN
	1    1500 5100
	-1   0    0    -1  
$EndComp
Text Notes 1400 5250 2    50   Italic 10
6.3VAC\n6.4A
$Comp
L Device:R R13
U 1 1 61D616FD
P 8800 4950
F 0 "R13" H 8870 4996 50  0000 L CNN
F 1 "220" H 8870 4905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 8730 4950 50  0001 C CNN
F 3 "~" H 8800 4950 50  0001 C CNN
F 4 "594-5083NW220R0J" H 8800 4950 50  0001 C CNN "Mouser"
	1    8800 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 61D61D9A
P 9250 4950
F 0 "R14" H 9320 4996 50  0000 L CNN
F 1 "220" H 9320 4905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 9180 4950 50  0001 C CNN
F 3 "~" H 9250 4950 50  0001 C CNN
F 4 "594-5083NW220R0J" H 9250 4950 50  0001 C CNN "Mouser"
	1    9250 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 5200 9250 5100
Wire Wire Line
	8800 4800 9250 4800
Wire Wire Line
	7900 3450 8800 3450
Wire Wire Line
	8800 3450 8800 4800
Connection ~ 7900 3450
Connection ~ 8800 4800
Text GLabel 9250 5350 3    50   UnSpc ~ 0
Filament_A
Wire Wire Line
	9250 5200 9250 5350
Connection ~ 9250 5200
Text GLabel 8800 5350 3    50   UnSpc ~ 0
Filament_B
Wire Wire Line
	8800 5100 8800 5350
Connection ~ 8800 5100
Wire Wire Line
	1700 5200 3600 5200
Wire Wire Line
	1700 5100 3400 5100
Wire Wire Line
	3400 5000 3400 5100
Connection ~ 3400 5100
Wire Wire Line
	3600 5000 3600 5200
Connection ~ 3600 5200
Wire Wire Line
	7900 5000 7900 5100
Connection ~ 7900 5100
Wire Wire Line
	7900 5100 8800 5100
Wire Wire Line
	8100 5000 8100 5200
Connection ~ 8100 5200
Wire Wire Line
	8100 5200 9250 5200
Wire Wire Line
	2250 3450 2250 3000
Wire Wire Line
	2250 3000 1700 3000
Wire Wire Line
	2150 3550 2150 3100
Wire Wire Line
	2150 3100 1700 3100
Wire Wire Line
	3400 5100 5100 5100
Wire Wire Line
	3600 5200 4900 5200
Wire Wire Line
	4900 5000 4900 5200
Connection ~ 4900 5200
Wire Wire Line
	4900 5200 6400 5200
Wire Wire Line
	5100 5000 5100 5100
Connection ~ 5100 5100
Wire Wire Line
	5100 5100 6600 5100
Wire Wire Line
	6400 5000 6400 5200
Connection ~ 6400 5200
Wire Wire Line
	6400 5200 8100 5200
Wire Wire Line
	6600 5000 6600 5100
Connection ~ 6600 5100
Wire Wire Line
	6600 5100 7900 5100
$EndSCHEMATC
