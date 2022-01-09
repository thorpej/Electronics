EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "RPI Remote Power Controller"
Date ""
Rev "0.1"
Comp "Copyright (c) 2022 Jason R. Thorpe. See LICENSE.txt."
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4150 7050 5000 7050
Wire Wire Line
	4200 7150 5000 7150
Wire Wire Line
	4250 7250 5000 7250
$Comp
L Regulator_Linear:LM1084-5.0 U1
U 1 1 61D8848E
P 1850 6250
F 0 "U1" H 1850 6492 50  0000 C CNN
F 1 "LM1084-5.0" H 1850 6401 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 1850 6500 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm1084.pdf" H 1850 6250 50  0001 C CNN
	1    1850 6250
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0101
U 1 1 61D8BAD3
P 1550 6250
F 0 "#PWR0101" H 1550 6100 50  0001 C CNN
F 1 "+12V" V 1565 6378 50  0000 L CNN
F 2 "" H 1550 6250 50  0001 C CNN
F 3 "" H 1550 6250 50  0001 C CNN
	1    1550 6250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 61D8BF44
P 1850 6550
F 0 "#PWR0102" H 1850 6300 50  0001 C CNN
F 1 "GND" H 1855 6377 50  0000 C CNN
F 2 "" H 1850 6550 50  0001 C CNN
F 3 "" H 1850 6550 50  0001 C CNN
	1    1850 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 61D8C3DD
P 2750 6250
F 0 "#PWR0103" H 2750 6100 50  0001 C CNN
F 1 "+5V" V 2765 6378 50  0000 L CNN
F 2 "" H 2750 6250 50  0001 C CNN
F 3 "" H 2750 6250 50  0001 C CNN
	1    2750 6250
	0    1    1    0   
$EndComp
$Comp
L Connector:Raspberry_Pi_2_3 J11
U 1 1 61D8D919
P 1850 8500
F 0 "J11" H 2450 9850 50  0000 C CNN
F 1 "Raspberry_Pi_Zero_W" H 2500 9750 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x20_P2.54mm_Vertical" H 1850 8500 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 1850 8500 50  0001 C CNN
	1    1850 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 7200 1650 7200
$Comp
L power:+5V #PWR0104
U 1 1 61D9E3EA
P 1650 7200
F 0 "#PWR0104" H 1650 7050 50  0001 C CNN
F 1 "+5V" H 1665 7373 50  0000 C CNN
F 2 "" H 1650 7200 50  0001 C CNN
F 3 "" H 1650 7200 50  0001 C CNN
	1    1650 7200
	1    0    0    -1  
$EndComp
Connection ~ 1650 7200
NoConn ~ 5800 9450
NoConn ~ 5800 9350
NoConn ~ 5800 9250
NoConn ~ 5800 9150
NoConn ~ 5800 9050
NoConn ~ 5800 8950
NoConn ~ 5000 9450
NoConn ~ 5000 9350
NoConn ~ 5000 9250
NoConn ~ 5000 9150
NoConn ~ 5000 9050
NoConn ~ 5000 8950
Wire Wire Line
	4500 8850 5000 8850
Wire Wire Line
	4500 8400 4500 8850
Wire Wire Line
	4150 8400 4500 8400
Wire Wire Line
	4450 7650 5000 7650
Wire Wire Line
	4450 8300 4450 7650
Wire Wire Line
	4150 8300 4450 8300
Wire Wire Line
	4400 7550 5000 7550
Wire Wire Line
	4400 8200 4400 7550
Wire Wire Line
	4150 8200 4400 8200
Wire Wire Line
	4350 7450 5000 7450
Wire Wire Line
	4350 8100 4350 7450
Wire Wire Line
	4150 8100 4350 8100
Wire Wire Line
	4300 7350 5000 7350
Wire Wire Line
	4300 8000 4300 7350
Wire Wire Line
	4150 8000 4300 8000
Wire Wire Line
	4250 7900 4250 7250
Wire Wire Line
	4150 7900 4250 7900
Wire Wire Line
	4200 7800 4200 7150
Wire Wire Line
	4150 7800 4200 7800
Wire Wire Line
	4150 7700 4150 7050
$Comp
L Interface_Expansion:MCP23008-xP U2
U 1 1 61D79BFC
P 3650 8100
F 0 "U2" H 3250 8800 50  0000 C CNN
F 1 "MCP23008-xP" H 3250 8700 50  0000 C CNN
F 2 "Package_DIP:DIP-18_W7.62mm_Socket" H 3650 7050 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/MCP23008-MCP23S08-Data-Sheet-20001919F.pdf" H 4950 6900 50  0001 C CNN
	1    3650 8100
	1    0    0    -1  
