EESchema Schematic File Version 4
LIBS:STPre6080-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 4
Title "6AS7 Pre-amp Mk I"
Date "2019-09-19"
Rev "1.0"
Comp "San Francisco Electronworks"
Comment1 "For hobbyist use only."
Comment2 "Copyright 2019 Jason R. Thorpe.  All rights reserved."
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 700  2800 0    50   ~ 0
6AS7 cathode resistors are 1% 5W wire-wound resistors.\nAll other resistors are 1% 1/2W film resistors.
$Comp
L Switch:SW_DPDT_x2 SW2
U 1 1 5DA0A320
P 3050 4550
F 0 "SW2" H 3100 4850 50  0000 C CNN
F 1 "SW_DPDT_x2" H 3050 4750 50  0000 C CNN
F 2 "" H 3050 4550 50  0001 C CNN
F 3 "~" H 3050 4550 50  0001 C CNN
F 4 "" H 3050 4550 50  0001 C CNN "Part"
	1    3050 4550
	-1   0    0    -1  
$EndComp
Text Notes 2850 4150 0    50   ~ 0
Tone bypass
$Comp
L Device:R_POT RV1
U 1 1 5DA0A327
P 3300 4800
F 0 "RV1" H 3231 4754 50  0000 R CNN
F 1 "250K" H 3231 4845 50  0000 R CNN
F 2 "" H 3300 4800 50  0001 C CNN
F 3 "~" H 3300 4800 50  0001 C CNN
	1    3300 4800
	1    0    0    1   
$EndComp
Text Notes 3450 4700 1    50   ~ 0
CW ->
Text Notes 2800 5100 0    50   ~ 0
Volume\naudio taper
Wire Wire Line
	3250 4550 3300 4550
Wire Wire Line
	3300 4550 3300 4650
$Comp
L power:GND #PWR?
U 1 1 5DA0A339
P 3300 5050
F 0 "#PWR?" H 3300 4800 50  0001 C CNN
F 1 "GND" H 3305 4877 50  0000 C CNN
F 2 "" H 3300 5050 50  0001 C CNN
F 3 "" H 3300 5050 50  0001 C CNN
	1    3300 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 4950 3300 5050
Text GLabel 5000 4400 2    50   Output ~ 0
L_output
$Comp
L jrt-Power:+300V #PWR?
U 1 1 5D97E177
P 7000 1000
AR Path="/5D97E177" Ref="#PWR?"  Part="1" 
AR Path="/5D91263B/5D97E177" Ref="#PWR?"  Part="1" 
AR Path="/5DA0A318/5D97E177" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7000 850 50  0001 C CNN
F 1 "+300V" H 7015 1173 50  0000 C CNN
F 2 "" H 7000 1000 50  0001 C CNN
F 3 "" H 7000 1000 50  0001 C CNN
	1    7000 1000
	1    0    0    -1  
$EndComp
Connection ~ 6900 2650
Wire Wire Line
	6900 2700 6900 2650
Wire Wire Line
	7250 2650 6900 2650
Wire Wire Line
	7250 2600 7250 2650
Wire Wire Line
	7250 2350 7250 2400
Wire Wire Line
	6900 2350 6900 2400
Connection ~ 6900 2350
Wire Wire Line
	7250 2350 6900 2350
Wire Wire Line
	6900 2600 6900 2650
$Comp
L Device:CP1_Small C1
U 1 1 5D97E189
P 7250 2500
AR Path="/5D97E189" Ref="C1"  Part="1" 
AR Path="/5D91263B/5D97E189" Ref="C?"  Part="1" 
AR Path="/5DA0A318/5D97E189" Ref="C?"  Part="1" 
F 0 "C1" H 7341 2546 50  0000 L CNN
F 1 "100uF" H 7341 2455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7250 2500 50  0001 C CNN
F 3 "~" H 7250 2500 50  0001 C CNN
F 4 "Nichicon ULD1C101MED1TD" H 7250 2500 50  0001 C CNN "Part"
	1    7250 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1000 7000 1100
Wire Wire Line
	6900 2300 6900 2350
