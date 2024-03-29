EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "KWard Bench PSU - Screen supply and regulator circuit"
Date ""
Rev "0.1"
Comp "Copyright (c) 2021 Jason R. Thorpe. See LICENSE."
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L jrt-ICs:DB10x D1
U 1 1 61D0F387
P 2300 2550
F 0 "D1" H 2450 2800 50  0000 L CNN
F 1 "DB107" H 2450 2700 50  0000 L CNN
F 2 "Diode_THT:Diode_Bridge_DIP-4_W7.62mm_P5.08mm" H 2300 1950 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/345/db101s-1012s-17410.pdf" H 2300 2550 50  0001 C CNN
	1    2300 2550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 61D1023F
P 1250 2500
F 0 "J1" H 1168 2717 50  0000 C CNN
F 1 "B+_120Vac" H 1168 2626 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 1250 2500 50  0001 C CNN
F 3 "~" H 1250 2500 50  0001 C CNN
	1    1250 2500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1450 2500 1800 2500
Wire Wire Line
	1800 2500 1800 2250
Wire Wire Line
	1800 2250 2300 2250
Wire Wire Line
	1450 2600 1800 2600
Wire Wire Line
	1800 2600 1800 2850
Wire Wire Line
	1800 2850 2300 2850
Text Notes 1500 2800 2    50   Italic 10
Triad F6-120
$Comp
L Device:CP1 C1
U 1 1 61D138D9
P 2800 2700
F 0 "C1" H 2915 2746 50  0000 L CNN
F 1 "220µF" H 2915 2655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D18.0mm_P7.50mm" H 2800 2700 50  0001 C CNN
F 3 "~" H 2800 2700 50  0001 C CNN
F 4 "647-UCS2E221MHD" H 2800 2700 50  0001 C CNN "Mouser"
	1    2800 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 61D1464B
P 3150 2550
F 0 "R1" V 2943 2550 50  0000 C CNN
F 1 "330" V 3034 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 3080 2550 50  0001 C CNN
F 3 "~" H 3150 2550 50  0001 C CNN
F 4 "594-5083NW330R0J" V 3150 2550 50  0001 C CNN "Mouser"
	1    3150 2550
	0    1    1    0   
$EndComp
$Comp
L Device:CP1 C2
U 1 1 61D15255
P 3500 2700
F 0 "C2" H 3615 2746 50  0000 L CNN
F 1 "220µF" H 3615 2655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D18.0mm_P7.50mm" H 3500 2700 50  0001 C CNN
F 3 "~" H 3500 2700 50  0001 C CNN
F 4 "647-UCS2E221MHD" H 3500 2700 50  0001 C CNN "Mouser"
	1    3500 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 61D15646
P 3950 2700
F 0 "R2" H 4020 2746 50  0000 L CNN
F 1 "47K" H 4020 2655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 3880 2700 50  0001 C CNN
F 3 "~" H 3950 2700 50  0001 C CNN
F 4 "594-5083NW47K00JA100" H 3950 2700 50  0001 C CNN "Mouser"
	1    3950 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 61D15A1E
P 4250 2400
F 0 "R3" H 4320 2446 50  0000 L CNN
F 1 "2K2" H 4320 2355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 4180 2400 50  0001 C CNN
F 3 "~" H 4250 2400 50  0001 C CNN
F 4 "594-5083NW2K200J" H 4250 2400 50  0001 C CNN "Mouser"
	1    4250 2400
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N53xxB D2
U 1 1 61D16119
P 4250 2700
F 0 "D2" V 4204 2780 50  0000 L CNN
F 1 "1N5380" V 4295 2780 50  0000 L CNN
F 2 "Diode_THT:D_DO-201_P15.24mm_Horizontal" H 4250 2525 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/1n5345b.pdf" H 4250 2700 50  0001 C CNN
	1    4250 2700
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NMOS_GDS Q1
U 1 1 61D1719C
P 5200 2550
F 0 "Q1" H 5405 2596 50  0000 L CNN
F 1 "STP18N55M5" H 5405 2505 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 5400 2650 50  0001 C CNN
F 3 "~" H 5200 2550 50  0001 C CNN
	1    5200 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 61D18D89