$EndComp
$Comp
L Transistor_Array:ULN2003 U4
U 1 1 61D78993
P 5400 9050
F 0 "U4" H 5400 9717 50  0000 C CNN
F 1 "ULN2003" H 5400 9626 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 5450 8500 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2003a.pdf" H 5500 8850 50  0001 C CNN
	1    5400 9050
	1    0    0    -1  
$EndComp
$Comp
L Transistor_Array:ULN2003 U3
U 1 1 61D76245
P 5400 7250
F 0 "U3" H 5400 7917 50  0000 C CNN
F 1 "ULN2003" H 5400 7826 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 5450 6700 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2003a.pdf" H 5500 7050 50  0001 C CNN
	1    5400 7250
	1    0    0    -1  
$EndComp
NoConn ~ 2050 7200
$Comp
L power:GND #PWR0105
U 1 1 61DCADF1
P 5400 7850
F 0 "#PWR0105" H 5400 7600 50  0001 C CNN
F 1 "GND" H 5405 7677 50  0000 C CNN
F 2 "" H 5400 7850 50  0001 C CNN
F 3 "" H 5400 7850 50  0001 C CNN
	1    5400 7850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 61DCB1B2
P 5400 9650
F 0 "#PWR0106" H 5400 9400 50  0001 C CNN
F 1 "GND" H 5405 9477 50  0000 C CNN
F 2 "" H 5400 9650 50  0001 C CNN
F 3 "" H 5400 9650 50  0001 C CNN
	1    5400 9650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 9800 2050 9800
Wire Wire Line
	2050 9800 1950 9800
Connection ~ 2050 9800
Wire Wire Line
	1950 9800 1850 9800
Connection ~ 1950 9800
Wire Wire Line
	1850 9800 1750 9800
Connection ~ 1850 9800
Wire Wire Line
	1750 9800 1650 9800
Connection ~ 1750 9800
Wire Wire Line
	1650 9800 1550 9800
Connection ~ 1650 9800
Wire Wire Line
	1550 9800 1450 9800
Connection ~ 1550 9800
$Comp
L power:GND #PWR0107
U 1 1 61DCEFC8
P 1450 9800
F 0 "#PWR0107" H 1450 9550 50  0001 C CNN
F 1 "GND" H 1455 9627 50  0000 C CNN
F 2 "" H 1450 9800 50  0001 C CNN
F 3 "" H 1450 9800 50  0001 C CNN
	1    1450 9800
	1    0    0    -1  
$EndComp
Connection ~ 1450 9800
$Comp
L power:+12V #PWR0108
U 1 1 61DD7DE0
P 5800 6850
F 0 "#PWR0108" H 5800 6700 50  0001 C CNN
F 1 "+12V" V 5815 6978 50  0000 L CNN
F 2 "" H 5800 6850 50  0001 C CNN
F 3 "" H 5800 6850 50  0001 C CNN
	1    5800 6850
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR0109
U 1 1 61DD7EB4
P 5800 8650
F 0 "#PWR0109" H 5800 8500 50  0001 C CNN
F 1 "+12V" V 5815 8778 50  0000 L CNN
F 2 "" H 5800 8650 50  0001 C CNN
F 3 "" H 5800 8650 50  0001 C CNN
	1    5800 8650
	0    1    1    0   
$EndComp
Wire Wire Line
	2650 7900 3150 7900
Wire Wire Line
	2650 8000 2700 8000
Wire Wire Line
	2700 8000 2700 7800
Wire Wire Line
	2700 7800 3150 7800
$Comp
L power:GND #PWR0110
U 1 1 61DE267A
P 3650 8700
F 0 "#PWR0110" H 3650 8450 50  0001 C CNN
F 1 "GND" H 3655 8527 50  0000 C CNN
F 2 "" H 3650 8700 50  0001 C CNN
F 3 "" H 3650 8700 50  0001 C CNN
	1    3650 8700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 7200 1950 7050
Wire Wire Line
	3650 7050 3650 7500
NoConn ~ 3150 8100
Wire Wire Line
	3150 8300 3150 8400
Wire Wire Line
	3150 8500 3150 8400
Connection ~ 3150 8400
$Comp
L power:GND #PWR0111
U 1 1 61DE5BE2
P 3150 8500
F 0 "#PWR0111" H 3150 8250 50  0001 C CNN
F 1 "GND" V 3155 8372 50  0000 R CNN
F 2 "" H 3150 8500 50  0001 C CNN
F 3 "" H 3150 8500 50  0001 C CNN
	1    3150 8500
	0    1    1    0   
