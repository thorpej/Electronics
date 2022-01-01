EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "KWard Bench PSU - Filament supply"
Date ""
Rev "0.1"
Comp "Copyright (c) 2021 Jason R. Thorpe. See LICENSE."
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Transformer_1P_2S T1
U 1 1 61D8685F
P 4850 4100
F 0 "T1" H 4850 4800 50  0000 C CNN
F 1 "AnTek AS-1206" H 4850 4700 50  0000 C CNN
F 2 "" H 4850 4100 50  0001 C CNN
F 3 "~" H 4850 4100 50  0001 C CNN
	1    4850 4100
	1    0    0    -1  
$EndComp
Text GLabel 4450 3900 0    50   Input ~ 0
Main_120Vac
Text GLabel 4450 4300 0    50   Input ~ 0
Main_120Vac
$Comp
L Device:CircuitBreaker_1P_US CB1
U 1 1 61D89ED7
P 5750 3700
F 0 "CB1" V 6025 3700 50  0000 C CNN
F 1 "6A" V 5934 3700 50  0000 C CNN
F 2 "" H 5750 3700 50  0001 C CNN
F 3 "~" H 5750 3700 50  0001 C CNN
F 4 "457-1658G2102P106A" V 5750 3700 50  0001 C CNN "Mouser"
	1    5750 3700
	0    -1   -1   0   
$EndComp
$Comp
L Device:CircuitBreaker_1P_US CB2
U 1 1 61D8A6A0
P 5750 4500
F 0 "CB2" V 6000 4500 50  0000 C CNN
F 1 "6A" V 5900 4500 50  0000 C CNN
F 2 "" H 5750 4500 50  0001 C CNN
F 3 "~" H 5750 4500 50  0001 C CNN
F 4 "457-1658G2102P106A" V 5750 4500 50  0001 C CNN "Mouser"
	1    5750 4500
	0    -1   1    0   
$EndComp
Wire Wire Line
	5250 3700 5450 3700
Wire Wire Line
	5250 4500 5450 4500
Wire Wire Line
	5250 4000 6050 4000
Wire Wire Line
	5250 4200 6050 4200
Text GLabel 6050 3700 2    50   Output ~ 0
6.3Vac
Text GLabel 6050 4000 2    50   Output ~ 0
6.3Vac
Text GLabel 6050 4200 2    50   Output ~ 0
6.3Vac
Text GLabel 6050 4500 2    50   Output ~ 0
6.3Vac
Text Notes 6400 3750 0    50   Italic 10
Blue
Text Notes 6400 4050 0    50   Italic 10
Blue
Text Notes 6400 4250 0    50   Italic 10
Yellow
Text Notes 6400 4550 0    50   Italic 10
Yellow
$EndSCHEMATC
