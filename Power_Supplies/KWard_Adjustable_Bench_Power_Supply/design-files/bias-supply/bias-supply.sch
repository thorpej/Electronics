EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "KWard Bench PSU - Bias supply"
Date ""
Rev "0.1"
Comp "Copyright (c) 2021 Jason R. Thorpe. See LICENSE."
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 6421837C
P 1750 3900
F 0 "J1" H 1668 3575 50  0000 C CNN
F 1 "168VAC input" H 1668 3666 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 1750 3900 50  0001 C CNN
F 3 "~" H 1750 3900 50  0001 C CNN
	1    1750 3900
	-1   0    0    1   
$EndComp
$Comp
L jrt-ICs:DB10x D1
U 1 1 64219438
P 2600 3850
F 0 "D1" H 2750 3700 50  0000 L CNN
F 1 "DB107" H 2750 3600 50  0000 L CNN
F 2 "Diode_THT:Diode_Bridge_DIP-4_W7.62mm_P5.08mm" H 2600 3250 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/345/db101s-1012s-17410.pdf" H 2600 3850 50  0001 C CNN
	1    2600 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3800 2150 3800
Wire Wire Line
	2150 3800 2150 3550
Wire Wire Line
	2150 3550 2600 3550
Wire Wire Line
	1950 3900 2150 3900
Wire Wire Line
	2150 3900 2150 4150
Wire Wire Line
	2150 4150 2600 4150
$Comp
L Device:CP1 C1
U 1 1 6421AC96
P 3250 3850
F 0 "C1" H 3365 3896 50  0000 L CNN
F 1 "220µF" H 3365 3805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D18.0mm_P7.50mm" H 3250 3850 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/293/e_ucs-1512762.pdf" H 3250 3850 50  0001 C CNN
F 4 "647-UCS2E221MHD" H 3250 3850 50  0001 C CNN "Mouser"
	1    3250 3850
	1    0    0    -1  
$EndComp
Text Notes 3350 4050 0    50   ~ 0
250V
$Comp
L Device:CP1 C2
U 1 1 6421BE2B
P 3950 3850
F 0 "C2" H 4065 3896 50  0000 L CNN
F 1 "220µF" H 4065 3805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D18.0mm_P7.50mm" H 3950 3850 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/293/e_ucs-1512762.pdf" H 3950 3850 50  0001 C CNN
F 4 "647-UCS2E221MHD" H 3950 3850 50  0001 C CNN "Mouser"
	1    3950 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 6421C45A
P 3700 4250
F 0 "R1" V 3907 4250 50  0000 C CNN
F 1 "100" V 3816 4250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 3630 4250 50  0001 C CNN
F 3 "~" H 3700 4250 50  0001 C CNN
F 4 "594-5083NW100R0JA100" V 3700 4250 50  0001 C CNN "Mouser"
	1    3700 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 3850 2300 4250
Wire Wire Line
	2300 4250 3250 4250
Wire Wire Line
	2900 3850 2900 3450
Wire Wire Line
	2900 3450 3250 3450
Wire Wire Line
	3250 3450 3250 3700
Wire Wire Line
	3250 4000 3250 4250
Text Notes 4050 4050 0    50   ~ 0
250V
Wire Wire Line
	3250 4250 3550 4250
Connection ~ 3250 4250
Wire Wire Line
	3850 4250 3950 4250
Wire Wire Line
	3950 4250 3950 4000
Wire Wire Line
	3250 3450 3950 3450
Wire Wire Line
	3950 3450 3950 3700
Connection ~ 3250 3450
$Comp
L Device:R R2
U 1 1 6421E7B0
P 4450 3900
F 0 "R2" H 4520 3946 50  0000 L CNN
F 1 "330K" H 4520 3855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 4380 3900 50  0001 C CNN
F 3 "~" H 4450 3900 50  0001 C CNN
F 4 "594-5083NW330K0J" H 4450 3900 50  0001 C CNN "Mouser"
	1    4450 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3450 4450 3450
Wire Wire Line
	4450 3450 4450 3750
Connection ~ 3950 3450
Wire Wire Line
	3950 4250 4450 4250
Wire Wire Line
	4450 4250 4450 4050
Connection ~ 3950 4250
$Comp
L Diode:1N53xxB D2
U 1 1 6421F13C
P 5250 3650
F 0 "D2" V 5204 3730 50  0000 L CNN
F 1 "1N5383B" V 5295 3730 50  0000 L CNN
F 2 "Diode_THT:D_DO-201_P15.24mm_Horizontal" H 5250 3475 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/1n5345b.pdf" H 5250 3650 50  0001 C CNN
	1    5250 3650
	0    1    1    0   
$EndComp
Text Notes 5350 3900 0    50   ~ 0
150V\n5W
$Comp
L Device:Q_PNP_BCE Q1
U 1 1 64221AEF
P 5250 4150
F 0 "Q1" V 5485 4150 50  0000 C CNN
F 1 "MJE5731" V 5576 4150 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 5450 4250 50  0001 C CNN
F 3 "~" H 5250 4150 50  0001 C CNN
	1    5250 4150
	0    -1   1    0   