$EndComp
Connection ~ 3150 8500
Text GLabel 1450 950  2    50   Output ~ 0
Mains_Hot
Text GLabel 1450 1050 2    50   Output ~ 0
Mains_Neutral
$Comp
L power:GND #PWR0112
U 1 1 61DEC73D
P 1450 1150
F 0 "#PWR0112" H 1450 900 50  0001 C CNN
F 1 "GND" V 1455 1022 50  0000 R CNN
F 2 "" H 1450 1150 50  0001 C CNN
F 3 "" H 1450 1150 50  0001 C CNN
	1    1450 1150
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J9
U 1 1 61DF14C9
P 1150 6800
F 0 "J9" H 1230 6842 50  0000 L CNN
F 1 "Serial_Pin_Header" H 1230 6751 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1150 6800 50  0001 C CNN
F 3 "~" H 1150 6800 50  0001 C CNN
	1    1150 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 7600 900  7600
Wire Wire Line
	900  7600 900  6700
Wire Wire Line
	900  6700 950  6700
Wire Wire Line
	1050 7700 850  7700
Wire Wire Line
	850  7700 850  6800
Wire Wire Line
	850  6800 950  6800
$Comp
L power:GND #PWR0113
U 1 1 61DF4D7D
P 1150 7050
F 0 "#PWR0113" H 1150 6800 50  0001 C CNN
F 1 "GND" H 1155 6877 50  0000 C CNN
F 2 "" H 1150 7050 50  0001 C CNN
F 3 "" H 1150 7050 50  0001 C CNN
	1    1150 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  6900 950  7050
Wire Wire Line
	950  7050 1150 7050
$Comp
L jrt-Relays:Rayex_LB2_DPDT SW1
U 1 1 61DFBECE
P 1500 2600
F 0 "SW1" H 1500 3365 50  0000 C CNN
F 1 "Rayex_LB2_DPDT" H 1500 3274 50  0000 C CNN
F 2 "jrt-Relays:Rayex-LB2-lug" H 1500 1800 50  0001 C CNN
F 3 "https://www.jameco.com/Jameco/Products/ProdDS/172719.pdf" H 1500 2600 50  0001 C CNN
	1    1500 2600
	1    0    0    -1  
$EndComp
$Comp
L jrt-Relays:Rayex_LB2_DPDT SW2
U 1 1 61E00261
P 3500 2600
F 0 "SW2" H 3500 3365 50  0000 C CNN
F 1 "Rayex_LB2_DPDT" H 3500 3274 50  0000 C CNN
F 2 "jrt-Relays:Rayex-LB2-lug" H 3500 1800 50  0001 C CNN
F 3 "https://www.jameco.com/Jameco/Products/ProdDS/172719.pdf" H 3500 2600 50  0001 C CNN
	1    3500 2600
	1    0    0    -1  
$EndComp
$Comp
L jrt-Relays:Rayex_LB2_DPDT SW3
U 1 1 61E01B03
P 5500 2600
F 0 "SW3" H 5500 3365 50  0000 C CNN
F 1 "Rayex_LB2_DPDT" H 5500 3274 50  0000 C CNN
F 2 "jrt-Relays:Rayex-LB2-lug" H 5500 1800 50  0001 C CNN
F 3 "https://www.jameco.com/Jameco/Products/ProdDS/172719.pdf" H 5500 2600 50  0001 C CNN
	1    5500 2600
	1    0    0    -1  
$EndComp
$Comp
L jrt-Relays:Rayex_LB2_DPDT SW4
U 1 1 61E028C4
P 7500 2600
F 0 "SW4" H 7500 3365 50  0000 C CNN
F 1 "Rayex_LB2_DPDT" H 7500 3274 50  0000 C CNN
F 2 "jrt-Relays:Rayex-LB2-lug" H 7500 1800 50  0001 C CNN
F 3 "https://www.jameco.com/Jameco/Products/ProdDS/172719.pdf" H 7500 2600 50  0001 C CNN
	1    7500 2600
	1    0    0    -1  
$EndComp
$Comp
L jrt-Relays:Rayex_LB2_DPDT SW5
U 1 1 61E1AEB7
P 9500 2600
F 0 "SW5" H 9500 3365 50  0000 C CNN
F 1 "Rayex_LB2_DPDT" H 9500 3274 50  0000 C CNN
F 2 "jrt-Relays:Rayex-LB2-lug" H 9500 1800 50  0001 C CNN
F 3 "https://www.jameco.com/Jameco/Products/ProdDS/172719.pdf" H 9500 2600 50  0001 C CNN
	1    9500 2600
	1    0    0    -1  
