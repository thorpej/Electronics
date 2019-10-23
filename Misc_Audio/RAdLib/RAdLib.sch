EESchema Schematic File Version 4
LIBS:RAdLib-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 2
Title "RAdLib - AdLib clone for Raspberry Pi"
Date "2019-10-10"
Rev "0.1"
Comp "Copyright 2019 Jason R. Thorpe.  All rights reserved."
Comment1 "See LICENSE.txt."
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 2850 900  2050 500 
U 5D9AAACD
F0 "Bus_Interface" 50
F1 "Bus_Interface.sch" 50
$EndSheet
Text GLabel 1000 3300 0    50   Input ~ 0
OPL_A0
Text GLabel 1000 3450 0    50   Input ~ 0
~OPL_CS
$Comp
L power:VCC #PWR0101
U 1 1 5DA4AF8E
P 1750 2250
F 0 "#PWR0101" H 1750 2100 50  0001 C CNN
F 1 "VCC" H 1767 2423 50  0000 C CNN
F 2 "" H 1750 2250 50  0001 C CNN
F 3 "" H 1750 2250 50  0001 C CNN
	1    1750 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5DA4B3D1
P 1750 4350
F 0 "#PWR0102" H 1750 4100 50  0001 C CNN
F 1 "GND" H 1755 4177 50  0000 C CNN
F 2 "" H 1750 4350 50  0001 C CNN
F 3 "" H 1750 4350 50  0001 C CNN
	1    1750 4350
	1    0    0    -1  
$EndComp
Text GLabel 1000 3950 0    50   Input ~ 0
OPL_CLK
Text GLabel 1000 4150 0    50   Input ~ 0
~OPL_RST
Wire Wire Line
	1000 2450 1150 2450
Wire Wire Line
	1000 2550 1150 2550
Wire Wire Line
	1000 2650 1150 2650
Wire Wire Line
	1000 2750 1150 2750
Wire Wire Line
	1000 2850 1150 2850
Wire Wire Line
	1000 2950 1150 2950
Wire Wire Line
	1000 3050 1150 3050
Wire Wire Line
	1000 3150 1150 3150
Wire Wire Line
	1000 3450 1150 3450
Wire Wire Line
	1000 3950 1150 3950
Wire Wire Line
	1000 4150 1150 4150
$Comp
L jrt-ICs:YM3812 U1
U 1 1 5DA48FDF
P 1750 3300
F 0 "U1" H 1750 3400 50  0000 C CNN
F 1 "YM3812" H 1750 3300 50  0000 C CNN
F 2 "Package_DIP:DIP-24_W15.24mm_Socket" H 1950 4350 50  0001 C CNN
F 3 "" H 1950 4350 50  0001 C CNN
	1    1750 3300
	1    0    0    -1  
$EndComp
Text GLabel 1000 3150 0    50   BiDi ~ 0
OPL_D7
Text GLabel 1000 3050 0    50   BiDi ~ 0
OPL_D6
Text GLabel 1000 2950 0    50   BiDi ~ 0
OPL_D5
Text GLabel 1000 2850 0    50   BiDi ~ 0
OPL_D4
Text GLabel 1000 2750 0    50   BiDi ~ 0
OPL_D3
Text GLabel 1000 2650 0    50   BiDi ~ 0
OPL_D2
Text GLabel 1000 2550 0    50   BiDi ~ 0
OPL_D1
Text GLabel 1000 2450 0    50   BiDi ~ 0
OPL_D0
Text Label 2450 2450 0    50   ~ 0
DAC_CLK
Text Label 2450 2550 0    50   ~ 0
DAC_SYNC
Text Label 2450 2650 0    50   ~ 0
DAC_DATA
$Comp
L jrt-ICs:YM3014B U2
U 1 1 5DA4FEB2
P 3500 2650
F 0 "U2" H 3500 2700 50  0000 C CNN
F 1 "YM3014B" H 3500 2600 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 3500 2650 50  0001 C CNN
F 3 "" H 3500 2650 50  0001 C CNN
	1    3500 2650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0103
U 1 1 5DA50F9D
P 3500 2250
F 0 "#PWR0103" H 3500 2100 50  0001 C CNN
F 1 "VCC" H 3517 2423 50  0000 C CNN
F 2 "" H 3500 2250 50  0001 C CNN
F 3 "" H 3500 2250 50  0001 C CNN
	1    3500 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5DA517E1
P 3500 3050
F 0 "#PWR0104" H 3500 2800 50  0001 C CNN
F 1 "GND" H 3505 2877 50  0000 C CNN
F 2 "" H 3500 3050 50  0001 C CNN
F 3 "" H 3500 3050 50  0001 C CNN
	1    3500 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2450 2900 2450
Wire Wire Line
	2350 2550 2900 2550
Wire Wire Line
	2350 2650 2900 2650
Text GLabel 1000 3650 0    50   Input ~ 0
~OPL_RD
Text GLabel 1000 3800 0    50   Input ~ 0
~OPL_WR
Wire Wire Line
	1000 3650 1150 3650
Wire Wire Line
	1150 3350 1050 3350
Wire Wire Line
	1050 3350 1050 3300
Wire Wire Line
	1050 3300 1000 3300