$Comp
L power:GND #PWR?
U 1 1 5D97E195
P 6900 2700
AR Path="/5D97E195" Ref="#PWR?"  Part="1" 
AR Path="/5D91263B/5D97E195" Ref="#PWR?"  Part="1" 
AR Path="/5DA0A318/5D97E195" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6900 2450 50  0001 C CNN
F 1 "GND" H 6905 2527 50  0000 C CNN
F 2 "" H 6900 2700 50  0001 C CNN
F 3 "" H 6900 2700 50  0001 C CNN
	1    6900 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5D97E19B
P 6900 2500
AR Path="/5D97E19B" Ref="R4"  Part="1" 
AR Path="/5D91263B/5D97E19B" Ref="R?"  Part="1" 
AR Path="/5DA0A318/5D97E19B" Ref="R?"  Part="1" 
F 0 "R4" H 6959 2546 50  0000 L CNN
F 1 "1.2K" H 6959 2455 50  0000 L CNN
F 2 "" H 6900 2500 50  0001 C CNN
F 3 "~" H 6900 2500 50  0001 C CNN
	1    6900 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5D97E1A1
P 6400 2300
AR Path="/5D97E1A1" Ref="R3"  Part="1" 
AR Path="/5D91263B/5D97E1A1" Ref="R?"  Part="1" 
AR Path="/5DA0A318/5D97E1A1" Ref="R?"  Part="1" 
F 0 "R3" H 6200 2350 50  0000 L CNN
F 1 "1M" H 6200 2250 50  0000 L CNN
F 2 "" H 6400 2300 50  0001 C CNN
F 3 "~" H 6400 2300 50  0001 C CNN
	1    6400 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5D97E1A7
P 7000 1200
AR Path="/5D97E1A7" Ref="R1"  Part="1" 
AR Path="/5D91263B/5D97E1A7" Ref="R?"  Part="1" 
AR Path="/5DA0A318/5D97E1A7" Ref="R?"  Part="1" 
F 0 "R1" H 6750 1250 50  0000 L CNN
F 1 "200K" H 6750 1150 50  0000 L CNN
F 2 "" H 7000 1200 50  0001 C CNN
F 3 "~" H 7000 1200 50  0001 C CNN
	1    7000 1200
	1    0    0    -1  
$EndComp
$Comp
L Valve:ECC83 U1
U 1 1 5D97E1AD
P 7000 1900
AR Path="/5D97E1AD" Ref="U1"  Part="1" 
AR Path="/5D91263B/5D97E1AD" Ref="U?"  Part="2" 
AR Path="/5DA0A318/5D97E1AD" Ref="U?"  Part="1" 
F 0 "U1" H 7228 1946 50  0000 L CNN
F 1 "ECC83" H 7228 1855 50  0000 L CNN
F 2 "Valve:Valve_Noval_P" H 7270 1500 50  0001 C CNN
F 3 "http://www.r-type.org/pdfs/ecc83.pdf" H 7000 1900 50  0001 C CNN
	1    7000 1900
	1    0    0    -1  
$EndComp
Text Notes 7350 2650 0    50   Italic 10
16V
Wire Wire Line
	7000 1300 7000 1450
$Sheet
S 3150 700  2000 1750
U 5D9A6011
F0 "STPre6080PCB" 50
F1 "STPre6080PCB.sch" 50
$EndSheet
Text Notes 3550 1650 0    50   Italic 10
Input buffer and tone controls.\n(PCB)
Text GLabel 6300 1900 0    50   Input ~ 0
L_tone_amp_input
Text GLabel 7300 1450 2    50   Output ~ 0
L_tone_amp_output
Wire Wire Line
	7000 1450 7300 1450
Connection ~ 7000 1450
Wire Wire Line
	7000 1450 7000 1500
$Comp
L Device:R_Small R2
U 1 1 5DA3907D
P 6600 1900
F 0 "R2" V 6404 1900 50  0000 C CNN
F 1 "1K" V 6495 1900 50  0000 C CNN
F 2 "" H 6600 1900 50  0001 C CNN
F 3 "~" H 6600 1900 50  0001 C CNN
	1    6600 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 1900 6400 1900
Wire Wire Line
	6400 2200 6400 1900
Connection ~ 6400 1900
Wire Wire Line
	6400 1900 6500 1900