$EndComp
$Comp
L jrt-Relays:Rayex_LB2_DPDT SW6
U 1 1 61E1AEBD
P 11500 2600
F 0 "SW6" H 11500 3365 50  0000 C CNN
F 1 "Rayex_LB2_DPDT" H 11500 3274 50  0000 C CNN
F 2 "jrt-Relays:Rayex-LB2-lug" H 11500 1800 50  0001 C CNN
F 3 "https://www.jameco.com/Jameco/Products/ProdDS/172719.pdf" H 11500 2600 50  0001 C CNN
	1    11500 2600
	1    0    0    -1  
$EndComp
$Comp
L jrt-Relays:Rayex_LB2_DPDT SW7
U 1 1 61E1AEC3
P 13500 2600
F 0 "SW7" H 13500 3365 50  0000 C CNN
F 1 "Rayex_LB2_DPDT" H 13500 3274 50  0000 C CNN
F 2 "jrt-Relays:Rayex-LB2-lug" H 13500 1800 50  0001 C CNN
F 3 "https://www.jameco.com/Jameco/Products/ProdDS/172719.pdf" H 13500 2600 50  0001 C CNN
	1    13500 2600
	1    0    0    -1  
$EndComp
$Comp
L jrt-Relays:Rayex_LB2_DPDT SW8
U 1 1 61E1AEC9
P 15500 2600
F 0 "SW8" H 15500 3365 50  0000 C CNN
F 1 "Rayex_LB2_DPDT" H 15500 3274 50  0000 C CNN
F 2 "jrt-Relays:Rayex-LB2-lug" H 15500 1800 50  0001 C CNN
F 3 "https://www.jameco.com/Jameco/Products/ProdDS/172719.pdf" H 15500 2600 50  0001 C CNN
	1    15500 2600
	1    0    0    -1  
$EndComp
Text GLabel 650  1500 1    50   Input ~ 0
Mains_Hot
Text GLabel 2350 1500 1    50   Input ~ 0
Mains_Neutral
Wire Wire Line
	650  1500 650  1550
Wire Wire Line
	650  2400 800  2400
Wire Wire Line
	2350 1500 2350 1650
Wire Wire Line
	2350 2400 2200 2400
Wire Wire Line
	650  1550 2650 1550
Wire Wire Line
	2650 1550 2650 2400
Wire Wire Line
	2650 2400 2800 2400
Connection ~ 650  1550
Wire Wire Line
	650  1550 650  2400
Wire Wire Line
	2650 1550 4650 1550
Wire Wire Line
	4650 1550 4650 2400
Wire Wire Line
	4650 2400 4800 2400
Connection ~ 2650 1550
Wire Wire Line
	4650 1550 6650 1550
Wire Wire Line
	6650 1550 6650 2400
Wire Wire Line
	6650 2400 6800 2400
Connection ~ 4650 1550
Wire Wire Line
	6650 1550 8650 1550
Wire Wire Line
	8650 1550 8650 2400
Wire Wire Line
	8650 2400 8800 2400
Connection ~ 6650 1550
Wire Wire Line
	8650 1550 10650 1550
Wire Wire Line
	10650 1550 10650 2400
Wire Wire Line
	10650 2400 10800 2400
Connection ~ 8650 1550
Wire Wire Line
	10650 1550 12650 1550
Wire Wire Line
	12650 1550 12650 2400
Wire Wire Line
	12650 2400 12800 2400
Connection ~ 10650 1550
Wire Wire Line
	12650 1550 14650 1550
Wire Wire Line
	14650 1550 14650 2400
Wire Wire Line
	14650 2400 14800 2400
Connection ~ 12650 1550
Wire Wire Line
	2350 1650 4350 1650
Wire Wire Line
	4350 1650 4350 2400
Wire Wire Line
	4350 2400 4200 2400
Connection ~ 2350 1650
Wire Wire Line
	2350 1650 2350 2400
Wire Wire Line
	4350 1650 6350 1650
Wire Wire Line
	6350 1650 6350 2400
Wire Wire Line
	6350 2400 6200 2400
Connection ~ 4350 1650
Wire Wire Line
	6350 1650 8350 1650
Wire Wire Line
	8350 1650 8350 2400
Wire Wire Line
	8350 2400 8200 2400
Connection ~ 6350 1650
Wire Wire Line
	8350 1650 10350 1650
Wire Wire Line
	10350 1650 10350 2400
Wire Wire Line
	10350 2400 10200 2400
Connection ~ 8350 1650
Wire Wire Line
	10350 1650 12350 1650
Wire Wire Line
	12350 1650 12350 2400
Wire Wire Line
	12350 2400 12200 2400
Connection ~ 10350 1650
Wire Wire Line
	12350 1650 14350 1650
Wire Wire Line
	14350 1650 14350 2400
