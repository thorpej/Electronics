EESchema Schematic File Version 4
LIBS:RAdLib-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title "RAdLib - AdLib clone for Raspberry Pi"
Date "2019-10-10"
Rev "0.1"
Comp "Copyright 2019 Jason R. Thorpe.  All rights reserved."
Comment1 "See LICENSE.txt."
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74HC04 U101
U 1 1 5DA88EED
P 6300 3150
F 0 "U101" H 6300 3467 50  0000 C CNN
F 1 "74AHCT04" H 6300 3376 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6300 3150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6300 3150 50  0001 C CNN
	1    6300 3150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U101
U 2 1 5DA8A335
P 6300 4150
F 0 "U101" H 6300 4350 50  0000 C CNN
F 1 "74AHCT04" H 6300 4450 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6300 4150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6300 4150 50  0001 C CNN
	2    6300 4150
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC04 U101
U 3 1 5DA8A59B
P 6300 5150
F 0 "U101" H 6300 5467 50  0000 C CNN
F 1 "74AHCT04" H 6300 5376 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6300 5150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6300 5150 50  0001 C CNN
	3    6300 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y101
U 1 1 5DA8F816
P 5700 3600
F 0 "Y101" V 5654 3731 50  0000 L CNN
F 1 "3.58MHz Crystal" V 5745 3731 50  0000 L CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 5700 3600 50  0001 C CNN
F 3 "~" H 5700 3600 50  0001 C CNN
F 4 "IQD LFXTAL032257Bulk" V 5700 3600 50  0001 C CNN "Part"
	1    5700 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R R101
U 1 1 5DA91F1C
P 5150 3150
F 0 "R101" V 4943 3150 50  0000 C CNN
F 1 "470R" V 5034 3150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5080 3150 50  0001 C CNN
F 3 "~" H 5150 3150 50  0001 C CNN
F 4 "Xicon 270-470-RC" V 5150 3150 50  0001 C CNN "Part"
	1    5150 3150
	0    1    1    0   
$EndComp
$Comp
L Device:R R102
U 1 1 5DA933FC
P 5150 4150
F 0 "R102" V 4943 4150 50  0000 C CNN
F 1 "470R" V 5034 4150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5080 4150 50  0001 C CNN
F 3 "~" H 5150 4150 50  0001 C CNN
F 4 "Xicon 270-470-RC" V 5150 4150 50  0001 C CNN "Part"
	1    5150 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 4150 5700 4150
Wire Wire Line
	5300 3150 5700 3150
Wire Wire Line
	5700 3450 5700 3150
Connection ~ 5700 3150
Wire Wire Line
	5700 3150 6000 3150
Wire Wire Line
	5700 3750 5700 4150
Connection ~ 5700 4150
Wire Wire Line
	5700 4150 6000 4150
$Comp
L Device:C C101
U 1 1 5DA94A17
P 5000 3600
F 0 "C101" H 5115 3646 50  0000 L CNN
F 1 "4700pF" H 5115 3555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5038 3450 50  0001 C CNN
F 3 "~" H 5000 3600 50  0001 C CNN
F 4 "Murata RHS7J2D472J1DGH01A" H 5000 3600 50  0001 C CNN "Part"
	1    5000 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3450 5000 3350
Wire Wire Line
	5000 3750 5000 3850
Wire Wire Line
	5000 3350 6600 3350
Wire Wire Line
	6600 3350 6600 3150
Connection ~ 5000 3350
Wire Wire Line
	5000 3350 5000 3150
Wire Wire Line
	5000 3850 6600 3850
Wire Wire Line
	6600 3850 6600 4150
Connection ~ 5000 3850
Wire Wire Line
	5000 3850 5000 4150
Wire Wire Line
	5700 4150 5700 5150
Wire Wire Line
	5700 5150 6000 5150
Text GLabel 6750 5150 2    50   Output ~ 0
OPL_CLK
Wire Wire Line
	6600 5150 6750 5150
$Comp
L 74xx:74HC04 U?
U 7 1 5DD14709
P 7900 3600
AR Path="/5D9AAACD/5DD14709" Ref="U?"  Part="7" 
AR Path="/5DD14709" Ref="U?"  Part="7" 
AR Path="/5D9A779A/5DD14709" Ref="U101"  Part="7" 
F 0 "U101" H 8130 3646 50  0000 L CNN
F 1 "74AHCT04" H 8130 3555 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7900 3600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 7900 3600 50  0001 C CNN
	7    7900 3600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DD1470F
P 7900 3100
AR Path="/5D9AAACD/5DD1470F" Ref="#PWR?"  Part="1" 
AR Path="/5DD1470F" Ref="#PWR?"  Part="1" 
AR Path="/5D9A779A/5DD1470F" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 7900 2950 50  0001 C CNN
F 1 "VCC" H 7917 3273 50  0000 C CNN
F 2 "" H 7900 3100 50  0001 C CNN
F 3 "" H 7900 3100 50  0001 C CNN
	1    7900 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD14715
P 7900 4100
AR Path="/5D9AAACD/5DD14715" Ref="#PWR?"  Part="1" 
AR Path="/5DD14715" Ref="#PWR?"  Part="1" 
AR Path="/5D9A779A/5DD14715" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 7900 3850 50  0001 C CNN
F 1 "GND" H 7905 3927 50  0000 C CNN
F 2 "" H 7900 4100 50  0001 C CNN
F 3 "" H 7900 4100 50  0001 C CNN
	1    7900 4100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