Wire Wire Line
	1150 3750 1050 3750
Wire Wire Line
	1050 3750 1050 3800
Wire Wire Line
	1050 3800 1000 3800
Text GLabel 2500 3300 2    50   Output ~ 0
~OPL_IRQ
$Comp
L jrt-ICs:RC4136 U3
U 2 1 5DA9C8E1
P 4800 2550
F 0 "U3" H 4800 2917 50  0000 C CNN
F 1 "RC4136" H 4800 2826 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4800 2550 50  0001 C CNN
F 3 "" H 4800 2550 50  0001 C CNN
	2    4800 2550
	1    0    0    -1  
$EndComp
$Comp
L jrt-ICs:RC4136 U3
U 1 1 5DA9E706
P 4800 3450
F 0 "U3" H 4800 3817 50  0000 C CNN
F 1 "RC4136" H 4800 3726 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4800 3450 50  0001 C CNN
F 3 "" H 4800 3450 50  0001 C CNN
	1    4800 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C51
U 1 1 5DA9F79A
P 4100 3050
F 0 "C51" H 4191 3096 50  0000 L CNN
F 1 "10uF" H 4191 3005 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4100 3050 50  0001 C CNN
F 3 "~" H 4100 3050 50  0001 C CNN
F 4 "AVX TAP106K016SCS" H 4100 3050 50  0001 C CNN "Part"
	1    4100 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5DAA0F6D
P 4100 3150
F 0 "#PWR0105" H 4100 2900 50  0001 C CNN
F 1 "GND" H 4105 2977 50  0000 C CNN
F 2 "" H 4100 3150 50  0001 C CNN
F 3 "" H 4100 3150 50  0001 C CNN
	1    4100 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2850 4100 2950
Wire Wire Line
	5100 2550 5100 2800
Wire Wire Line
	5100 2800 4500 2800
Wire Wire Line
	4500 2800 4500 2650
Wire Wire Line
	4100 2450 4500 2450
Wire Wire Line
	5100 3450 5100 3700
Wire Wire Line
	5100 3700 4500 3700
Wire Wire Line
	4500 3700 4500 3550
Wire Wire Line
	4100 2850 4400 2850
Wire Wire Line
	4400 2850 4400 3350
Wire Wire Line
	4400 3350 4500 3350
Connection ~ 4100 2850
$Comp
L jrt-ICs:RC4136 U3
U 5 1 5DAA3B6E
P 5500 1350
F 0 "U3" H 5458 1396 50  0000 L CNN
F 1 "RC4136" H 5458 1305 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5500 1350 50  0001 C CNN
F 3 "" H 5500 1350 50  0001 C CNN
	5    5500 1350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0106
U 1 1 5DAA4EC2
P 5400 1050
F 0 "#PWR0106" H 5400 900 50  0001 C CNN
F 1 "VCC" H 5417 1223 50  0000 C CNN
F 2 "" H 5400 1050 50  0001 C CNN
F 3 "" H 5400 1050 50  0001 C CNN
	1    5400 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5DAA50D1
P 5400 1650
F 0 "#PWR0107" H 5400 1400 50  0001 C CNN
F 1 "GND" H 5405 1477 50  0000 C CNN
F 2 "" H 5400 1650 50  0001 C CNN
F 3 "" H 5400 1650 50  0001 C CNN
	1    5400 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5DAA56E6
P 5400 2550
F 0 "R1" V 5300 2550 50  0000 C CNN
F 1 "2.2K" V 5400 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5330 2550 50  0001 C CNN
F 3 "~" H 5400 2550 50  0001 C CNN
	1    5400 2550
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5DAA5A5E
P 5800 2550
F 0 "R2" V 5700 2550 50  0000 C CNN
F 1 "2.2K" V 5800 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5730 2550 50  0001 C CNN
F 3 "~" H 5800 2550 50  0001 C CNN
	1    5800 2550
	0    1    1    0   
$EndComp
$Comp
L Device:C C53
U 1 1 5DAA5D1E
P 5750 2150
F 0 "C53" V 5700 2300 50  0000 C CNN
F 1 "4700pF" V 5800 2350 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5788 2000 50  0001 C CNN
F 3 "~" H 5750 2150 50  0001 C CNN
	1    5750 2150
	0    1    1    0   
$EndComp
$Comp
L Device:C C52
U 1 1 5DAA6F05
P 6100 2700
F 0 "C52" H 5800 2700 50  0000 L CNN
F 1 "4700pF" H 5800 2600 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 6138 2550 50  0001 C CNN
F 3 "~" H 6100 2700 50  0001 C CNN
	1    6100 2700
	1    0    0    -1  
$EndComp
$Comp
L jrt-ICs:RC4136 U3
U 3 1 5DAA7E65
P 6700 2650
F 0 "U3" H 6700 3017 50  0000 C CNN
F 1 "RC4136" H 6700 2926 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6700 2650 50  0001 C CNN
F 3 "" H 6700 2650 50  0001 C CNN
	3    6700 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5DAA945B