Wire Wire Line
	14350 2400 14200 2400
Connection ~ 12350 1650
Wire Wire Line
	14350 1650 16350 1650
Wire Wire Line
	16350 1650 16350 2400
Wire Wire Line
	16350 2400 16200 2400
Connection ~ 14350 1650
$Comp
L power:+12V #PWR0114
U 1 1 61E8A695
P 1500 3400
F 0 "#PWR0114" H 1500 3250 50  0001 C CNN
F 1 "+12V" H 1515 3573 50  0000 C CNN
F 2 "" H 1500 3400 50  0001 C CNN
F 3 "" H 1500 3400 50  0001 C CNN
	1    1500 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	800  3050 800  3400
Wire Wire Line
	800  3400 1500 3400
Wire Wire Line
	2800 3050 2800 3400
Wire Wire Line
	2800 3400 1500 3400
Connection ~ 1500 3400
Wire Wire Line
	4800 3050 4800 3400
Wire Wire Line
	4800 3400 2800 3400
Connection ~ 2800 3400
Wire Wire Line
	6800 3050 6800 3400
Wire Wire Line
	6800 3400 4800 3400
Connection ~ 4800 3400
Wire Wire Line
	8800 3050 8800 3400
Wire Wire Line
	8800 3400 6800 3400
Connection ~ 6800 3400
Wire Wire Line
	10800 3050 10800 3400
Wire Wire Line
	10800 3400 8800 3400
Connection ~ 8800 3400
Wire Wire Line
	12800 3050 12800 3400
Wire Wire Line
	12800 3400 10800 3400
Connection ~ 10800 3400
Wire Wire Line
	14800 3050 14800 3400
Wire Wire Line
	14800 3400 12800 3400
Connection ~ 12800 3400
Wire Wire Line
	800  2600 650  2600
Wire Wire Line
	650  2600 650  3850
Wire Wire Line
	650  3850 1450 3850
Wire Wire Line
	2200 2600 2350 2600
Wire Wire Line
	2350 2600 2350 3850
Wire Wire Line
	2350 3850 1550 3850
Wire Wire Line
	2800 2600 2650 2600
Wire Wire Line
	2650 2600 2650 3850
Wire Wire Line
	2650 3850 3450 3850
Wire Wire Line
	4200 2600 4350 2600
Wire Wire Line
	4350 2600 4350 3850
Wire Wire Line
	4350 3850 3550 3850
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 61EBECBA
P 5450 4050
F 0 "J3" V 5600 4050 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 5700 4400 50  0000 R CNN
F 2 "jrt-TerminalBlocks:TE_AMP-2_P10.16mm" H 5450 4050 50  0001 C CNN
F 3 "~" H 5450 4050 50  0001 C CNN
	1    5450 4050
	0    -1   1    0   
$EndComp
Wire Wire Line
	4800 2600 4650 2600
Wire Wire Line
	4650 2600 4650 3850
Wire Wire Line
	4650 3850 5450 3850
Wire Wire Line
	6200 2600 6350 2600
Wire Wire Line
	6350 2600 6350 3850
Wire Wire Line
	6350 3850 5550 3850
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 61EC9788
P 7450 4050
F 0 "J4" V 7600 4050 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 7700 4400 50  0000 R CNN
F 2 "jrt-TerminalBlocks:TE_AMP-2_P10.16mm" H 7450 4050 50  0001 C CNN
F 3 "~" H 7450 4050 50  0001 C CNN
	1    7450 4050
	0    -1   1    0   
$EndComp
Wire Wire Line
	6800 2600 6650 2600
Wire Wire Line
	6650 2600 6650 3850
Wire Wire Line
	6650 3850 7450 3850
Wire Wire Line
	8200 2600 8350 2600
Wire Wire Line
	8350 2600 8350 3850
Wire Wire Line
	8350 3850 7550 3850
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 61ED4FDB
P 9450 4050
F 0 "J5" V 9600 4050 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 9700 4400 50  0000 R CNN
F 2 "jrt-TerminalBlocks:TE_AMP-2_P10.16mm" H 9450 4050 50  0001 C CNN
F 3 "~" H 9450 4050 50  0001 C CNN
	1    9450 4050
	0    -1   1    0   
$EndComp
Wire Wire Line
	8800 2600 8650 2600
Wire Wire Line
	8650 2600 8650 3850
Wire Wire Line
	8650 3850 9450 3850
Wire Wire Line
	10200 2600 10350 2600
Wire Wire Line
	10350 2600 10350 3850
Wire Wire Line
	10350 3850 9550 3850