Wire Wire Line
	6400 2400 6400 2650
Wire Wire Line
	6400 2650 6900 2650
$Comp
L jrt-Power:+300V #PWR?
U 1 1 5DAA7C62
P 9150 1000
AR Path="/5DAA7C62" Ref="#PWR?"  Part="1" 
AR Path="/5D91263B/5DAA7C62" Ref="#PWR?"  Part="1" 
AR Path="/5DA0A318/5DAA7C62" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9150 850 50  0001 C CNN
F 1 "+300V" H 9165 1173 50  0000 C CNN
F 2 "" H 9150 1000 50  0001 C CNN
F 3 "" H 9150 1000 50  0001 C CNN
	1    9150 1000
	1    0    0    -1  
$EndComp
Connection ~ 9050 2650
Wire Wire Line
	9050 2700 9050 2650
Wire Wire Line
	9400 2650 9050 2650
Wire Wire Line
	9400 2600 9400 2650
Wire Wire Line
	9400 2350 9400 2400
Wire Wire Line
	9050 2350 9050 2400
Connection ~ 9050 2350
Wire Wire Line
	9400 2350 9050 2350
Wire Wire Line
	9050 2600 9050 2650
$Comp
L Device:CP1_Small C2
U 1 1 5DAA7C72
P 9400 2500
AR Path="/5DAA7C72" Ref="C2"  Part="1" 
AR Path="/5D91263B/5DAA7C72" Ref="C?"  Part="1" 
AR Path="/5DA0A318/5DAA7C72" Ref="C?"  Part="1" 
F 0 "C2" H 9491 2546 50  0000 L CNN
F 1 "100uF" H 9491 2455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9400 2500 50  0001 C CNN
F 3 "~" H 9400 2500 50  0001 C CNN
F 4 "Nichicon ULD1C101MED1TD" H 9400 2500 50  0001 C CNN "Part"
	1    9400 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 1000 9150 1100
Wire Wire Line
	9050 2300 9050 2350
$Comp
L power:GND #PWR?
U 1 1 5DAA7C7A
P 9050 2700
AR Path="/5DAA7C7A" Ref="#PWR?"  Part="1" 
AR Path="/5D91263B/5DAA7C7A" Ref="#PWR?"  Part="1" 
AR Path="/5DA0A318/5DAA7C7A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9050 2450 50  0001 C CNN
F 1 "GND" H 9055 2527 50  0000 C CNN
F 2 "" H 9050 2700 50  0001 C CNN
F 3 "" H 9050 2700 50  0001 C CNN
	1    9050 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R8
U 1 1 5DAA7C80
P 9050 2500
AR Path="/5DAA7C80" Ref="R8"  Part="1" 
AR Path="/5D91263B/5DAA7C80" Ref="R?"  Part="1" 
AR Path="/5DA0A318/5DAA7C80" Ref="R?"  Part="1" 
F 0 "R8" H 9109 2546 50  0000 L CNN
F 1 "1.2K" H 9109 2455 50  0000 L CNN
F 2 "" H 9050 2500 50  0001 C CNN
F 3 "~" H 9050 2500 50  0001 C CNN
	1    9050 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R7
U 1 1 5DAA7C86
P 8550 2300
AR Path="/5DAA7C86" Ref="R7"  Part="1" 
AR Path="/5D91263B/5DAA7C86" Ref="R?"  Part="1" 
AR Path="/5DA0A318/5DAA7C86" Ref="R?"  Part="1" 
F 0 "R7" H 8350 2350 50  0000 L CNN
F 1 "1M" H 8350 2250 50  0000 L CNN
F 2 "" H 8550 2300 50  0001 C CNN
F 3 "~" H 8550 2300 50  0001 C CNN
	1    8550 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5DAA7C8C
P 9150 1200
AR Path="/5DAA7C8C" Ref="R5"  Part="1" 
AR Path="/5D91263B/5DAA7C8C" Ref="R?"  Part="1" 
AR Path="/5DA0A318/5DAA7C8C" Ref="R?"  Part="1" 
F 0 "R5" H 8900 1250 50  0000 L CNN
F 1 "200K" H 8900 1150 50  0000 L CNN
F 2 "" H 9150 1200 50  0001 C CNN
F 3 "~" H 9150 1200 50  0001 C CNN
	1    9150 1200
	1    0    0    -1  