P 4600 2550
F 0 "R4" V 4393 2550 50  0000 C CNN
F 1 "1K" V 4484 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 4530 2550 50  0001 C CNN
F 3 "~" H 4600 2550 50  0001 C CNN
F 4 "594-5083NW1K000J" V 4600 2550 50  0001 C CNN "Mouser"
	1    4600 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	2600 2550 2800 2550
Wire Wire Line
	2800 2550 3000 2550
Connection ~ 2800 2550
Wire Wire Line
	3300 2550 3500 2550
Wire Wire Line
	3500 2550 3950 2550
Connection ~ 3500 2550
Wire Wire Line
	3950 2550 3950 2250
Wire Wire Line
	3950 2250 4250 2250
Connection ~ 3950 2550
Wire Wire Line
	2000 2550 2000 2950
Wire Wire Line
	2000 2950 2250 2950
Wire Wire Line
	2800 2950 2800 2850
Wire Wire Line
	2800 2950 3500 2950
Wire Wire Line
	3500 2950 3500 2850
Connection ~ 2800 2950
Wire Wire Line
	3500 2950 3950 2950
Wire Wire Line
	3950 2950 3950 2850
Connection ~ 3500 2950
Wire Wire Line
	3950 2950 4250 2950
Wire Wire Line
	4250 2950 4250 2850
Connection ~ 3950 2950
$Comp
L Device:C C3
U 1 1 61D1B0C7
P 4850 2750
F 0 "C3" H 4965 2796 50  0000 L CNN
F 1 "0.47µF" H 4965 2705 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L18.0mm_W8.0mm_P15.00mm_FKS3_FKP3" H 4888 2600 50  0001 C CNN
F 3 "~" H 4850 2750 50  0001 C CNN
F 4 "80-PHE426HB6470JR06" H 4850 2750 50  0001 C CNN "Mouser"
	1    4850 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2950 4850 2950
Connection ~ 4250 2950
Wire Wire Line
	4250 2250 5300 2250
Wire Wire Line
	5300 2250 5300 2350
Connection ~ 4250 2250
$Comp
L Device:C C4
U 1 1 61D1D14B
P 5300 2950
F 0 "C4" H 5415 2996 50  0000 L CNN
F 1 "1µF" H 5415 2905 50  0000 L CNN
F 2 "jrt-Capacitors:C_Rect_L18.0mm_W18.0mm_P15.0mm" H 5338 2800 50  0001 C CNN
F 3 "~" H 5300 2950 50  0001 C CNN
F 4 "667-ECW-FD2J105PC" H 5300 2950 50  0001 C CNN "Mouser"
	1    5300 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2750 5300 2800
Wire Wire Line
	4850 2950 4850 3100
Wire Wire Line
	4850 3100 5300 3100
Text Notes 5550 2450 0    50   ~ 0
Any other high-voltage GDS power MOSFET with a Vgs\nthreshold of 3V-4V (typical) would be a suitable sutstitute\nfor Q1.  Nominal screen voltage: 116Vdc.  Screen voltage\nis floated on top of 6550 cathode voltage.
Wire Wire Line
	4250 2550 4450 2550
Connection ~ 4250 2550
Wire Wire Line
	4750 2550 4850 2550
Wire Wire Line
	4850 2550 4850 2600
Connection ~ 4850 2550
Wire Wire Line
	4850 2550 5000 2550
Wire Wire Line
	4850 2900 4850 2950
Connection ~ 4850 2950
$Comp
L Regulator_Linear:LM317_TO-220 U1
U 1 1 61D276B3
P 3150 4100
F 0 "U1" H 3150 4342 50  0000 C CNN
F 1 "LM317" H 3150 4251 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 3150 4350 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 3150 4100 50  0001 C CNN
F 4 "926-LM317AT/NOPB" H 3150 4100 50  0001 C CNN "Mouser"
	1    3150 4100
	1    0    0    -1  
$EndComp
Text Notes 1550 3800 2    50   Italic 10
6550 Cathode
Text Notes 1550 4000 2    50   Italic 10
6550 Grid
Text Notes 1550 3900 2    50   Italic 10
6550 Screen
Wire Wire Line
	2250 3750 2250 2950
