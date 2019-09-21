EESchema Schematic File Version 4
LIBS:STPre6080-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title "6AS7 Pre-amp Mk I heater circuit"
Date "2019-09-19"
Rev "1.0"
Comp "San Francisco Electronworks"
Comment1 "For hobbyist use only."
Comment2 "Copyright 2019 Jason R. Thorpe.  All rights reserved."
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Valve:ECC83 U?
U 3 1 5DC53501
P 4700 3200
AR Path="/5DC53501" Ref="U?"  Part="3" 
AR Path="/5DC527CD/5DC53501" Ref="U1"  Part="3" 
F 0 "U1" H 4928 3163 50  0000 L CNN
F 1 "ECC83" H 4928 3072 50  0000 L CNN
F 2 "Valve:Valve_Noval_P" H 4970 2800 50  0001 C CNN
F 3 "http://www.r-type.org/pdfs/ecc83.pdf" H 4700 3200 50  0001 C CNN
	3    4700 3200
	1    0    0    -1  
$EndComp
Text GLabel 6350 3650 2    50   Input ~ 0
Fil_6.3_X
Text GLabel 6350 4100 2    50   Input ~ 0
Fil_6.3_Y
Text Notes 6200 4450 0    50   ~ 0
ECC83 / 12AX7
Text Notes 6200 4600 0    50   ~ 0
6N2P
$Comp
L Switch:SW_DPDT_x2 SW?
U 1 1 5DC5350B
P 5650 3750
AR Path="/5DC5350B" Ref="SW?"  Part="1" 
AR Path="/5DC527CD/5DC5350B" Ref="SW301"  Part="1" 
F 0 "SW301" H 5650 4035 50  0000 C CNN
F 1 "SW_DPDT_x2" H 5650 3944 50  0000 C CNN
F 2 "" H 5650 3750 50  0001 C CNN
F 3 "~" H 5650 3750 50  0001 C CNN
	1    5650 3750
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DPDT_x2 SW?
U 2 1 5DC53511
P 5650 4450
AR Path="/5DC53511" Ref="SW?"  Part="2" 
AR Path="/5DC527CD/5DC53511" Ref="SW301"  Part="2" 
F 0 "SW301" H 5650 4735 50  0000 C CNN
F 1 "SW_DPDT_x2" H 5650 4644 50  0000 C CNN
F 2 "" H 5650 4450 50  0001 C CNN
F 3 "~" H 5650 4450 50  0001 C CNN
	2    5650 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3650 6100 3650
Wire Wire Line
	6100 3650 6100 2700
Wire Wire Line
	6100 2700 4250 2700
Wire Wire Line
	4250 2700 4250 3750
Wire Wire Line
	4250 3750 4600 3750
Wire Wire Line
	4600 3750 4600 3650
Connection ~ 6100 3650
Wire Wire Line
	6100 3650 5850 3650
Wire Wire Line
	6350 4100 6100 4100
Wire Wire Line
	6100 4100 6100 3850
Wire Wire Line
	6100 3850 5850 3850
Wire Wire Line
	6100 4100 6100 4250
Wire Wire Line
	6100 4350 5850 4350
Connection ~ 6100 4100
Wire Wire Line
	5450 4450 4700 4450
Wire Wire Line
	4700 4450 4700 3650
Wire Wire Line
	5450 3750 4800 3750
Wire Wire Line
	4800 3750 4800 3650
$Comp
L power:GND #PWR?
U 1 1 5DC53529
P 6100 4600
AR Path="/5DC53529" Ref="#PWR?"  Part="1" 
AR Path="/5DC527CD/5DC53529" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6100 4350 50  0001 C CNN
F 1 "GND" H 6105 4427 50  0000 C CNN
F 2 "" H 6100 4600 50  0001 C CNN
F 3 "" H 6100 4600 50  0001 C CNN
	1    6100 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4550 6100 4550
Wire Wire Line
	6100 4550 6100 4600
$Comp
L jrt-Valves:6AS7 U?
U 3 1 5DC53531
P 7300 3350
AR Path="/5DC53531" Ref="U?"  Part="3" 
AR Path="/5DC527CD/5DC53531" Ref="U3"  Part="3" 
F 0 "U3" H 7528 3313 50  0000 L CNN
F 1 "6AS7" H 7528 3222 50  0000 L CNN
F 2 "Valve:Valve_Octal" H 7570 2950 50  0001 C CNN
F 3 "" H 7300 3350 50  0001 C CNN
	3    7300 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 4250 7400 4250
Wire Wire Line
	7400 4250 7400 3800
Connection ~ 6100 4250
Wire Wire Line
	6100 4250 6100 4350
Wire Wire Line
	6100 3650 6100 3800
Wire Wire Line
	6100 3800 7200 3800
$EndSCHEMATC