$Comp
L Connector:Screw_Terminal_01x02 J6
U 1 1 61EE14EB
P 11450 4050
F 0 "J6" V 11600 4050 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 11700 4400 50  0000 R CNN
F 2 "jrt-TerminalBlocks:TE_AMP-2_P10.16mm" H 11450 4050 50  0001 C CNN
F 3 "~" H 11450 4050 50  0001 C CNN
	1    11450 4050
	0    -1   1    0   
$EndComp
Wire Wire Line
	10800 2600 10650 2600
Wire Wire Line
	10650 2600 10650 3850
Wire Wire Line
	10650 3850 11450 3850
Wire Wire Line
	12200 2600 12350 2600
Wire Wire Line
	12350 2600 12350 3850
Wire Wire Line
	12350 3850 11550 3850
$Comp
L Connector:Screw_Terminal_01x02 J7
U 1 1 61EEE7F4
P 13450 4050
F 0 "J7" V 13600 4050 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 13700 4400 50  0000 R CNN
F 2 "jrt-TerminalBlocks:TE_AMP-2_P10.16mm" H 13450 4050 50  0001 C CNN
F 3 "~" H 13450 4050 50  0001 C CNN
	1    13450 4050
	0    -1   1    0   
$EndComp
Wire Wire Line
	12800 2600 12650 2600
Wire Wire Line
	12650 2600 12650 3850
Wire Wire Line
	12650 3850 13450 3850
Wire Wire Line
	14200 2600 14350 2600
Wire Wire Line
	14350 2600 14350 3850
Wire Wire Line
	14350 3850 13550 3850
$Comp
L Connector:Screw_Terminal_01x02 J8
U 1 1 61EFC655
P 15450 4050
F 0 "J8" V 15600 4050 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 15700 4400 50  0000 R CNN
F 2 "jrt-TerminalBlocks:TE_AMP-2_P10.16mm" H 15450 4050 50  0001 C CNN
F 3 "~" H 15450 4050 50  0001 C CNN
	1    15450 4050
	0    -1   1    0   
$EndComp
Wire Wire Line
	14800 2600 14650 2600
Wire Wire Line
	14650 2600 14650 3850
Wire Wire Line
	14650 3850 15450 3850
Wire Wire Line
	16200 2600 16350 2600
Wire Wire Line
	16350 2600 16350 3850
Wire Wire Line
	16350 3850 15550 3850
Wire Wire Line
	800  2200 750  2200
Wire Wire Line
	750  2200 750  1750
Wire Wire Line
	750  1750 1450 1750
Wire Wire Line
	2250 1750 2250 2200
Wire Wire Line
	2250 2200 2200 2200
Wire Wire Line
	2250 1750 2750 1750
Wire Wire Line
	2750 1750 2750 2200
Wire Wire Line
	2750 2200 2800 2200
Connection ~ 2250 1750
Wire Wire Line
	2750 1750 4250 1750
Wire Wire Line
	4250 1750 4250 2200
Wire Wire Line
	4250 2200 4200 2200
Connection ~ 2750 1750
Wire Wire Line
	4250 1750 4750 1750
Wire Wire Line
	4750 1750 4750 2200
Wire Wire Line
	4750 2200 4800 2200
Connection ~ 4250 1750
Wire Wire Line
	4750 1750 6250 1750
Wire Wire Line
	6250 1750 6250 2200
Wire Wire Line
	6250 2200 6200 2200
Connection ~ 4750 1750
Wire Wire Line
	6250 1750 6750 1750
Wire Wire Line
	6750 1750 6750 2200
Wire Wire Line
	6750 2200 6800 2200
Connection ~ 6250 1750
Wire Wire Line
	6750 1750 8250 1750
Wire Wire Line
	8250 1750 8250 2200
Wire Wire Line
	8250 2200 8200 2200
Connection ~ 6750 1750
Wire Wire Line
	8250 1750 8750 1750
Wire Wire Line
	8750 1750 8750 2200
Wire Wire Line
	8750 2200 8800 2200
Connection ~ 8250 1750
Wire Wire Line
	8750 1750 10250 1750
Wire Wire Line
	10250 1750 10250 2200
Wire Wire Line
	10250 2200 10200 2200
Connection ~ 8750 1750
Wire Wire Line
	10250 1750 10750 1750
Wire Wire Line
	10750 1750 10750 2200
Wire Wire Line
	10750 2200 10800 2200
Connection ~ 10250 1750
Wire Wire Line
	10750 1750 12250 1750
Wire Wire Line
	12250 1750 12250 2200
Wire Wire Line
	12250 2200 12200 2200
Connection ~ 10750 1750
Wire Wire Line
	12250 1750 12750 1750
Wire Wire Line
	12750 1750 12750 2200