Connection ~ 2250 2950
Wire Wire Line
	2250 2950 2800 2950
Wire Wire Line
	5300 2800 5600 2800
Wire Wire Line
	5600 2800 5600 3400
Wire Wire Line
	5600 3400 2300 3400
Wire Wire Line
	2300 3400 2300 3850
Connection ~ 5300 2800
$Comp
L Device:R R5
U 1 1 61D53FF1
P 2700 4100
F 0 "R5" V 2493 4100 50  0000 C CNN
F 1 "2" V 2584 4100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 2630 4100 50  0001 C CNN
F 3 "~" H 2700 4100 50  0001 C CNN
F 4 "594-5083NW2R000J" V 2700 4100 50  0001 C CNN "Mouser"
	1    2700 4100
	0    1    1    0   
$EndComp
$Comp
L Device:C C5
U 1 1 61D549ED
P 2500 4250
F 0 "C5" H 2615 4296 50  0000 L CNN
F 1 "1µF" H 2615 4205 50  0000 L CNN
F 2 "jrt-Capacitors:C_Rect_L18.0mm_W18.0mm_P15.0mm" H 2538 4100 50  0001 C CNN
F 3 "~" H 2500 4250 50  0001 C CNN
F 4 "667-ECW-FD2J105PC" H 2500 4250 50  0001 C CNN "Mouser"
	1    2500 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4100 2550 4100
Text Notes 2600 4500 0    50   ~ 0
630V\nPP film
$Comp
L Device:D_Zener D3
U 1 1 61D58655
P 3150 3750
F 0 "D3" H 3150 3967 50  0000 C CNN
F 1 "Vishay SA22A-E3/54" H 3150 3876 50  0000 C CNN
F 2 "Diode_THT:D_DO-15_P15.24mm_Horizontal" H 3150 3750 50  0001 C CNN
F 3 "~" H 3150 3750 50  0001 C CNN
F 4 "625-SA22A-E3/54" H 3150 3750 50  0001 C CNN "Mouser"
	1    3150 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3750 2850 3750
Wire Wire Line
	2850 3750 2850 4100
Connection ~ 2850 4100
Wire Wire Line
	3300 3750 3450 3750
Wire Wire Line
	3450 3750 3450 4100
Wire Wire Line
	2250 3750 2500 3750
Wire Wire Line
	2500 3750 2500 4100
Connection ~ 2500 4100
$Comp
L power:GND #PWR0101
U 1 1 61D6B292
P 2500 4400
F 0 "#PWR0101" H 2500 4150 50  0001 C CNN
F 1 "GND" H 2505 4227 50  0000 C CNN
F 2 "" H 2500 4400 50  0001 C CNN
F 3 "" H 2500 4400 50  0001 C CNN
	1    2500 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 61D6B61F
P 3650 4500
F 0 "R9" V 3443 4500 50  0000 C CNN
F 1 "200" V 3534 4500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 3580 4500 50  0001 C CNN
F 3 "~" H 3650 4500 50  0001 C CNN
F 4 "594-5083NW200R0J" V 3650 4500 50  0001 C CNN "Mouser"
	1    3650 4500
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 61D6BE1B
P 3650 4650
F 0 "R10" V 3750 4650 50  0000 C CNN
F 1 "2K4" V 3850 4650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 3580 4650 50  0001 C CNN
F 3 "~" H 3650 4650 50  0001 C CNN
F 4 "594-5083NW2K400J" V 3650 4650 50  0001 C CNN "Mouser"
	1    3650 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 4500 3800 4650
Wire Wire Line
	3500 4500 3500 4650
Wire Wire Line
	3150 4400 3150 4500
Wire Wire Line
	3150 4500 3500 4500
Connection ~ 3500 4500
Wire Wire Line
	3450 4100 3800 4100
Wire Wire Line
	3800 4100 3800 4500
Connection ~ 3450 4100
Connection ~ 3800 4500
Text Notes 3850 4650 0    50   ~ 0
185R\nnominal
$Comp
L Device:R R7
U 1 1 61D705CA
P 3500 5050
F 0 "R7" H 3570 5096 50  0000 L CNN
F 1 "56K" H 3570 5005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_Power_L25.0mm_W9.0mm_P30.48mm" V 3430 5050 50  0001 C CNN
F 3 "~" H 3500 5050 50  0001 C CNN
F 4 "71-RS00556K00FE12" H 3500 5050 50  0001 C CNN "Mouser"
	1    3500 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 61D707E4