P 6650 3000
F 0 "R3" V 6550 3000 50  0000 C CNN
F 1 "12K" V 6650 3000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6580 3000 50  0001 C CNN
F 3 "~" H 6650 3000 50  0001 C CNN
	1    6650 3000
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5DAA9DEE
P 6650 3200
F 0 "R4" V 6550 3200 50  0000 C CNN
F 1 "10K" V 6650 3200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6580 3200 50  0001 C CNN
F 3 "~" H 6650 3200 50  0001 C CNN
	1    6650 3200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5DAAAFBE
P 6800 3300
F 0 "#PWR0108" H 6800 3050 50  0001 C CNN
F 1 "GND" H 6805 3127 50  0000 C CNN
F 2 "" H 6800 3300 50  0001 C CNN
F 3 "" H 6800 3300 50  0001 C CNN
	1    6800 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5DAAB7BE
P 6100 2850
F 0 "#PWR0109" H 6100 2600 50  0001 C CNN
F 1 "GND" H 6105 2677 50  0000 C CNN
F 2 "" H 6100 2850 50  0001 C CNN
F 3 "" H 6100 2850 50  0001 C CNN
	1    6100 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 3200 6800 3300
Wire Wire Line
	7000 2650 7000 3000
Wire Wire Line
	7000 3000 6800 3000
Wire Wire Line
	6500 3000 6400 3000
Wire Wire Line
	6400 3000 6400 2750
Wire Wire Line
	6500 3200 6400 3200
Wire Wire Line
	6400 3200 6400 3000
Connection ~ 6400 3000
Wire Wire Line
	5100 2550 5250 2550
Connection ~ 5100 2550
Wire Wire Line
	5550 2550 5600 2550
Wire Wire Line
	5950 2550 6100 2550
Wire Wire Line
	6100 2550 6400 2550
Connection ~ 6100 2550
Wire Wire Line
	7000 2650 7000 2150
Wire Wire Line
	7000 2150 5900 2150
Connection ~ 7000 2650
Wire Wire Line
	5600 2150 5600 2550
Connection ~ 5600 2550
Wire Wire Line
	5600 2550 5650 2550
$Comp
L Device:R R5
U 1 1 5DABCF38
P 5400 4100
F 0 "R5" V 5300 4100 50  0000 C CNN
F 1 "2.2K" V 5400 4100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5330 4100 50  0001 C CNN
F 3 "~" H 5400 4100 50  0001 C CNN
	1    5400 4100
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5DABCF3E
P 5800 4100
F 0 "R6" V 5700 4100 50  0000 C CNN
F 1 "2.2K" V 5800 4100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5730 4100 50  0001 C CNN
F 3 "~" H 5800 4100 50  0001 C CNN
	1    5800 4100
	0    1    1    0   
$EndComp
$Comp
L Device:C C55
U 1 1 5DABCF44
P 5750 3700
F 0 "C55" V 5700 3850 50  0000 C CNN
F 1 "4700pF" V 5800 3900 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5788 3550 50  0001 C CNN
F 3 "~" H 5750 3700 50  0001 C CNN
	1    5750 3700
	0    1    1    0   
$EndComp
$Comp
L Device:C C54
U 1 1 5DABCF4A
P 6100 4250
F 0 "C54" H 5800 4250 50  0000 L CNN
F 1 "4700pF" H 5800 4150 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 6138 4100 50  0001 C CNN
F 3 "~" H 6100 4250 50  0001 C CNN
	1    6100 4250
	1    0    0    -1  
$EndComp
$Comp
L jrt-ICs:RC4136 U3
U 4 1 5DABCF50
P 6700 4200
F 0 "U3" H 6700 4567 50  0000 C CNN
F 1 "RC4136" H 6700 4476 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6700 4200 50  0001 C CNN
F 3 "" H 6700 4200 50  0001 C CNN
	4    6700 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5DABCF56
P 6650 4550
F 0 "R7" V 6550 4550 50  0000 C CNN
F 1 "12K" V 6650 4550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6580 4550 50  0001 C CNN
F 3 "~" H 6650 4550 50  0001 C CNN
	1    6650 4550
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5DABCF5C
P 6650 4750
F 0 "R8" V 6550 4750 50  0000 C CNN
F 1 "10K" V 6650 4750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6580 4750 50  0001 C CNN
F 3 "~" H 6650 4750 50  0001 C CNN
	1    6650 4750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5DABCF62
P 6800 4850
F 0 "#PWR0110" H 6800 4600 50  0001 C CNN
F 1 "GND" H 6805 4677 50  0000 C CNN
F 2 "" H 6800 4850 50  0001 C CNN
F 3 "" H 6800 4850 50  0001 C CNN
	1    6800 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5DABCF68
P 6100 4400
F 0 "#PWR0111" H 6100 4150 50  0001 C CNN
F 1 "GND" H 6105 4227 50  0000 C CNN
F 2 "" H 6100 4400 50  0001 C CNN
F 3 "" H 6100 4400 50  0001 C CNN
	1    6100 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 4750 6800 4850
Wire Wire Line
	7000 4200 7000 4550
Wire Wire Line
	7000 4550 6800 4550
Wire Wire Line
	6500 4550 6400 4550
Wire Wire Line
	6400 4550 6400 4300
Wire Wire Line
	6500 4750 6400 4750
Wire Wire Line
	6400 4750 6400 4550
Connection ~ 6400 4550
Wire Wire Line
	5550 4100 5600 4100