$EndComp
$Comp
L Diode:1N4007 D3
U 1 1 64222A66
P 5250 4600
F 0 "D3" H 5250 4700 50  0000 C CNN
F 1 "1N4007" H 5250 4800 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5250 4425 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 5250 4600 50  0001 C CNN
	1    5250 4600
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 642238B4
P 4850 4100
F 0 "R3" H 4920 4146 50  0000 L CNN
F 1 "10K" H 4920 4055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 4780 4100 50  0001 C CNN
F 3 "~" H 4850 4100 50  0001 C CNN
F 4 "594-5083NW10K00J" H 4850 4100 50  0001 C CNN "Mouser"
	1    4850 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4600 5450 4600
Wire Wire Line
	5450 4600 5450 4250
$Comp
L Device:Q_PNP_BCE Q2
U 1 1 64225460
P 6100 4150
F 0 "Q2" V 6335 4150 50  0000 C CNN
F 1 "MJE5731" V 6426 4150 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 6300 4250 50  0001 C CNN
F 3 "~" H 6100 4150 50  0001 C CNN
	1    6100 4150
	0    -1   1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 6422570D
P 5750 4100
F 0 "R4" H 5820 4146 50  0000 L CNN
F 1 "39K" H 5820 4055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 5680 4100 50  0001 C CNN
F 3 "~" H 5750 4100 50  0001 C CNN
F 4 "594-5083NW39K00J" H 5750 4100 50  0001 C CNN "Mouser"
	1    5750 4100
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4007 D4
U 1 1 6422597E
P 6100 4600
F 0 "D4" H 6100 4700 50  0000 C CNN
F 1 "1N4007" H 6100 4800 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 6100 4425 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 6100 4600 50  0001 C CNN
	1    6100 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	5750 4250 5900 4250
Wire Wire Line
	6300 4250 6300 4600
Wire Wire Line
	6300 4600 6250 4600
Wire Wire Line
	5950 4600 5900 4600
Wire Wire Line
	5900 4600 5900 4250
Connection ~ 5900 4250
$Comp
L Device:R_POT RV1
U 1 1 642288F0
P 6100 3500
F 0 "RV1" H 6030 3546 50  0000 R CNN
F 1 "100K" H 6030 3455 50  0000 R CNN
F 2 "TerminalBlock:TerminalBlock_bornier-3_P5.08mm" H 6100 3500 50  0001 C CNN
F 3 "~" H 6100 3500 50  0001 C CNN
	1    6100 3500
	-1   0    0    -1  
$EndComp
Text Notes 5700 3150 0    50   ~ 0
10-turn precision pot\nNegative bias adjust
Connection ~ 4450 3450
Wire Wire Line
	5050 4250 5050 4600
Wire Wire Line
	5050 4600 5100 4600
Wire Wire Line
	4850 4250 5050 4250
Wire Wire Line
	4450 3450 5250 3450
Connection ~ 5050 4250
Wire Wire Line
	4850 3950 5250 3950
Wire Wire Line
	5750 3950 6100 3950
Wire Wire Line
	5250 3950 5250 3800
Connection ~ 5250 3950
Wire Wire Line
	5250 3500 5250 3450
Connection ~ 6100 3950
Wire Wire Line
	4450 4250 4850 4250
Connection ~ 4450 4250
Connection ~ 4850 4250
Wire Wire Line
	5450 4250 5750 4250
Connection ~ 5450 4250
Connection ~ 5750 4250
$Comp
L Device:Q_PNP_ECB Q3
U 1 1 6423A4D5
P 6750 4050
F 0 "Q3" V 6750 4300 50  0000 C CNN
F 1 "KSA1013" V 6650 4300 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92L" H 6950 4150 50  0001 C CNN
F 3 "~" H 6750 4050 50  0001 C CNN
	1    6750 4050
	0    -1   -1   0   
$EndComp
$Comp
L Diode:1N4007 D5
U 1 1 6423AF9C
P 6750 3800
F 0 "D5" H 6750 3600 50  0000 C CNN
F 1 "1N4007" H 6750 3700 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 6750 3625 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 6750 3800 50  0001 C CNN
	1    6750 3800
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 6423C924
P 7050 4250
F 0 "R5" V 6843 4250 50  0000 C CNN
F 1 "22" V 6934 4250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 6980 4250 50  0001 C CNN
F 3 "~" H 7050 4250 50  0001 C CNN
F 4 "594-5083NW22R00J" V 7050 4250 50  0001 C CNN "Mouser"
	1    7050 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 3800 6550 3800
Wire Wire Line
	6550 3800 6550 3950
Wire Wire Line
	6300 4250 6750 4250
Connection ~ 6300 4250
Wire Wire Line
	6100 3950 6550 3950
Connection ~ 6550 3950
Wire Wire Line
	6900 4250 6750 4250