P 3500 5350
F 0 "R8" H 3570 5396 50  0000 L CNN
F 1 "36K" H 3570 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_Power_L25.0mm_W9.0mm_P30.48mm" V 3430 5350 50  0001 C CNN
F 3 "~" H 3500 5350 50  0001 C CNN
F 4 "71-RS00236K00FB12" H 3500 5350 50  0001 C CNN "Mouser"
	1    3500 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 61D7094B
P 3150 5350
F 0 "R6" H 3220 5396 50  0000 L CNN
F 1 "1K3" H 3220 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 3080 5350 50  0001 C CNN
F 3 "~" H 3150 5350 50  0001 C CNN
F 4 "594-5083NW1K300J" H 3150 5350 50  0001 C CNN "Mouser"
	1    3150 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 61D711D5
P 3150 5050
F 0 "RV1" H 3080 5096 50  0000 R CNN
F 1 "300K" H 3080 5005 50  0000 R CNN
F 2 "jrt-TerminalBlocks:TE_AMP-3_P10.16mm" H 3150 5050 50  0001 C CNN
F 3 "~" H 3150 5050 50  0001 C CNN
	1    3150 5050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3150 4900 3500 4900
Wire Wire Line
	3150 5500 3500 5500
Wire Wire Line
	3150 4500 3150 4900
Connection ~ 3150 4500
Connection ~ 3150 4900
Wire Wire Line
	3000 5050 3000 5200
Wire Wire Line
	3000 5200 3150 5200
Connection ~ 3150 5200
Text Notes 2450 5150 0    50   ~ 0
10-turn 5W\nprecision pot
$Comp
L power:GND #PWR0102
U 1 1 61D7765F
P 3150 5500
F 0 "#PWR0102" H 3150 5250 50  0001 C CNN
F 1 "GND" H 3155 5327 50  0000 C CNN
F 2 "" H 3150 5500 50  0001 C CNN
F 3 "" H 3150 5500 50  0001 C CNN
	1    3150 5500
	1    0    0    -1  
$EndComp
Connection ~ 3150 5500
$Comp
L Device:R R11
U 1 1 61D77B07
P 3900 4900
F 0 "R11" V 3693 4900 50  0000 C CNN
F 1 "100" V 3784 4900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 3830 4900 50  0001 C CNN
F 3 "~" H 3900 4900 50  0001 C CNN
F 4 "594-5083NW100R0JA100" V 3900 4900 50  0001 C CNN "Mouser"
	1    3900 4900
	0    1    1    0   
$EndComp
$Comp
L Device:C C6
U 1 1 61D794E6
P 4100 5050
F 0 "C6" H 4215 5096 50  0000 L CNN
F 1 "1µF" H 4215 5005 50  0000 L CNN
F 2 "jrt-Capacitors:C_Rect_L18.0mm_W18.0mm_P15.0mm" H 4138 4900 50  0001 C CNN
F 3 "~" H 4100 5050 50  0001 C CNN
F 4 "667-ECW-FD2J105PC" H 4100 5050 50  0001 C CNN "Mouser"
	1    4100 5050
	1    0    0    -1  
$EndComp
Text Notes 4200 5350 0    50   ~ 0
630V\nPP film
Wire Wire Line
	4100 5200 4100 5500
Wire Wire Line
	4100 5500 3500 5500
Connection ~ 3500 5500
$Comp
L Diode:1N4007 D4
U 1 1 61D7B185
P 4350 4900
F 0 "D4" H 4350 4683 50  0000 C CNN
F 1 "1N4007" H 4350 4774 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 4350 4725 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4350 4900 50  0001 C CNN
	1    4350 4900
	-1   0    0    1   