Wire Wire Line
	5950 4100 6100 4100
Wire Wire Line
	6100 4100 6400 4100
Connection ~ 6100 4100
Wire Wire Line
	7000 4200 7000 3700
Wire Wire Line
	7000 3700 5900 3700
Connection ~ 7000 4200
Wire Wire Line
	5600 3700 5600 4100
Connection ~ 5600 4100
Wire Wire Line
	5600 4100 5650 4100
Wire Wire Line
	7000 2650 7100 2650
Wire Wire Line
	7100 2650 7100 3550
Wire Wire Line
	7100 3550 5250 3550
Wire Wire Line
	5250 3550 5250 4100
Text Label 7200 4200 0    50   ~ 0
FILTER_OUT
Wire Wire Line
	7000 4200 7200 4200
$Comp
L Device:C_Small C?
U 1 1 5DA6BC2C
P 2500 2000
AR Path="/5D9AAACD/5DA6BC2C" Ref="C?"  Part="1" 
AR Path="/5D9A779A/5DA6BC2C" Ref="C?"  Part="1" 
AR Path="/5DA6BC2C" Ref="C1"  Part="1" 
F 0 "C1" H 2592 2046 50  0000 L CNN
F 1 ".1uF" H 2592 1955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2500 2000 50  0001 C CNN
F 3 "~" H 2500 2000 50  0001 C CNN
	1    2500 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA6BC32
P 2500 2100
AR Path="/5D9AAACD/5DA6BC32" Ref="#PWR?"  Part="1" 
AR Path="/5D9A779A/5DA6BC32" Ref="#PWR?"  Part="1" 
AR Path="/5DA6BC32" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 2500 1850 50  0001 C CNN
F 1 "GND" H 2505 1927 50  0000 C CNN
F 2 "" H 2500 2100 50  0001 C CNN
F 3 "" H 2500 2100 50  0001 C CNN
	1    2500 2100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DA6BC38
P 2500 1900
AR Path="/5D9A779A/5DA6BC38" Ref="#PWR?"  Part="1" 
AR Path="/5DA6BC38" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 2500 1750 50  0001 C CNN
F 1 "VCC" H 2517 2073 50  0000 C CNN
F 2 "" H 2500 1900 50  0001 C CNN
F 3 "" H 2500 1900 50  0001 C CNN
	1    2500 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DA6D542
P 3800 2000
AR Path="/5D9AAACD/5DA6D542" Ref="C?"  Part="1" 
AR Path="/5D9A779A/5DA6D542" Ref="C?"  Part="1" 
AR Path="/5DA6D542" Ref="C2"  Part="1" 
F 0 "C2" H 3892 2046 50  0000 L CNN
F 1 ".1uF" H 3892 1955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3800 2000 50  0001 C CNN
F 3 "~" H 3800 2000 50  0001 C CNN
	1    3800 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA6D548
P 3800 2100
AR Path="/5D9AAACD/5DA6D548" Ref="#PWR?"  Part="1" 
AR Path="/5D9A779A/5DA6D548" Ref="#PWR?"  Part="1" 
AR Path="/5DA6D548" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 3800 1850 50  0001 C CNN
F 1 "GND" H 3805 1927 50  0000 C CNN
F 2 "" H 3800 2100 50  0001 C CNN
F 3 "" H 3800 2100 50  0001 C CNN
	1    3800 2100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DA6D54E
P 3800 1900
AR Path="/5D9A779A/5DA6D54E" Ref="#PWR?"  Part="1" 
AR Path="/5DA6D54E" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 3800 1750 50  0001 C CNN
F 1 "VCC" H 3817 2073 50  0000 C CNN
F 2 "" H 3800 1900 50  0001 C CNN
F 3 "" H 3800 1900 50  0001 C CNN
	1    3800 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DA72DBC
P 5900 1150
AR Path="/5D9AAACD/5DA72DBC" Ref="C?"  Part="1" 
AR Path="/5D9A779A/5DA72DBC" Ref="C?"  Part="1" 
AR Path="/5DA72DBC" Ref="C3"  Part="1" 
F 0 "C3" H 5992 1196 50  0000 L CNN
F 1 ".1uF" H 5992 1105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5900 1150 50  0001 C CNN
F 3 "~" H 5900 1150 50  0001 C CNN
	1    5900 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA72DC2
P 5900 1250
AR Path="/5D9AAACD/5DA72DC2" Ref="#PWR?"  Part="1" 
AR Path="/5D9A779A/5DA72DC2" Ref="#PWR?"  Part="1" 
AR Path="/5DA72DC2" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 5900 1000 50  0001 C CNN
F 1 "GND" H 5905 1077 50  0000 C CNN
F 2 "" H 5900 1250 50  0001 C CNN
F 3 "" H 5900 1250 50  0001 C CNN
	1    5900 1250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DA72DC8
P 5900 1050
AR Path="/5D9A779A/5DA72DC8" Ref="#PWR?"  Part="1" 
AR Path="/5DA72DC8" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 5900 900 50  0001 C CNN
F 1 "VCC" H 5917 1223 50  0000 C CNN
F 2 "" H 5900 1050 50  0001 C CNN
F 3 "" H 5900 1050 50  0001 C CNN
	1    5900 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C56