$EndComp
$Comp
L Valve:ECC83 U1
U 2 1 5DAA7C92
P 9150 1900
AR Path="/5DAA7C92" Ref="U1"  Part="2" 
AR Path="/5D91263B/5DAA7C92" Ref="U?"  Part="2" 
AR Path="/5DA0A318/5DAA7C92" Ref="U?"  Part="1" 
F 0 "U1" H 9378 1946 50  0000 L CNN
F 1 "ECC83" H 9378 1855 50  0000 L CNN
F 2 "Valve:Valve_Noval_P" H 9420 1500 50  0001 C CNN
F 3 "http://www.r-type.org/pdfs/ecc83.pdf" H 9150 1900 50  0001 C CNN
	2    9150 1900
	1    0    0    -1  
$EndComp
Text Notes 9500 2650 0    50   Italic 10
16V
Wire Wire Line
	9150 1300 9150 1450
Text GLabel 8450 1900 0    50   Input ~ 0
R_tone_amp_input
Text GLabel 9450 1450 2    50   Output ~ 0
R_tone_amp_output
Wire Wire Line
	9150 1450 9450 1450
Connection ~ 9150 1450
Wire Wire Line
	9150 1450 9150 1500
$Comp
L Device:R_Small R6
U 1 1 5DAA7C9F
P 8750 1900
F 0 "R6" V 8554 1900 50  0000 C CNN
F 1 "1K" V 8645 1900 50  0000 C CNN
F 2 "" H 8750 1900 50  0001 C CNN
F 3 "~" H 8750 1900 50  0001 C CNN
	1    8750 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	8450 1900 8550 1900
Wire Wire Line
	8550 2200 8550 1900
Connection ~ 8550 1900
Wire Wire Line
	8550 1900 8650 1900
Wire Wire Line
	8550 2400 8550 2650
Wire Wire Line
	8550 2650 9050 2650
$Comp
L Device:C_Small C4
U 1 1 5DAC642B
P 4700 4400
AR Path="/5DAC642B" Ref="C4"  Part="1" 
AR Path="/5D979F4E/5DAC642B" Ref="C?"  Part="1" 
AR Path="/5DA0A33C/5DAC642B" Ref="C?"  Part="1" 
F 0 "C4" V 4471 4400 50  0000 C CNN
F 1 "4.7uF" V 4562 4400 50  0000 C CNN
F 2 "" H 4700 4400 50  0001 C CNN
F 3 "~" H 4700 4400 50  0001 C CNN
F 4 "Panasonic ECW-FD2J475JB" V 4700 4400 50  0001 C CNN "Part"
	1    4700 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R10
U 1 1 5DAC6432
P 3950 5400
AR Path="/5DAC6432" Ref="R10"  Part="1" 
AR Path="/5D979F4E/5DAC6432" Ref="R?"  Part="1" 
AR Path="/5DA0A33C/5DAC6432" Ref="R?"  Part="1" 
F 0 "R10" H 4009 5446 50  0000 L CNN
F 1 "1K" H 4009 5355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_Power_L25.0mm_W9.0mm_P27.94mm" H 3950 5400 50  0001 C CNN
F 3 "~" H 3950 5400 50  0001 C CNN
F 4 "Ohmite 45F1K0E" H 3950 5400 50  0001 C CNN "Part"
	1    3950 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C3
U 1 1 5DAC643A
P 4300 5400
AR Path="/5DAC643A" Ref="C3"  Part="1" 
AR Path="/5D979F4E/5DAC643A" Ref="C?"  Part="1" 
AR Path="/5DA0A33C/5DAC643A" Ref="C?"  Part="1" 
F 0 "C3" H 4391 5446 50  0000 L CNN
F 1 "100uF" H 4391 5355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 4300 5400 50  0001 C CNN
F 3 "~" H 4300 5400 50  0001 C CNN
F 4 "Panasonic EEU-FR2A101" H 4300 5400 50  0001 C CNN "Part"
F 5 "Nichicon UHW2A101MPD1TD" H 4300 5400 50  0001 C CNN "Alt Part"
	1    4300 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5550 3950 5500