$EndComp
$Comp
L Device:C C7
U 1 1 61D7CB80
P 4650 5050
F 0 "C7" H 4765 5096 50  0000 L CNN
F 1 "1µF" H 4765 5005 50  0000 L CNN
F 2 "jrt-Capacitors:C_Rect_L18.0mm_W18.0mm_P15.0mm" H 4688 4900 50  0001 C CNN
F 3 "~" H 4650 5050 50  0001 C CNN
F 4 "667-ECW-FD2J105PC" H 4650 5050 50  0001 C CNN "Mouser"
	1    4650 5050
	1    0    0    -1  
$EndComp
Text Notes 4950 5150 0    50   ~ 0
630V\nPP film
$Comp
L Device:R R12
U 1 1 61D80521
P 4650 5350
F 0 "R12" H 4720 5396 50  0000 L CNN
F 1 "51" H 4720 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0614_L14.3mm_D5.7mm_P20.32mm_Horizontal" V 4580 5350 50  0001 C CNN
F 3 "~" H 4650 5350 50  0001 C CNN
F 4 "71-NS02B51R00FE12" H 4650 5350 50  0001 C CNN "Mouser"
	1    4650 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5500 4650 5500
Connection ~ 4100 5500
Text Notes 4900 5400 0    50   ~ 0
3W wire-wound
Text Notes 3500 5650 0    50   ~ 0
1% 5W wire-wound
Wire Wire Line
	4100 4900 4200 4900
Wire Wire Line
	4500 4900 4650 4900
Wire Wire Line
	3800 4100 4650 4100
Wire Wire Line
	4650 4100 4650 4900
Connection ~ 3800 4100
Connection ~ 4650 4900
Wire Wire Line
	4650 4100 5500 4100
Wire Wire Line
	5500 4100 5500 5750
Connection ~ 4650 4100
Text Notes 3500 4000 0    50   ~ 0
LM317 should be TI or ST.
Connection ~ 5500 4100
$Comp
L Device:R R13
U 1 1 61D8DD35
P 5650 4100
F 0 "R13" V 5443 4100 50  0000 C CNN
F 1 "3R5" V 5534 4100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_Power_L48.0mm_W12.5mm_P55.88mm" V 5580 4100 50  0001 C CNN
F 3 "~" H 5650 4100 50  0001 C CNN
F 4 "71-RS0103R500FE12" V 5650 4100 50  0001 C CNN "Mouser"
	1    5650 4100
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4007 D5
U 1 1 61E09F26
P 7950 4550
F 0 "D5" V 7904 4630 50  0000 L CNN
F 1 "1N4007" V 7995 4630 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 7950 4375 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 7950 4550 50  0001 C CNN
	1    7950 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	7950 4500 7950 4550
$Comp
L power:GND #PWR0103
U 1 1 61E16B57
P 7800 4900
F 0 "#PWR0103" H 7800 4650 50  0001 C CNN
F 1 "GND" H 7805 4727 50  0000 C CNN
F 2 "" H 7800 4900 50  0001 C CNN
F 3 "" H 7800 4900 50  0001 C CNN
	1    7800 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4900 3750 4900
Connection ~ 3500 4900
Wire Wire Line
	4050 4900 4100 4900
Connection ~ 4100 4900
Text Notes 4050 2100 2    50   ~ 0
All resistors are 2W metal film unless specified otherwise.
Text Notes 5850 3850 2    50   ~ 0
10W wire-wound
$Comp
L Device:R R14
U 1 1 61E2ED90
P 8400 4350
F 0 "R14" H 8470 4396 50  0000 L CNN
F 1 "56K" H 8470 4305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_Power_L25.0mm_W6.4mm_P30.48mm" V 8330 4350 50  0001 C CNN
F 3 "~" H 8400 4350 50  0001 C CNN
F 4 "71-CW00556K00JE12" H 8400 4350 50  0001 C CNN "Mouser"
	1    8400 4350
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 61E2FC37
P 8400 4700
F 0 "SW2" V 8446 4652 50  0000 R CNN
F 1 "DUT discharge" V 8355 4652 50  0000 R CNN
F 2 "jrt-TerminalBlocks:TE_AMP-2_P10.16mm" H 8400 4900 50  0001 C CNN
F 3 "~" H 8400 4900 50  0001 C CNN
	1    8400 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7950 4400 7950 4200
Wire Wire Line
	7950 4700 7950 4900
Wire Wire Line
	7950 4900 8400 4900