U 1 1 5DADE5E3
P 900 5500
F 0 "C56" H 1015 5546 50  0000 L CNN
F 1 "10uF" H 1015 5455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 900 5500 50  0001 C CNN
F 3 "~" H 900 5500 50  0001 C CNN
F 4 "AVX TAP106K016SCS" H 900 5500 50  0001 C CNN "Part"
	1    900  5500
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 5DADF6FF
P 900 6100
F 0 "D1" V 854 6179 50  0000 L CNN
F 1 "1N4148" V 945 6179 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 900 6100 50  0001 C CNN
F 3 "~" H 900 6100 50  0001 C CNN
	1    900  6100
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5DAE0710
P 1200 5800
F 0 "R9" V 1100 5800 50  0000 C CNN
F 1 "2.2K" V 1200 5800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1130 5800 50  0001 C CNN
F 3 "~" H 1200 5800 50  0001 C CNN
	1    1200 5800
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0158
U 1 1 5DAE0C35
P 900 5350
F 0 "#PWR0158" H 900 5200 50  0001 C CNN
F 1 "VCC" H 917 5523 50  0000 C CNN
F 2 "" H 900 5350 50  0001 C CNN
F 3 "" H 900 5350 50  0001 C CNN
	1    900  5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0159
U 1 1 5DAE107A
P 900 6250
F 0 "#PWR0159" H 900 6000 50  0001 C CNN
F 1 "GND" H 905 6077 50  0000 C CNN
F 2 "" H 900 6250 50  0001 C CNN
F 3 "" H 900 6250 50  0001 C CNN
	1    900  6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  5650 900  5800
Wire Wire Line
	1050 5800 900  5800
Connection ~ 900  5800
Wire Wire Line
	900  5800 900  5950
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 5DAE4F52
P 1550 5800
F 0 "Q1" H 1740 5846 50  0000 L CNN
F 1 "2N3904" H 1740 5755 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 1750 5725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1550 5800 50  0001 L CNN
	1    1550 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C57
U 1 1 5DAE5EBA
P 1650 5350
F 0 "C57" H 1765 5396 50  0000 L CNN
F 1 "4.7uF" H 1765 5305 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 1650 5350 50  0001 C CNN
F 3 "~" H 1650 5350 50  0001 C CNN
F 4 " AVX TAP475K016SCS" H 1650 5350 50  0001 C CNN "Part"
	1    1650 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0160
U 1 1 5DAE6EC9
P 1650 6250
F 0 "#PWR0160" H 1650 6000 50  0001 C CNN
F 1 "GND" H 1655 6077 50  0000 C CNN
F 2 "" H 1650 6250 50  0001 C CNN
F 3 "" H 1650 6250 50  0001 C CNN
	1    1650 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 6000 1650 6250
Wire Wire Line
	1650 5500 1650 5550
$Comp
L Device:R R10
U 1 1 5DAEA7A8
P 2200 6000
F 0 "R10" H 2270 6046 50  0000 L CNN
F 1 "10K" H 2270 5955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2130 6000 50  0001 C CNN
F 3 "~" H 2200 6000 50  0001 C CNN
	1    2200 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0161
U 1 1 5DAEC987
P 2200 6250
F 0 "#PWR0161" H 2200 6000 50  0001 C CNN
F 1 "GND" H 2205 6077 50  0000 C CNN
F 2 "" H 2200 6250 50  0001 C CNN
F 3 "" H 2200 6250 50  0001 C CNN
	1    2200 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 6250 2200 6150
Wire Wire Line
	1650 5550 2200 5550
Wire Wire Line
	2200 5550 2200 5850
Connection ~ 1650 5550
Wire Wire Line
	1650 5550 1650 5600
$Comp
L Device:R R11
U 1 1 5DAF0A3B
P 2450 5550
F 0 "R11" V 2350 5550 50  0000 C CNN
F 1 "2.2K" V 2450 5550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2380 5550 50  0001 C CNN
F 3 "~" H 2450 5550 50  0001 C CNN
	1    2450 5550
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 5DAF0EE4
P 2950 5550
F 0 "R12" V 2850 5550 50  0000 C CNN
F 1 "8.2K" V 2950 5550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2880 5550 50  0001 C CNN
F 3 "~" H 2950 5550 50  0001 C CNN
	1    2950 5550
	0    1    1    0   
$EndComp
$Comp
L Device:C C58
U 1 1 5DAF1ACF
P 2700 6000
F 0 "C58" H 2815 6046 50  0000 L CNN
F 1 "1000pF" H 2750 5900 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2738 5850 50  0001 C CNN
F 3 "~" H 2700 6000 50  0001 C CNN
	1    2700 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C59
U 1 1 5DAF20CA
P 3200 6000
F 0 "C59" H 3315 6046 50  0000 L CNN
F 1 "270pF" H 3250 5900 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3238 5850 50  0001 C CNN
F 3 "~" H 3200 6000 50  0001 C CNN
	1    3200 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0162
U 1 1 5DAF2E78
P 2700 6250
F 0 "#PWR0162" H 2700 6000 50  0001 C CNN
F 1 "GND" H 2705 6077 50  0000 C CNN
F 2 "" H 2700 6250 50  0001 C CNN
F 3 "" H 2700 6250 50  0001 C CNN
	1    2700 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0163