Connection ~ 3950 5550
$Comp
L power:GND #PWR?
U 1 1 5DAC6442
P 3950 5600
AR Path="/5DAC6442" Ref="#PWR?"  Part="1" 
AR Path="/5D979F4E/5DAC6442" Ref="#PWR?"  Part="1" 
AR Path="/5DA0A33C/5DAC6442" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3950 5350 50  0001 C CNN
F 1 "GND" H 3955 5427 50  0000 C CNN
F 2 "" H 3950 5600 50  0001 C CNN
F 3 "" H 3950 5600 50  0001 C CNN
	1    3950 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5550 3950 5600
$Comp
L Device:R_Small R11
U 1 1 5DAC6449
P 4850 5150
AR Path="/5DAC6449" Ref="R11"  Part="1" 
AR Path="/5D979F4E/5DAC6449" Ref="R?"  Part="1" 
AR Path="/5DA0A33C/5DAC6449" Ref="R?"  Part="1" 
F 0 "R11" H 4909 5196 50  0000 L CNN
F 1 "1M" H 4909 5105 50  0000 L CNN
F 2 "" H 4850 5150 50  0001 C CNN
F 3 "~" H 4850 5150 50  0001 C CNN
	1    4850 5150
	1    0    0    -1  
$EndComp
$Comp
L jrt-Valves:6AS7 U3
U 1 1 5DAC6455
P 4050 4800
AR Path="/5DAC6455" Ref="U3"  Part="1" 
AR Path="/5D979F4E/5DAC6455" Ref="U?"  Part="1" 
AR Path="/5DA0A33C/5DAC6455" Ref="U?"  Part="1" 
F 0 "U3" H 4278 4846 50  0000 L CNN
F 1 "6AS7" H 4278 4755 50  0000 L CNN
F 2 "Valve:Valve_Octal" H 4320 4400 50  0001 C CNN
F 3 "" H 4050 4800 50  0001 C CNN
	1    4050 4800
	1    0    0    -1  
$EndComp
Text Notes 4200 3800 0    50   Italic 0
CCS adjustment should be set to\n75R nominal.\n\nRead 40V across 6AS7 cathode\nresistor for 40mA.
Wire Wire Line
	3950 5200 3950 5250
Wire Wire Line
	3950 5550 4300 5550
Wire Wire Line
	3950 5250 4300 5250
Wire Wire Line
	4300 5250 4300 5300
Connection ~ 3950 5250
Wire Wire Line
	3950 5250 3950 5300
Wire Wire Line
	4300 5500 4300 5550
$Comp
L Device:R_Small R9
U 1 1 5DAC646F
P 3650 4800
AR Path="/5DAC646F" Ref="R9"  Part="1" 
AR Path="/5D979F4E/5DAC646F" Ref="R?"  Part="1" 
AR Path="/5DA0A33C/5DAC646F" Ref="R?"  Part="1" 
F 0 "R9" V 3454 4800 50  0000 C CNN
F 1 "1K" V 3545 4800 50  0000 C CNN
F 2 "" H 3650 4800 50  0001 C CNN
F 3 "~" H 3650 4800 50  0001 C CNN
	1    3650 4800
	0    1    1    0   
$EndComp
Text Notes 3650 5500 0    50   Italic 10
5W 1%\nWW
Text Notes 4400 5550 0    50   Italic 10
100V
$Comp
L jrt-Regulators:2ChanCCSLoad U2
U 1 1 5DB45136
P 5900 3600
F 0 "U2" H 6228 3646 50  0000 L CNN
F 1 "2ChanCCSLoad" H 6228 3555 50  0000 L CNN
F 2 "" H 5900 3600 50  0001 C CNN
F 3 "" H 5900 3600 50  0001 C CNN
	1    5900 3600
	1    0    0    -1  
$EndComp
$Comp
L jrt-Power:+160V #PWR?
U 1 1 5DB475D0
P 5900 3300
F 0 "#PWR?" H 5900 3150 50  0001 C CNN
F 1 "+160V" H 5915 3473 50  0000 C CNN
F 2 "" H 5900 3300 50  0001 C CNN
F 3 "" H 5900 3300 50  0001 C CNN
	1    5900 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4400 4600 4400