Wire Wire Line
	12750 2200 12800 2200
Connection ~ 12250 1750
Wire Wire Line
	12750 1750 14250 1750
Wire Wire Line
	14250 1750 14250 2200
Wire Wire Line
	14250 2200 14200 2200
Connection ~ 12750 1750
Wire Wire Line
	14250 1750 14750 1750
Wire Wire Line
	14750 1750 14750 2200
Wire Wire Line
	14750 2200 14800 2200
Connection ~ 14250 1750
Wire Wire Line
	14750 1750 16250 1750
Wire Wire Line
	16250 1750 16250 2200
Wire Wire Line
	16250 2200 16200 2200
Connection ~ 14750 1750
Wire Wire Line
	1450 1150 1450 1750
Connection ~ 1450 1150
Connection ~ 1450 1750
Wire Wire Line
	1450 1750 2250 1750
Wire Wire Line
	2200 3050 2200 5950
Wire Wire Line
	2200 5950 6200 5950
Wire Wire Line
	6200 5950 6200 7050
Wire Wire Line
	6200 7050 5800 7050
Wire Wire Line
	4200 3050 4200 5900
Wire Wire Line
	4200 5900 6250 5900
Wire Wire Line
	6250 5900 6250 7150
Wire Wire Line
	6250 7150 5800 7150
Wire Wire Line
	6200 3050 6200 5850
Wire Wire Line
	6200 5850 6300 5850
Wire Wire Line
	6300 5850 6300 7250
Wire Wire Line
	6300 7250 5800 7250
Wire Wire Line
	8200 3050 8200 5850
Wire Wire Line
	8200 5850 6350 5850
Wire Wire Line
	6350 5850 6350 7350
Wire Wire Line
	6350 7350 5800 7350
Wire Wire Line
	10200 3050 10200 5900
Wire Wire Line
	10200 5900 6400 5900
Wire Wire Line
	6400 5900 6400 7450
Wire Wire Line
	6400 7450 5800 7450
Wire Wire Line
	12200 3050 12200 5950
Wire Wire Line
	12200 5950 6450 5950
Wire Wire Line
	6450 5950 6450 7550
Wire Wire Line
	6450 7550 5800 7550
Wire Wire Line
	14200 3050 14200 6000
Wire Wire Line
	14200 6000 6500 6000
Wire Wire Line
	6500 6000 6500 7650
Wire Wire Line
	6500 7650 5800 7650
Wire Wire Line
	16200 3050 16200 6050
Wire Wire Line
	16200 6050 6550 6050
Wire Wire Line
	6550 6050 6550 8850
Wire Wire Line
	6550 8850 5800 8850
NoConn ~ 1050 7900
NoConn ~ 1050 8000
NoConn ~ 1050 8100
NoConn ~ 1050 8300
NoConn ~ 1050 8400
NoConn ~ 1050 8700
NoConn ~ 1050 8800
NoConn ~ 1050 8900
NoConn ~ 1050 9000
NoConn ~ 1050 9100
NoConn ~ 1050 9200
NoConn ~ 2650 8200
NoConn ~ 2650 8300
NoConn ~ 2650 8400
NoConn ~ 2650 8600
NoConn ~ 2650 8700
NoConn ~ 2650 8800
NoConn ~ 2650 8900
NoConn ~ 2650 9000
NoConn ~ 2650 9200
NoConn ~ 2650 9300
NoConn ~ 2650 7600
NoConn ~ 2650 7700
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 61EB49CA
P 3450 4050
F 0 "J2" V 3600 4050 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 3700 4400 50  0000 R CNN
F 2 "jrt-TerminalBlocks:TE_AMP-2_P10.16mm" H 3450 4050 50  0001 C CNN
F 3 "~" H 3450 4050 50  0001 C CNN
	1    3450 4050
	0    -1   1    0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 61EA7719
P 1450 4050
F 0 "J1" V 1600 4050 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 1700 4400 50  0000 R CNN
F 2 "jrt-TerminalBlocks:TE_AMP-2_P10.16mm" H 1450 4050 50  0001 C CNN
F 3 "~" H 1450 4050 50  0001 C CNN
	1    1450 4050
	0    -1   1    0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J10
U 1 1 61DEA079
P 1250 1050
F 0 "J10" H 1168 1367 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 1168 1276 50  0000 C CNN
F 2 "jrt-TerminalBlocks:TE_AMP-3_P10.16mm" H 1250 1050 50  0001 C CNN
F 3 "~" H 1250 1050 50  0001 C CNN
	1    1250 1050
	-1   0    0    -1  