U 1 1 5DAF3346
P 3200 6250
F 0 "#PWR0163" H 3200 6000 50  0001 C CNN
F 1 "GND" H 3205 6077 50  0000 C CNN
F 2 "" H 3200 6250 50  0001 C CNN
F 3 "" H 3200 6250 50  0001 C CNN
	1    3200 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6250 2700 6150
Wire Wire Line
	3200 6250 3200 6150
Wire Wire Line
	2600 5550 2700 5550
Wire Wire Line
	2700 5850 2700 5550
Connection ~ 2700 5550
Wire Wire Line
	2700 5550 2800 5550
Wire Wire Line
	3100 5550 3200 5550
Wire Wire Line
	3200 5550 3200 5850
$Comp
L Device:R_POT RV1
U 1 1 5DAFFA2F
P 3700 5800
F 0 "RV1" H 3631 5846 50  0000 R CNN
F 1 "10K" H 3631 5755 50  0000 R CNN
F 2 "jrt-Potentiometers:Potentiometer_Bourns_91A1x_A24" H 3700 5800 50  0001 C CNN
F 3 "~" H 3700 5800 50  0001 C CNN
F 4 "Bourns 91A1A-B24-D15L" H 3700 5800 50  0001 C CNN "Part"
	1    3700 5800
	1    0    0    -1  
$EndComp
Text Notes 3750 5950 0    50   ~ 0
Audio taper
Wire Wire Line
	3200 5550 3700 5550
Wire Wire Line
	3700 5550 3700 5650
Connection ~ 3200 5550
$Comp
L power:GND #PWR0164
U 1 1 5DB0324D
P 3700 6250
F 0 "#PWR0164" H 3700 6000 50  0001 C CNN
F 1 "GND" H 3705 6077 50  0000 C CNN
F 2 "" H 3700 6250 50  0001 C CNN
F 3 "" H 3700 6250 50  0001 C CNN
	1    3700 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 5950 3700 6250
Wire Wire Line
	2200 5550 2300 5550
Connection ~ 2200 5550
$Comp
L Amplifier_Audio:LM386 U4
U 1 1 5DB148B3
P 4850 5650
F 0 "U4" H 5050 5550 50  0000 L CNN
F 1 "LM386" H 5000 5450 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 4950 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm386.pdf" H 5050 5850 50  0001 C CNN
	1    4850 5650
	1    0    0    -1  
$EndComp
Text Label 1650 5550 0    50   ~ 0
RC1
Text Label 2650 5550 0    50   ~ 0
RC2
Text Label 3150 5550 0    50   ~ 0
RC3
Text Label 4250 5550 0    50   ~ 0
AMP_IN
Wire Wire Line
	3850 5800 3950 5800
Wire Wire Line
	3950 5800 3950 5550
Wire Wire Line
	3950 5550 4550 5550
$Comp
L power:GND #PWR0165
U 1 1 5DB1CDC3
P 4350 6250
F 0 "#PWR0165" H 4350 6000 50  0001 C CNN
F 1 "GND" H 4355 6077 50  0000 C CNN
F 2 "" H 4350 6250 50  0001 C CNN
F 3 "" H 4350 6250 50  0001 C CNN
	1    4350 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C60
U 1 1 5DB1D2FC
P 4350 6000
F 0 "C60" H 4465 6046 50  0000 L CNN
F 1 ".1uF" H 4465 5955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4388 5850 50  0001 C CNN
F 3 "~" H 4350 6000 50  0001 C CNN
	1    4350 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5750 4350 5750
Wire Wire Line
	4350 5750 4350 5850
Wire Wire Line
	4350 6150 4350 6250
NoConn ~ 4850 5950
NoConn ~ 4950 5950
$Comp
L power:VCC #PWR0166
U 1 1 5DB28474
P 4750 5350
F 0 "#PWR0166" H 4750 5200 50  0001 C CNN
F 1 "VCC" H 4767 5523 50  0000 C CNN
F 2 "" H 4750 5350 50  0001 C CNN
F 3 "" H 4750 5350 50  0001 C CNN
	1    4750 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0167
U 1 1 5DB289E9
P 4750 6250
F 0 "#PWR0167" H 4750 6000 50  0001 C CNN
F 1 "GND" H 4755 6077 50  0000 C CNN
F 2 "" H 4750 6250 50  0001 C CNN
F 3 "" H 4750 6250 50  0001 C CNN
	1    4750 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5950 4750 6250
$Comp
L Device:CP1 C61
U 1 1 5DB2BC72
P 5050 4950
F 0 "C61" H 5165 4996 50  0000 L CNN
F 1 "10uF" H 5165 4905 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 5050 4950 50  0001 C CNN
F 3 "~" H 5050 4950 50  0001 C CNN
	1    5050 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0168
U 1 1 5DB2D70B
P 5050 5100
F 0 "#PWR0168" H 5050 4850 50  0001 C CNN
F 1 "GND" H 5055 4927 50  0000 C CNN
F 2 "" H 5050 5100 50  0001 C CNN
F 3 "" H 5050 5100 50  0001 C CNN
	1    5050 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 5350 4850 4800