Wire Wire Line
	4800 4400 4850 4400
Wire Wire Line
	4850 4400 4850 5050
$Comp
L power:GND #PWR?
U 1 1 5DB66A31
P 4850 5600
F 0 "#PWR?" H 4850 5350 50  0001 C CNN
F 1 "GND" H 4855 5427 50  0000 C CNN
F 2 "" H 4850 5600 50  0001 C CNN
F 3 "" H 4850 5600 50  0001 C CNN
	1    4850 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 5250 4850 5600
Wire Wire Line
	4850 4400 5000 4400
Connection ~ 4850 4400
Text GLabel 2650 4450 0    50   Input ~ 0
L_tone_output
Text GLabel 2650 4650 0    50   Input ~ 0
L_buffer_output
Wire Wire Line
	2650 4450 2850 4450
Wire Wire Line
	2650 4650 2850 4650
Wire Wire Line
	3450 4800 3550 4800
$Comp
L Switch:SW_DPDT_x2 SW2
U 2 1 5DC3E27F
P 6650 4550
F 0 "SW2" H 6700 4850 50  0000 C CNN
F 1 "SW_DPDT_x2" H 6650 4750 50  0000 C CNN
F 2 "" H 6650 4550 50  0001 C CNN
F 3 "~" H 6650 4550 50  0001 C CNN
F 4 "" H 6650 4550 50  0001 C CNN "Part"
	2    6650 4550
	-1   0    0    -1  
$EndComp
Text Notes 6450 4150 0    50   ~ 0
Tone bypass
$Comp
L Device:R_POT RV2
U 1 1 5DC3E286
P 6900 4800
F 0 "RV2" H 6831 4754 50  0000 R CNN
F 1 "250K" H 6831 4845 50  0000 R CNN
F 2 "" H 6900 4800 50  0001 C CNN
F 3 "~" H 6900 4800 50  0001 C CNN
	1    6900 4800
	1    0    0    1   
$EndComp
Text Notes 7050 4700 1    50   ~ 0
CW ->
Text Notes 6400 5100 0    50   ~ 0
Volume\naudio taper
Wire Wire Line
	6850 4550 6900 4550
Wire Wire Line
	6900 4550 6900 4650
$Comp
L power:GND #PWR?
U 1 1 5DC3E290
P 6900 5050
F 0 "#PWR?" H 6900 4800 50  0001 C CNN
F 1 "GND" H 6905 4877 50  0000 C CNN
F 2 "" H 6900 5050 50  0001 C CNN
F 3 "" H 6900 5050 50  0001 C CNN
	1    6900 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 4950 6900 5050
Text GLabel 8600 4400 2    50   Output ~ 0
R_output
$Comp
L Device:C_Small C6
U 1 1 5DC3E299
P 8300 4400
AR Path="/5DC3E299" Ref="C6"  Part="1" 
AR Path="/5D979F4E/5DC3E299" Ref="C?"  Part="1" 
AR Path="/5DA0A33C/5DC3E299" Ref="C?"  Part="1" 
F 0 "C6" V 8071 4400 50  0000 C CNN
F 1 "4.7uF" V 8162 4400 50  0000 C CNN
F 2 "" H 8300 4400 50  0001 C CNN
F 3 "~" H 8300 4400 50  0001 C CNN
F 4 "Panasonic ECW-FD2J475JB" V 8300 4400 50  0001 C CNN "Part"
	1    8300 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R13
U 1 1 5DC3E2A0
P 7550 5400
AR Path="/5DC3E2A0" Ref="R13"  Part="1" 
AR Path="/5D979F4E/5DC3E2A0" Ref="R?"  Part="1" 
AR Path="/5DA0A33C/5DC3E2A0" Ref="R?"  Part="1" 
F 0 "R13" H 7609 5446 50  0000 L CNN
F 1 "1K" H 7609 5355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_Power_L25.0mm_W9.0mm_P27.94mm" H 7550 5400 50  0001 C CNN
F 3 "~" H 7550 5400 50  0001 C CNN
F 4 "Ohmite 45F1K0E" H 7550 5400 50  0001 C CNN "Part"
	1    7550 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C5