Connection ~ 6750 4250
$Comp
L Device:C C3
U 1 1 64244283
P 7400 3900
F 0 "C3" H 7515 3946 50  0000 L CNN
F 1 "1µF" H 7515 3855 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L18.0mm_W11.0mm_P15.00mm_FKS3_FKP3" H 7438 3750 50  0001 C CNN
F 3 "https://product.tdk.com/system/files/dam/doc/product/capacitor/film/mkp_mfp/data_sheet/20/20/db/fc_2009/mkp_b32671l_672l.pdf" H 7400 3900 50  0001 C CNN
F 4 "871-B32672L2105J000" H 7400 3900 50  0001 C CNN "Mouser"
	1    7400 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 4250 7200 4250
Wire Wire Line
	7400 3450 7400 3750
Wire Wire Line
	7400 4250 7400 4050
Text Notes 7300 3350 0    50   ~ 0
250VDC\nPP film
Wire Wire Line
	6900 3800 6950 3800
Wire Wire Line
	6950 3800 6950 3950
Wire Wire Line
	6950 3950 7200 3950
Wire Wire Line
	7200 3950 7200 4250
Connection ~ 6950 3950
Connection ~ 7200 4250
$Comp
L Device:R R6
U 1 1 64252D6B
P 7800 3900
F 0 "R6" H 7870 3946 50  0000 L CNN
F 1 "1M" H 7870 3855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 7730 3900 50  0001 C CNN
F 3 "~" H 7800 3900 50  0001 C CNN
F 4 "594-5083NW1M000F" H 7800 3900 50  0001 C CNN "Mouser"
	1    7800 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3450 7800 3450
Wire Wire Line
	7800 3450 7800 3750
Wire Wire Line
	7400 4250 7800 4250
Wire Wire Line
	7800 4250 7800 4050
Connection ~ 7400 4250
$Comp
L Diode:1N4007 D6
U 1 1 64255529
P 8200 3900
F 0 "D6" V 8154 3980 50  0000 L CNN
F 1 "1N4007" V 8245 3980 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 8200 3725 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 8200 3900 50  0001 C CNN
	1    8200 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	7800 3450 8200 3450
Wire Wire Line
	8200 3450 8200 3750
Connection ~ 7800 3450
Wire Wire Line
	7800 4250 8200 4250
Wire Wire Line
	8200 4250 8200 4050
Connection ~ 7800 4250
$Comp
L power:GND #PWR0101
U 1 1 642581B1
P 8200 3450
F 0 "#PWR0101" H 8200 3200 50  0001 C CNN
F 1 "GND" H 8205 3277 50  0000 C CNN
F 2 "" H 8200 3450 50  0001 C CNN
F 3 "" H 8200 3450 50  0001 C CNN
	1    8200 3450
	-1   0    0    1   
$EndComp
Connection ~ 8200 3450
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 64258EEA
P 8600 4450
F 0 "J2" V 8750 4350 50  0000 L CNN
F 1 "To C- meter" V 8850 4200 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 8600 4450 50  0001 C CNN
F 3 "~" H 8600 4450 50  0001 C CNN
	1    8600 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	8500 4250 8200 4250
Connection ~ 8200 4250
Wire Wire Line
	8600 4250 8600 3450
Wire Wire Line
	8600 3450 8200 3450
Wire Wire Line
	8600 3450 8700 3450
Wire Wire Line
	8700 3450 8700 3900
Wire Wire Line
	8700 3900 9000 3900
Connection ~ 8600 3450
Wire Wire Line
	8500 4250 8500 4000
Wire Wire Line
	8500 4000 9000 4000
Connection ~ 8500 4250
Text Notes 9350 4050 0    50   Italic 10
White
Text Notes 9350 3950 0    50   Italic 10
Black
Text Notes 3950 3350 0    50   ~ 0
All resistors are 2W metal film\nunless specified otherwise.
Text Notes 1500 4100 0    50   Italic 10
Triad F4-120
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 61CDC77B
P 9200 3900
F 0 "J3" H 9150 3700 50  0000 L CNN
F 1 "To panel jacks" H 9000 3650 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 9200 3900 50  0001 C CNN
F 3 "~" H 9200 3900 50  0001 C CNN
	1    9200 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 61D0A6A4
P 6100 3800
F 0 "R7" H 6170 3846 50  0000 L CNN
F 1 "10" H 6170 3755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P2.54mm_Vertical" V 6030 3800 50  0001 C CNN
F 3 "~" H 6100 3800 50  0001 C CNN
F 4 "594-5083NW10R00J" H 6100 3800 50  0001 C CNN "Mouser"
	1    6100 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3500 5950 3650
Wire Wire Line
	5950 3650 6100 3650
Connection ~ 6100 3650
Wire Wire Line
	5250 3450 5800 3450
Wire Wire Line
	5800 3450 5800 3350
Wire Wire Line
	5800 3350 6100 3350
Connection ~ 5250 3450
Wire Wire Line
	6100 3350 6400 3350
Wire Wire Line
	6400 3350 6400 3450
Wire Wire Line
	6400 3450 7400 3450
Connection ~ 6100 3350
Connection ~ 7400 3450
$EndSCHEMATC