Wire Wire Line
	7950 4900 7800 4900
Connection ~ 7950 4900
Wire Wire Line
	7950 4200 8400 4200
Connection ~ 8400 4200
Connection ~ 8400 4900
Text Notes 8100 4150 0    50   ~ 0
5W wire-wound
$Comp
L Switch:SW_SPDT SW1
U 1 1 61D93412
P 6200 4100
F 0 "SW1" H 6200 4385 50  0000 C CNN
F 1 "I-meter bypass" H 6200 4294 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-3_P5.08mm" H 6200 4100 50  0001 C CNN
F 3 "~" H 6200 4100 50  0001 C CNN
	1    6200 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4100 6000 4100
Text Notes 5900 4350 0    50   ~ 0
Panel mount SPDT
Text Notes 8050 5050 0    50   ~ 0
Panel mount push-button
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 61E5FD2A
P 9300 4500
F 0 "J4" H 9250 4250 50  0000 L CNN
F 1 "To Panel Jacks" H 9250 4150 50  0000 L CNN
F 2 "jrt-TerminalBlocks:TE_AMP-2_P10.16mm" H 9300 4500 50  0001 C CNN
F 3 "~" H 9300 4500 50  0001 C CNN
	1    9300 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4200 9100 4200
Wire Wire Line
	8400 4900 9100 4900
Wire Wire Line
	9100 4200 9100 4500
Wire Wire Line
	9100 4900 9100 4600
Text Notes 9400 4500 0    50   Italic 10
Red
Text Notes 9400 4650 0    50   Italic 10
Black
$Comp
L Connector:Screw_Terminal_01x04 J3
U 1 1 61E75561
P 7150 3800
F 0 "J3" V 7114 3512 50  0000 R CNN
F 1 "Meters" V 7023 3512 50  0000 R CNN
F 2 "jrt-TerminalBlocks:TE_AMP-4_P10.16mm" H 7150 3800 50  0001 C CNN
F 3 "~" H 7150 3800 50  0001 C CNN
	1    7150 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6400 4000 7050 4000
Wire Wire Line
	7150 4000 7250 4000
Wire Wire Line
	7150 4200 7150 4000
Wire Wire Line
	6400 4200 7150 4200
Connection ~ 7150 4000
Wire Wire Line
	7250 4000 7250 4200
Wire Wire Line
	7250 4200 7950 4200
Connection ~ 7250 4000
Connection ~ 7950 4200
Wire Wire Line
	7350 4000 7350 4900
Wire Wire Line
	7350 4900 7800 4900
Connection ~ 7800 4900
Text Notes 7050 3700 1    50   Italic 10
I-out
Text Notes 7150 3700 1    50   Italic 10
I-ret
Text Notes 7300 3700 1    50   Italic 10
V+
Text Notes 7400 3700 1    50   Italic 10
V-
Text Notes 5700 3050 0    50   ~ 0
630V\nPP film
Text Notes 2900 2900 0    50   ~ 0
250V
Text Notes 3600 2900 0    50   ~ 0
250V
Text Notes 4900 3000 0    50   ~ 0
250V\nPP film
$Comp
L Connector:Screw_Terminal_01x04 J2
U 1 1 61E9938B
P 1650 3850
F 0 "J2" H 1568 4167 50  0000 C CNN
F 1 "Pass Tube Array" H 1568 4076 50  0000 C CNN
F 2 "jrt-TerminalBlocks:TE_AMP-4_P10.16mm" H 1650 3850 50  0001 C CNN
F 3 "~" H 1650 3850 50  0001 C CNN
	1    1650 3850
	-1   0    0    -1  
$EndComp
Connection ~ 2250 3750
Wire Wire Line
	1850 3750 2250 3750
Wire Wire Line
	1850 3850 2300 3850
Wire Wire Line
	5500 5750 2150 5750
Wire Wire Line
	2150 5750 2150 3950
Wire Wire Line
	2150 3950 1850 3950
Wire Wire Line
	1850 4050 2300 4050
Wire Wire Line
	2300 4050 2300 4400
Wire Wire Line
	2300 4400 2500 4400
Connection ~ 2500 4400
Text Notes 1550 4100 2    50   Italic 10
GND
$EndSCHEMATC