$EndComp
Text GLabel 650  3950 3    50   Output ~ 0
O1_Hot
Text GLabel 2350 3950 3    50   Output ~ 0
O1_Neutral
Text GLabel 2650 3950 3    50   Output ~ 0
O2_Hot
Text GLabel 4350 3950 3    50   Output ~ 0
O2_Neutral
Text GLabel 4650 3950 3    50   Output ~ 0
O3_Hot
Text GLabel 6350 3950 3    50   Output ~ 0
O3_Neutral
Text GLabel 6650 3950 3    50   Output ~ 0
O4_Hot
Text GLabel 8350 3950 3    50   Output ~ 0
O4_Neutral
Text GLabel 8650 3950 3    50   Output ~ 0
O5_Hot
Text GLabel 10350 3950 3    50   Output ~ 0
O5_Neutral
Text GLabel 10650 3950 3    50   Output ~ 0
O6_Hot
Text GLabel 12350 3950 3    50   Output ~ 0
O6_Neutral
Text GLabel 12650 3950 3    50   Output ~ 0
O7_Hot
Text GLabel 14350 3950 3    50   Output ~ 0
O7_Neutral
Text GLabel 14650 3950 3    50   Output ~ 0
O8_Hot
Text GLabel 16350 3950 3    50   Output ~ 0
O8_Neutral
Wire Wire Line
	16350 3850 16350 3950
Connection ~ 16350 3850
Wire Wire Line
	14650 3850 14650 3950
Connection ~ 14650 3850
Wire Wire Line
	14350 3850 14350 3950
Connection ~ 14350 3850
Wire Wire Line
	12650 3850 12650 3950
Connection ~ 12650 3850
Wire Wire Line
	12350 3850 12350 3950
Connection ~ 12350 3850
Wire Wire Line
	10650 3850 10650 3950
Connection ~ 10650 3850
Wire Wire Line
	10350 3850 10350 3950
Connection ~ 10350 3850
Wire Wire Line
	8650 3850 8650 3950
Connection ~ 8650 3850
Wire Wire Line
	8350 3850 8350 3950
Connection ~ 8350 3850
Wire Wire Line
	6650 3850 6650 3950
Connection ~ 6650 3850
Wire Wire Line
	6350 3850 6350 3950
Connection ~ 6350 3850
Wire Wire Line
	4650 3850 4650 3950
Connection ~ 4650 3850
Wire Wire Line
	4350 3850 4350 3950
Connection ~ 4350 3850
Wire Wire Line
	2650 3850 2650 3950
Connection ~ 2650 3850
Wire Wire Line
	2350 3850 2350 3950
Connection ~ 2350 3850
Wire Wire Line
	650  3850 650  3950
Connection ~ 650  3850
$Comp
L Device:CP1 C1
U 1 1 61DC106F
P 2450 6400
F 0 "C1" H 2565 6446 50  0000 L CNN
F 1 "2200µF" H 2565 6355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D13.0mm_P5.00mm" H 2450 6400 50  0001 C CNN
F 3 "~" H 2450 6400 50  0001 C CNN
F 4 "710-860040378015" H 2450 6400 50  0001 C CNN "Mouser"
	1    2450 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 6250 2450 6250
Wire Wire Line
	2450 6250 2750 6250
Connection ~ 2450 6250
Wire Wire Line
	2450 6550 1850 6550
Connection ~ 1850 6550
Text Notes 2550 6600 0    50   ~ 0
16V
$Comp
L Connector:Screw_Terminal_01x02 J12
U 1 1 61DF9BC2
P 900 5850
F 0 "J12" H 818 6067 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 818 5976 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 900 5850 50  0001 C CNN
F 3 "~" H 900 5850 50  0001 C CNN
	1    900  5850
	-1   0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0115
U 1 1 61E0D617
P 1100 5850
F 0 "#PWR0115" H 1100 5700 50  0001 C CNN
F 1 "+12V" V 1115 5978 50  0000 L CNN
F 2 "" H 1100 5850 50  0001 C CNN
F 3 "" H 1100 5850 50  0001 C CNN
	1    1100 5850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 61E0E9C5
P 1100 5950
F 0 "#PWR0116" H 1100 5700 50  0001 C CNN
F 1 "GND" V 1105 5822 50  0000 R CNN
F 2 "" H 1100 5950 50  0001 C CNN
F 3 "" H 1100 5950 50  0001 C CNN
	1    1100 5950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1950 7050 3650 7050
Wire Wire Line
	1050 8500 950  8500
Wire Wire Line
	950  8500 950  10050
Wire Wire Line
	950  10050 2850 10050
Wire Wire Line
	2850 10050 2850 7700
Wire Wire Line
	2850 7700 3150 7700
$EndSCHEMATC