Wire Wire Line
	4850 4800 5050 4800
$Comp
L Device:C C62
U 1 1 5DB3511B
P 5500 5800
F 0 "C62" H 5615 5846 50  0000 L CNN
F 1 ".047uF" H 5615 5755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5538 5650 50  0001 C CNN
F 3 "~" H 5500 5800 50  0001 C CNN
	1    5500 5800
	1    0    0    -1  
$EndComp
Text Label 5150 5650 0    50   ~ 0
AMP_OUT
Wire Wire Line
	5150 5650 5500 5650
$Comp
L Device:R R13
U 1 1 5DB38D58
P 5500 6100
F 0 "R13" H 5570 6146 50  0000 L CNN
F 1 "10R" H 5570 6055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5430 6100 50  0001 C CNN
F 3 "~" H 5500 6100 50  0001 C CNN
	1    5500 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0169
U 1 1 5DB39912
P 5500 6250
F 0 "#PWR0169" H 5500 6000 50  0001 C CNN
F 1 "GND" H 5505 6077 50  0000 C CNN
F 2 "" H 5500 6250 50  0001 C CNN
F 3 "" H 5500 6250 50  0001 C CNN
	1    5500 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C63
U 1 1 5DB3A4B1
P 6000 5650
F 0 "C63" V 6252 5650 50  0000 C CNN
F 1 "220uF" V 6161 5650 50  0000 C CNN
F 2 "Capacitor_THT:CP_Axial_L18.0mm_D8.0mm_P25.00mm_Horizontal" H 6000 5650 50  0001 C CNN
F 3 "~" H 6000 5650 50  0001 C CNN
	1    6000 5650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5500 5650 5850 5650
Connection ~ 5500 5650
$Comp
L Device:R R14
U 1 1 5DB3E1C3
P 6250 6100
F 0 "R14" H 6320 6146 50  0000 L CNN
F 1 "10K" H 6320 6055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6180 6100 50  0001 C CNN
F 3 "~" H 6250 6100 50  0001 C CNN
	1    6250 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0170
U 1 1 5DB3EDAD
P 6250 6250
F 0 "#PWR0170" H 6250 6000 50  0001 C CNN
F 1 "GND" H 6255 6077 50  0000 C CNN
F 2 "" H 6250 6250 50  0001 C CNN
F 3 "" H 6250 6250 50  0001 C CNN
	1    6250 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 5650 6250 5650
Wire Wire Line
	6250 5650 6250 5950
Text Label 6250 5650 0    50   ~ 0
AUDIO_OUT
$Comp
L Device:R R15
U 1 1 5DB42AAF
P 6850 5650
F 0 "R15" V 6750 5650 50  0000 C CNN
F 1 "10R" V 6850 5650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6780 5650 50  0001 C CNN
F 3 "~" H 6850 5650 50  0001 C CNN
	1    6850 5650
	0    1    1    0   
$EndComp
$Comp
L Device:R R16
U 1 1 5DB4338A
P 6850 5900
F 0 "R16" V 6750 5900 50  0000 C CNN
F 1 "10R" V 6850 5900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6780 5900 50  0001 C CNN
F 3 "~" H 6850 5900 50  0001 C CNN
	1    6850 5900
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 5650 6700 5650
Connection ~ 6250 5650
$Comp
L Connector:AudioJack3 J5
U 1 1 5DB5431C
P 7800 5750
F 0 "J5" H 7520 5683 50  0000 R CNN
F 1 "AudioJack3" H 7520 5774 50  0000 R CNN
F 2 "jrt-Connectors:Jack_3.5mm_STX-3120-3B" H 7800 5750 50  0001 C CNN
F 3 "~" H 7800 5750 50  0001 C CNN
F 4 "Kycon STX-3120-3B-577C" H 7800 5750 50  0001 C CNN "Part"
	1    7800 5750
	-1   0    0    1   
$EndComp
Text Label 7000 5650 0    50   ~ 0
LEFT_OUT
Text Label 7000 5900 0    50   ~ 0
RIGHT_OUT
Wire Wire Line
	7000 5650 7600 5650
Wire Wire Line
	7000 5900 7450 5900
Wire Wire Line
	7450 5900 7450 5750
Wire Wire Line
	7450 5750 7600 5750
$Comp
L power:GND #PWR0171
U 1 1 5DB62DBE
P 7600 6250
F 0 "#PWR0171" H 7600 6000 50  0001 C CNN
F 1 "GND" H 7605 6077 50  0000 C CNN
F 2 "" H 7600 6250 50  0001 C CNN
F 3 "" H 7600 6250 50  0001 C CNN
	1    7600 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 5850 7600 6250
Wire Wire Line
	6700 5900 6700 5650
Connection ~ 6700 5650
Text Label 1650 5000 0    50   ~ 0
FILTER_OUT
Wire Wire Line
	1650 5000 1650 5200
$Comp
L Device:C_Small C4
U 1 1 5DBB56FD
P 4400 4900
F 0 "C4" H 4492 4946 50  0000 L CNN
F 1 ".1uF" H 4492 4855 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4438 4750 50  0001 C CNN
F 3 "~" H 4400 4900 50  0001 C CNN
	1    4400 4900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0172