U 1 1 5DC3E2A8
P 7900 5400
AR Path="/5DC3E2A8" Ref="C5"  Part="1" 
AR Path="/5D979F4E/5DC3E2A8" Ref="C?"  Part="1" 
AR Path="/5DA0A33C/5DC3E2A8" Ref="C?"  Part="1" 
F 0 "C5" H 7991 5446 50  0000 L CNN
F 1 "100uF" H 7991 5355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 7900 5400 50  0001 C CNN
F 3 "~" H 7900 5400 50  0001 C CNN
F 4 "Panasonic EEU-FR2A101" H 7900 5400 50  0001 C CNN "Part"
F 5 "Nichicon UHW2A101MPD1TD" H 7900 5400 50  0001 C CNN "Alt Part"
	1    7900 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 5550 7550 5500
Connection ~ 7550 5550
$Comp
L power:GND #PWR?
U 1 1 5DC3E2B0
P 7550 5600
AR Path="/5DC3E2B0" Ref="#PWR?"  Part="1" 
AR Path="/5D979F4E/5DC3E2B0" Ref="#PWR?"  Part="1" 
AR Path="/5DA0A33C/5DC3E2B0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7550 5350 50  0001 C CNN
F 1 "GND" H 7555 5427 50  0000 C CNN
F 2 "" H 7550 5600 50  0001 C CNN
F 3 "" H 7550 5600 50  0001 C CNN
	1    7550 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 5550 7550 5600
$Comp
L Device:R_Small R14
U 1 1 5DC3E2B7
P 8450 5150
AR Path="/5DC3E2B7" Ref="R14"  Part="1" 
AR Path="/5D979F4E/5DC3E2B7" Ref="R?"  Part="1" 
AR Path="/5DA0A33C/5DC3E2B7" Ref="R?"  Part="1" 
F 0 "R14" H 8509 5196 50  0000 L CNN
F 1 "1M" H 8509 5105 50  0000 L CNN
F 2 "" H 8450 5150 50  0001 C CNN
F 3 "~" H 8450 5150 50  0001 C CNN
	1    8450 5150
	1    0    0    -1  
$EndComp
$Comp
L jrt-Valves:6AS7 U3
U 2 1 5DC3E2BD
P 7650 4800
AR Path="/5DC3E2BD" Ref="U3"  Part="2" 
AR Path="/5D979F4E/5DC3E2BD" Ref="U?"  Part="1" 
AR Path="/5DA0A33C/5DC3E2BD" Ref="U?"  Part="1" 
F 0 "U3" H 7878 4846 50  0000 L CNN
F 1 "6AS7" H 7878 4755 50  0000 L CNN
F 2 "Valve:Valve_Octal" H 7920 4400 50  0001 C CNN
F 3 "" H 7650 4800 50  0001 C CNN
	2    7650 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 5200 7550 5250
Wire Wire Line
	7550 5550 7900 5550
Wire Wire Line
	7550 5250 7900 5250
Wire Wire Line
	7900 5250 7900 5300
Connection ~ 7550 5250
Wire Wire Line
	7550 5250 7550 5300
Wire Wire Line
	7900 5500 7900 5550
$Comp
L Device:R_Small R12
U 1 1 5DC3E2CA
P 7250 4800
AR Path="/5DC3E2CA" Ref="R12"  Part="1" 
AR Path="/5D979F4E/5DC3E2CA" Ref="R?"  Part="1" 
AR Path="/5DA0A33C/5DC3E2CA" Ref="R?"  Part="1" 
F 0 "R12" V 7054 4800 50  0000 C CNN
F 1 "1K" V 7145 4800 50  0000 C CNN
F 2 "" H 7250 4800 50  0001 C CNN
F 3 "~" H 7250 4800 50  0001 C CNN
	1    7250 4800
	0    1    1    0   
$EndComp
Text Notes 7250 5500 0    50   Italic 10
5W 1%\nWW
Text Notes 8000 5550 0    50   Italic 10
100V
Wire Wire Line
	7650 4400 8200 4400
Wire Wire Line
	8400 4400 8450 4400