U 1 1 5DBB7326
P 4400 4800
F 0 "#PWR0172" H 4400 4650 50  0001 C CNN
F 1 "VCC" H 4417 4973 50  0000 C CNN
F 2 "" H 4400 4800 50  0001 C CNN
F 3 "" H 4400 4800 50  0001 C CNN
	1    4400 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0173
U 1 1 5DBB7997
P 4400 5000
F 0 "#PWR0173" H 4400 4750 50  0001 C CNN
F 1 "GND" H 4405 4827 50  0000 C CNN
F 2 "" H 4400 5000 50  0001 C CNN
F 3 "" H 4400 5000 50  0001 C CNN
	1    4400 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C5
U 1 1 5DBB86C4
P 3950 4900
F 0 "C5" H 4065 4946 50  0000 L CNN
F 1 "10uF" H 4065 4855 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 3950 4900 50  0001 C CNN
F 3 "~" H 3950 4900 50  0001 C CNN
	1    3950 4900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0174
U 1 1 5DBB9B26
P 3950 4750
F 0 "#PWR0174" H 3950 4600 50  0001 C CNN
F 1 "VCC" H 3967 4923 50  0000 C CNN
F 2 "" H 3950 4750 50  0001 C CNN
F 3 "" H 3950 4750 50  0001 C CNN
	1    3950 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0175
U 1 1 5DBBA1C1
P 3950 5050
F 0 "#PWR0175" H 3950 4800 50  0001 C CNN
F 1 "GND" H 3955 4877 50  0000 C CNN
F 2 "" H 3950 5050 50  0001 C CNN
F 3 "" H 3950 5050 50  0001 C CNN
	1    3950 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C6
U 1 1 5DBBF595
P 2950 1950
F 0 "C6" H 3065 1996 50  0000 L CNN
F 1 "10uF" H 3065 1905 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 2950 1950 50  0001 C CNN
F 3 "~" H 2950 1950 50  0001 C CNN
	1    2950 1950
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0176
U 1 1 5DBC0036
P 2950 1800
F 0 "#PWR0176" H 2950 1650 50  0001 C CNN
F 1 "VCC" H 2967 1973 50  0000 C CNN
F 2 "" H 2950 1800 50  0001 C CNN
F 3 "" H 2950 1800 50  0001 C CNN
	1    2950 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0177
U 1 1 5DBC0E34
P 2950 2100
F 0 "#PWR0177" H 2950 1850 50  0001 C CNN
F 1 "GND" H 2955 1927 50  0000 C CNN
F 2 "" H 2950 2100 50  0001 C CNN
F 3 "" H 2950 2100 50  0001 C CNN
	1    2950 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C7
U 1 1 5DBC7FB6
P 6400 1150
F 0 "C7" H 6515 1196 50  0000 L CNN
F 1 "10uF" H 6515 1105 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 6400 1150 50  0001 C CNN
F 3 "~" H 6400 1150 50  0001 C CNN
	1    6400 1150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0178
U 1 1 5DBC86C4
P 6400 1000
F 0 "#PWR0178" H 6400 850 50  0001 C CNN
F 1 "VCC" H 6417 1173 50  0000 C CNN
F 2 "" H 6400 1000 50  0001 C CNN
F 3 "" H 6400 1000 50  0001 C CNN
	1    6400 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0179
U 1 1 5DBC8DD9
P 6400 1300
F 0 "#PWR0179" H 6400 1050 50  0001 C CNN
F 1 "GND" H 6405 1127 50  0000 C CNN
F 2 "" H 6400 1300 50  0001 C CNN
F 3 "" H 6400 1300 50  0001 C CNN
	1    6400 1300
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:CXO_DIP8 X1
U 1 1 5DAEC3CE
P 1200 1350
F 0 "X1" H 1400 1800 50  0000 L CNN
F 1 "ECS-2100AX-3.579545MHZ" H 1400 1700 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-8" H 1650 1000 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/122/ecs-2100x-1084611.pdf" H 1100 1350 50  0001 C CNN
F 4 "ECS-2100AX-3.579545MHZ" H 1200 1350 50  0001 C CNN "Part"
	1    1200 1350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0113
U 1 1 5DAEE72D
P 1200 1050
F 0 "#PWR0113" H 1200 900 50  0001 C CNN
F 1 "VCC" H 1217 1223 50  0000 C CNN
F 2 "" H 1200 1050 50  0001 C CNN
F 3 "" H 1200 1050 50  0001 C CNN
	1    1200 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5DAEF2DF
P 1200 1650
F 0 "#PWR0114" H 1200 1400 50  0001 C CNN
F 1 "GND" H 1205 1477 50  0000 C CNN
F 2 "" H 1200 1650 50  0001 C CNN
F 3 "" H 1200 1650 50  0001 C CNN
	1    1200 1650
	1    0    0    -1  
$EndComp
Text GLabel 1500 1350 2    50   Output ~ 0
OPL_CLK
NoConn ~ 900  1350
Wire Wire Line
	2350 3300 2500 3300
Wire Wire Line
	2900 2850 2900 3700
Wire Wire Line
	2900 3700 4500 3700
Connection ~ 4500 3700
$EndSCHEMATC