Wire Wire Line
	8450 4400 8450 5050
$Comp
L power:GND #PWR?
U 1 1 5DC3E2D5
P 8450 5600
F 0 "#PWR?" H 8450 5350 50  0001 C CNN
F 1 "GND" H 8455 5427 50  0000 C CNN
F 2 "" H 8450 5600 50  0001 C CNN
F 3 "" H 8450 5600 50  0001 C CNN
	1    8450 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 5250 8450 5600
Wire Wire Line
	8450 4400 8600 4400
Connection ~ 8450 4400
Text GLabel 6250 4450 0    50   Input ~ 0
R_tone_output
Text GLabel 6250 4650 0    50   Input ~ 0
R_buffer_output
Wire Wire Line
	6250 4450 6450 4450
Wire Wire Line
	6250 4650 6450 4650
Wire Wire Line
	7050 4800 7150 4800
$Sheet
S 4400 6150 1700 1300
U 5DC527CD
F0 "STPre6080Heaters" 50
F1 "STPre6080Heaters.sch" 50
$EndSheet
Text Notes 4750 7300 0    50   Italic 10
Heater configuration circuit
Wire Notes Line
	5350 700  10300 700 
Wire Notes Line
	10300 700  10300 3000
Wire Notes Line
	10300 3000 5350 3000
Wire Notes Line
	5350 3000 5350 700 
Text Notes 7600 950  0    50   Italic 10
Tone control amplifiers
Wire Wire Line
	6100 3900 7650 3900
Wire Wire Line
	7650 3900 7650 4400
Connection ~ 7650 4400
Wire Wire Line
	5700 3900 4050 3900
Wire Wire Line
	4050 3900 4050 4400
Connection ~ 4050 4400
Wire Notes Line
	1950 3050 9050 3050
Wire Notes Line
	9050 3050 9050 5900
Wire Notes Line
	9050 5900 1950 5900
Wire Notes Line
	1950 5900 1950 3050
Text Notes 2150 3250 0    50   Italic 10
Gain and output stage
$Comp
L jrt-Switches:SW_Rotary2x4_CandK_A20403RNZQ SW1
U 1 1 5D84D437
P 1800 1600
F 0 "SW1" H 1800 2190 50  0000 C CNN
F 1 "SW_Rotary2x4_CandK_A20403RNZQ" H 1800 2099 50  0000 C CNN
F 2 "" H 1700 2200 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/60/arotary-1369275.pdf" H 1700 2200 50  0001 C CNN
	1    1800 1600
	-1   0    0    -1  
$EndComp
Text GLabel 1250 1200 0    50   Input ~ 0
L_in_1
Text GLabel 1250 1300 0    50   Input ~ 0
L_in_2
Text GLabel 1250 1400 0    50   Input ~ 0
L_in_3
Text GLabel 1250 1500 0    50   Input ~ 0
L_in_4
Text GLabel 1250 1700 0    50   Input ~ 0
R_in_1
Text GLabel 1250 1800 0    50   Input ~ 0
R_in_2
Text GLabel 1250 1900 0    50   Input ~ 0
R_in_3
Text GLabel 1250 2000 0    50   Input ~ 0
R_in_4
Wire Wire Line
	1250 1200 1400 1200
Wire Wire Line
	1250 1300 1400 1300
Wire Wire Line
	1250 1400 1400 1400
Wire Wire Line
	1250 1500 1400 1500
Wire Wire Line
	1250 1700 1400 1700
Wire Wire Line
	1250 1800 1400 1800
Wire Wire Line
	1250 1900 1400 1900
Wire Wire Line
	1250 2000 1400 2000
Text GLabel 2400 1350 2    50   Output ~ 0
L_buffer_input
Text GLabel 2400 1850 2    50   Output ~ 0
R_buffer_input
Wire Wire Line
	2200 1350 2400 1350
Wire Wire Line
	2200 1850 2400 1850
$Sheet
S 1950 6150 1900 1250
U 5D89ABD3
F0 "STPre6080PSU" 50
F1 "STPre6080PSU.sch" 50
$EndSheet
Text Notes 2650 6850 0    50   Italic 10
Power Supply
$EndSCHEMATC
