EESchema Schematic File Version 4
LIBS:RAdLib-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 3 3
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
L power:VCC #PWR0115
U 1 1 5D9B7094
P 5950 1200
F 0 "#PWR0115" H 5950 1050 50  0001 C CNN
F 1 "VCC" H 5967 1373 50  0000 C CNN
F 2 "" H 5950 1200 50  0001 C CNN
F 3 "" H 5950 1200 50  0001 C CNN
	1    5950 1200
	1    0    0    -1  
$EndComp
NoConn ~ 6550 1350
$Comp
L power:GND #PWR0116
U 1 1 5D9BF588
P 5950 3950
F 0 "#PWR0116" H 5950 3700 50  0001 C CNN
F 1 "GND" H 5955 3777 50  0000 C CNN
F 2 "" H 5950 3950 50  0001 C CNN
F 3 "" H 5950 3950 50  0001 C CNN
	1    5950 3950
	1    0    0    -1  
$EndComp
Text GLabel 7300 2900 2    50   Output ~ 0
~CS
$Comp
L power:+5V #PWR0117
U 1 1 5D9C4FC5
P 6250 1200
F 0 "#PWR0117" H 6250 1050 50  0001 C CNN
F 1 "+5V" H 6265 1373 50  0000 C CNN
F 2 "" H 6250 1200 50  0001 C CNN
F 3 "" H 6250 1200 50  0001 C CNN
	1    6250 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 1350 6250 1200
Wire Wire Line
	5950 1350 5950 1200
$Comp
L power:+3V3 #PWR0118
U 1 1 5D9C5C6B
P 6450 1200
F 0 "#PWR0118" H 6450 1050 50  0001 C CNN
F 1 "+3V3" H 6465 1373 50  0000 C CNN
F 2 "" H 6450 1200 50  0001 C CNN
F 3 "" H 6450 1200 50  0001 C CNN
	1    6450 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 1350 6450 1200
Text GLabel 5400 1750 0    50   Output ~ 0
UART_TXD
Text GLabel 5400 1850 0    50   Input ~ 0
UART_RXD
Text GLabel 7300 2050 2    50   BiDi ~ 0
I2C_SDA
Text GLabel 7300 2150 2    50   Output ~ 0
I2C_SCL
$Comp
L Memory_EEPROM:M24C01-FDW U204
U 1 1 5D9C9C61
P 8550 1550
F 0 "U204" H 8950 2050 50  0000 C CNN
F 1 "M24C01-FDW" H 8950 1950 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 8550 1900 50  0001 C CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/b0/d8/50/40/5a/85/49/6f/DM00071904.pdf/files/DM00071904.pdf/jcr:content/translations/en.DM00071904.pdf" H 8600 1050 50  0001 C CNN
	1    8550 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0119
U 1 1 5D9CFA52
P 8550 1250
F 0 "#PWR0119" H 8550 1100 50  0001 C CNN
F 1 "+3V3" H 8565 1423 50  0000 C CNN
F 2 "" H 8550 1250 50  0001 C CNN
F 3 "" H 8550 1250 50  0001 C CNN
	1    8550 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1650 8150 1550
Wire Wire Line
	8150 1550 8150 1450
Connection ~ 8150 1550
$Comp
L power:GND #PWR0120
U 1 1 5D9D0A33
P 8150 1450
F 0 "#PWR0120" H 8150 1200 50  0001 C CNN
F 1 "GND" V 8155 1322 50  0000 R CNN
F 2 "" H 8150 1450 50  0001 C CNN
F 3 "" H 8150 1450 50  0001 C CNN
	1    8150 1450
	0    1    1    0   
$EndComp
Connection ~ 8150 1450
$Comp
L power:GND #PWR0121
U 1 1 5D9D0FA8
P 8550 1850
F 0 "#PWR0121" H 8550 1600 50  0001 C CNN
F 1 "GND" H 8555 1677 50  0000 C CNN
F 2 "" H 8550 1850 50  0001 C CNN
F 3 "" H 8550 1850 50  0001 C CNN
	1    8550 1850
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP1
U 1 1 5D9D19EA
P 9550 1800
F 0 "JP1" H 9550 1911 50  0000 C CNN
F 1 "Jumper_3_Bridged12" H 9550 2002 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9550 1800 50  0001 C CNN
F 3 "~" H 9550 1800 50  0001 C CNN
	1    9550 1800
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5D9D43E4
P 9800 1800
F 0 "#PWR0122" H 9800 1550 50  0001 C CNN
F 1 "GND" V 9805 1672 50  0000 R CNN
F 2 "" H 9800 1800 50  0001 C CNN
F 3 "" H 9800 1800 50  0001 C CNN
	1    9800 1800
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR0123
U 1 1 5D9D49BD
P 9300 1800
F 0 "#PWR0123" H 9300 1650 50  0001 C CNN
F 1 "+3V3" V 9315 1928 50  0000 L CNN
F 2 "" H 9300 1800 50  0001 C CNN
F 3 "" H 9300 1800 50  0001 C CNN
	1    9300 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8950 1650 9550 1650
$Comp
L Connector:Screw_Terminal_01x03 J2
U 1 1 5D9D9B0E
P 8900 3650
F 0 "J2" V 8772 3830 50  0000 L CNN
F 1 "UART_Header" V 8863 3830 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 8900 3650 50  0001 C CNN
F 3 "~" H 8900 3650 50  0001 C CNN
	1    8900 3650
	0    1    1    0   
$EndComp
Text GLabel 9100 3350 1    50   Input ~ 0
UART_TXD
Text GLabel 8900 3350 1    50   Output ~ 0
UART_RXD
$Comp
L power:GND #PWR0124
U 1 1 5D9DB25E
P 8700 3350
F 0 "#PWR0124" H 8700 3100 50  0001 C CNN
F 1 "GND" H 8705 3177 50  0000 C CNN
F 2 "" H 8700 3350 50  0001 C CNN
F 3 "" H 8700 3350 50  0001 C CNN
	1    8700 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	8900 3450 8900 3350
Wire Wire Line
	9000 3450 9000 3400
Wire Wire Line
	9000 3400 9100 3400
Wire Wire Line
	9100 3400 9100 3350
Wire Wire Line
	8800 3450 8800 3400
Wire Wire Line
	8800 3400 8700 3400
Wire Wire Line
	8700 3400 8700 3350
$Comp
L Connector:Screw_Terminal_01x03 J3
U 1 1 5D9DD1CF
P 8900 4400
F 0 "J3" V 8772 4580 50  0000 L CNN
F 1 "Power_Output_Header" V 8863 4580 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 8900 4400 50  0001 C CNN
F 3 "~" H 8900 4400 50  0001 C CNN
	1    8900 4400
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0125
U 1 1 5D9DDE6F
P 9100 4100
F 0 "#PWR0125" H 9100 3950 50  0001 C CNN
F 1 "+5V" H 9115 4273 50  0000 C CNN
F 2 "" H 9100 4100 50  0001 C CNN
F 3 "" H 9100 4100 50  0001 C CNN
	1    9100 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0126
U 1 1 5D9DE39E
P 8900 4100
F 0 "#PWR0126" H 8900 3950 50  0001 C CNN
F 1 "+3V3" H 8915 4273 50  0000 C CNN
F 2 "" H 8900 4100 50  0001 C CNN
F 3 "" H 8900 4100 50  0001 C CNN
	1    8900 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 5D9DE66E
P 8700 4100
F 0 "#PWR0127" H 8700 3850 50  0001 C CNN
F 1 "GND" H 8705 3927 50  0000 C CNN
F 2 "" H 8700 4100 50  0001 C CNN
F 3 "" H 8700 4100 50  0001 C CNN
	1    8700 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	9000 4200 9000 4150
Wire Wire Line
	9000 4150 9100 4150
Wire Wire Line
	9100 4150 9100 4100
Wire Wire Line
	8900 4200 8900 4100
Wire Wire Line
	8800 4200 8800 4150
Wire Wire Line
	8800 4150 8700 4150
Wire Wire Line
	8700 4150 8700 4100
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 5D9E0DC6
P 8950 5300
F 0 "J4" V 8822 5380 50  0000 L CNN
F 1 "I2C_Header" V 8913 5380 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 8950 5300 50  0001 C CNN
F 3 "~" H 8950 5300 50  0001 C CNN
	1    8950 5300
	0    1    1    0   
$EndComp
Text GLabel 9050 5000 1    50   BiDi ~ 0
I2C_SDA
Text GLabel 8750 5000 1    50   Input ~ 0
I2C_SCL
Wire Wire Line
	8950 5100 8950 5050
Wire Wire Line
	8950 5050 9050 5050
Wire Wire Line
	9050 5050 9050 5000
Wire Wire Line
	8850 5100 8850 5050
Wire Wire Line
	8850 5050 8750 5050
Wire Wire Line
	8750 5050 8750 5000
Text GLabel 7300 1750 2    50   BiDi ~ 0
ID_SDA
Text GLabel 7300 1850 2    50   Output ~ 0
ID_SCL
Text GLabel 9050 1350 2    50   BiDi ~ 0
ID_SDA
Text GLabel 9050 1550 2    50   Input ~ 0
ID_SCL
Wire Wire Line
	8950 1550 9050 1550
Wire Wire Line
	8950 1450 8950 1350
Wire Wire Line
	8950 1350 9050 1350
Text GLabel 5400 2650 0    50   Output ~ 0
A0
Text GLabel 5400 3100 0    50   Output ~ 0
~RST
Text GLabel 7300 2450 2    50   BiDi ~ 0
D0
Text GLabel 7300 2550 2    50   BiDi ~ 0
D1
Text GLabel 7300 3450 2    50   BiDi ~ 0
D2
Text GLabel 5400 2450 0    50   BiDi ~ 0
D3
Text GLabel 5400 3250 0    50   BiDi ~ 0
D4
Text GLabel 7300 3350 2    50   BiDi ~ 0
D5
Text GLabel 5400 2050 0    50   BiDi ~ 0
D6
Text GLabel 5400 2550 0    50   BiDi ~ 0
D7
Connection ~ 6250 1350
Wire Wire Line
	6150 1350 6250 1350
Wire Wire Line
	6150 1350 5950 1350
Connection ~ 6150 1350
$Comp
L Connector:Raspberry_Pi_2_3 J1
U 1 1 5D9AABF5
P 6350 2650
F 0 "J1" H 6350 4550 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 6350 4450 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x20_P2.54mm_Vertical" H 6350 2650 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 6350 2650 50  0001 C CNN
	1    6350 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3450 7300 3450
Wire Wire Line
	7150 2450 7300 2450
Wire Wire Line
	7150 2550 7300 2550
Wire Wire Line
	5550 2450 5400 2450
Wire Wire Line
	5550 3250 5400 3250
Wire Wire Line
	7150 1750 7300 1750
Wire Wire Line
	7150 1850 7300 1850
Wire Wire Line
	7150 2050 7300 2050
Wire Wire Line
	7150 2150 7300 2150
Wire Wire Line
	5550 1750 5400 1750
Wire Wire Line
	5550 1850 5400 1850
Text GLabel 7300 2750 2    50   Output ~ 0
READ
$Comp
L 74xx:74HC04 U101
U 4 1 5DA5D1AF
P 6400 4900
F 0 "U101" H 6400 5217 50  0000 C CNN
F 1 "74AHCT04" H 6400 5126 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6400 4900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6400 4900 50  0001 C CNN
	4    6400 4900
	1    0    0    -1  
$EndComp
Text GLabel 6100 4900 0    50   Input ~ 0
~OPL_WR
Text GLabel 6700 4900 2    50   Output ~ 0
~OPL_RD
Wire Wire Line
	7150 3350 7300 3350
Wire Wire Line
	5550 2550 5400 2550
Wire Wire Line
	5550 2650 5400 2650
Wire Wire Line
	5550 2050 5400 2050
Wire Wire Line
	7150 2750 7300 2750
Text GLabel 7300 3150 2    50   Input ~ 0
IRQ
Wire Wire Line
	7300 3150 7150 3150
NoConn ~ 7150 3050
NoConn ~ 7150 2950
NoConn ~ 5550 3050
NoConn ~ 5550 2950
NoConn ~ 5550 2850
NoConn ~ 5550 2250
NoConn ~ 5550 2150
NoConn ~ 5550 3350
NoConn ~ 7150 2350
Wire Wire Line
	6650 3950 6550 3950
Wire Wire Line
	6550 3950 6450 3950
Connection ~ 6550 3950
Wire Wire Line
	6450 3950 6350 3950
Connection ~ 6450 3950
Wire Wire Line
	6350 3950 6250 3950
Connection ~ 6350 3950
Wire Wire Line
	6250 3950 6150 3950
Connection ~ 6250 3950
Wire Wire Line
	6150 3950 6050 3950
Connection ~ 6150 3950
Wire Wire Line
	6050 3950 5950 3950
Connection ~ 6050 3950
Connection ~ 5950 3950
Wire Wire Line
	7150 2850 7250 2850
Wire Wire Line
	7250 2850 7250 2900
Wire Wire Line
	7250 2900 7300 2900
Wire Wire Line
	5550 3150 5450 3150
Wire Wire Line
	5450 3150 5450 3100
Wire Wire Line
	5450 3100 5400 3100
Text GLabel 3250 1550 0    50   Output ~ 0
OPL_D0
Text GLabel 3250 1650 0    50   Output ~ 0
OPL_D1
Text GLabel 3250 1750 0    50   Output ~ 0
OPL_D2
Text GLabel 3250 1850 0    50   Output ~ 0
OPL_D3
Text GLabel 3250 1950 0    50   Output ~ 0
OPL_D4
Text GLabel 3250 2050 0    50   Output ~ 0
OPL_D5
Text GLabel 3250 2150 0    50   Output ~ 0
OPL_D6
Text GLabel 3250 2250 0    50   Output ~ 0
OPL_D7
$Comp
L 74xx:74LS125 U203
U 1 1 5DB4BD13
P 3700 4050
F 0 "U203" H 3700 4367 50  0000 C CNN
F 1 "74AHCT125" H 3700 4276 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 3700 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS125" H 3700 4050 50  0001 C CNN
	1    3700 4050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS125 U203
U 2 1 5DB4F55B
P 3700 4750
F 0 "U203" H 3700 5067 50  0000 C CNN
F 1 "74AHCT125" H 3700 4976 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 3700 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS125" H 3700 4750 50  0001 C CNN
	2    3700 4750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS125 U203
U 3 1 5DB5069A
P 3700 5450
F 0 "U203" H 3700 5767 50  0000 C CNN
F 1 "74AHCT125" H 3700 5676 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 3700 5450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS125" H 3700 5450 50  0001 C CNN
	3    3700 5450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS125 U203
U 4 1 5DB50D8E
P 3700 6150
F 0 "U203" H 3700 6467 50  0000 C CNN
F 1 "74AHCT125" H 3700 6376 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 3700 6150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS125" H 3700 6150 50  0001 C CNN
	4    3700 6150
	1    0    0    -1  
$EndComp
Text GLabel 3400 4050 0    50   Input ~ 0
A0
Text GLabel 3400 4750 0    50   Input ~ 0
READ
Text GLabel 4000 4050 2    50   Output ~ 0
OPL_A0
Text GLabel 4000 4750 2    50   Output ~ 0
~OPL_WR
Text GLabel 2050 1550 2    50   Output ~ 0
D0
Text GLabel 2050 1650 2    50   Output ~ 0
D1
Text GLabel 2050 1750 2    50   Output ~ 0
D2
Text GLabel 2050 1850 2    50   Output ~ 0
D3
Text GLabel 2050 1950 2    50   Output ~ 0
D4
Text GLabel 2050 2050 2    50   Output ~ 0
D5
Text GLabel 2050 2150 2    50   Output ~ 0
D6
Text GLabel 2050 2250 2    50   Output ~ 0
D7
Text GLabel 1050 1550 0    50   Input ~ 0
OPL_D0
Text GLabel 1050 1650 0    50   Input ~ 0
OPL_D1
Text GLabel 1050 1750 0    50   Input ~ 0
OPL_D2
Text GLabel 1050 1850 0    50   Input ~ 0
OPL_D3
Text GLabel 1050 1950 0    50   Input ~ 0
OPL_D4
Text GLabel 1050 2050 0    50   Input ~ 0
OPL_D5
Text GLabel 1050 2150 0    50   Input ~ 0
OPL_D6
Text GLabel 1050 2250 0    50   Input ~ 0
OPL_D7
$Comp
L power:+3V3 #PWR0128
U 1 1 5DC29367
P 1550 1250
F 0 "#PWR0128" H 1550 1100 50  0001 C CNN
F 1 "+3V3" H 1565 1423 50  0000 C CNN
F 2 "" H 1550 1250 50  0001 C CNN
F 3 "" H 1550 1250 50  0001 C CNN
	1    1550 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 5DC29ABE
P 1550 2850
F 0 "#PWR0129" H 1550 2600 50  0001 C CNN
F 1 "GND" H 1555 2677 50  0000 C CNN
F 2 "" H 1550 2850 50  0001 C CNN
F 3 "" H 1550 2850 50  0001 C CNN
	1    1550 2850
	1    0    0    -1  
$EndComp
Text GLabel 950  2550 0    50   Input ~ 0
~OPL_RD
$Comp
L Device:R R201
U 1 1 5DC2DA27
P 1050 2800
F 0 "R201" H 1120 2846 50  0000 L CNN
F 1 "4.7K" H 1120 2755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 980 2800 50  0001 C CNN
F 3 "~" H 1050 2800 50  0001 C CNN
F 4 "Xicon 270-4.7K/REEL-RC" H 1050 2800 50  0001 C CNN "Part"
	1    1050 2800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0130
U 1 1 5DC34A75
P 1050 2950
F 0 "#PWR0130" H 1050 2800 50  0001 C CNN
F 1 "VCC" H 1068 3123 50  0000 C CNN
F 2 "" H 1050 2950 50  0001 C CNN
F 3 "" H 1050 2950 50  0001 C CNN
	1    1050 2950
	-1   0    0    1   
$EndComp
Text GLabel 4250 1550 2    50   Input ~ 0
D0
Text GLabel 4250 1650 2    50   Input ~ 0
D1
Text GLabel 4250 1750 2    50   Input ~ 0
D2
Text GLabel 4250 1850 2    50   Input ~ 0
D3
Text GLabel 4250 1950 2    50   Input ~ 0
D4
Text GLabel 4250 2050 2    50   Input ~ 0
D5
Text GLabel 4250 2150 2    50   Input ~ 0
D6
Text GLabel 4250 2250 2    50   Input ~ 0
D7
$Comp
L power:+3V3 #PWR0131
U 1 1 5DC89778
P 1050 2450
F 0 "#PWR0131" H 1050 2300 50  0001 C CNN
F 1 "+3V3" V 1065 2578 50  0000 L CNN
F 2 "" H 1050 2450 50  0001 C CNN
F 3 "" H 1050 2450 50  0001 C CNN
	1    1050 2450
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74HC245 U202
U 1 1 5DC8D977
P 3750 2050
F 0 "U202" H 3900 2850 50  0000 C CNN
F 1 "74HCT245" H 3950 2750 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 3750 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 3750 2050 50  0001 C CNN
	1    3750 2050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0132
U 1 1 5DC90FA6
P 3750 1250
F 0 "#PWR0132" H 3750 1100 50  0001 C CNN
F 1 "VCC" H 3767 1423 50  0000 C CNN
F 2 "" H 3750 1250 50  0001 C CNN
F 3 "" H 3750 1250 50  0001 C CNN
	1    3750 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 5DC9149F
P 3750 2850
F 0 "#PWR0133" H 3750 2600 50  0001 C CNN
F 1 "GND" H 3755 2677 50  0000 C CNN
F 2 "" H 3750 2850 50  0001 C CNN
F 3 "" H 3750 2850 50  0001 C CNN
	1    3750 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 5DC91C2C
P 3250 2450
F 0 "#PWR0134" H 3250 2200 50  0001 C CNN
F 1 "GND" V 3255 2322 50  0000 R CNN
F 2 "" H 3250 2450 50  0001 C CNN
F 3 "" H 3250 2450 50  0001 C CNN
	1    3250 2450
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC245 U201
U 1 1 5DC93089
P 1550 2050
F 0 "U201" H 1800 2850 50  0000 C CNN
F 1 "74LVC245A" H 1800 2750 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 1550 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 1550 2050 50  0001 C CNN
	1    1550 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  2550 1050 2550
Wire Wire Line
	1050 2550 1050 2650
Connection ~ 1050 2550
Text Notes 950  950  0    50   Italic 0
Level-shift OPL to Raspberry Pi\n(register reads)
Text Notes 3100 950  0    50   Italic 0
Level-shift Raspberry Pi to OPL\n(register writes)
$Comp
L Device:R R202
U 1 1 5DCAA178
P 3250 2800
F 0 "R202" H 3320 2846 50  0000 L CNN
F 1 "4.7K" H 3320 2755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 3180 2800 50  0001 C CNN
F 3 "~" H 3250 2800 50  0001 C CNN
F 4 "Xicon 270-4.7K/REEL-RC" H 3250 2800 50  0001 C CNN "Part"
	1    3250 2800
	1    0    0    -1  
$EndComp
Text GLabel 3150 2550 0    50   Input ~ 0
~OPL_WR
Wire Wire Line
	3150 2550 3250 2550
Wire Wire Line
	3250 2650 3250 2550
Connection ~ 3250 2550
$Comp
L power:VCC #PWR0135
U 1 1 5DCB12D8
P 3250 2950
F 0 "#PWR0135" H 3250 2800 50  0001 C CNN
F 1 "VCC" H 3268 3123 50  0000 C CNN
F 2 "" H 3250 2950 50  0001 C CNN
F 3 "" H 3250 2950 50  0001 C CNN
	1    3250 2950
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS125 U203
U 5 1 5DCCCFE6
P 3700 7250
F 0 "U203" H 3930 7296 50  0000 L CNN
F 1 "74AHCT125" H 3930 7205 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 3700 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS125" H 3700 7250 50  0001 C CNN
	5    3700 7250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0136
U 1 1 5DCD0443
P 3700 6750
F 0 "#PWR0136" H 3700 6600 50  0001 C CNN
F 1 "VCC" H 3717 6923 50  0000 C CNN
F 2 "" H 3700 6750 50  0001 C CNN
F 3 "" H 3700 6750 50  0001 C CNN
	1    3700 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0137
U 1 1 5DCD09A2
P 3700 7750
F 0 "#PWR0137" H 3700 7500 50  0001 C CNN
F 1 "GND" H 3705 7577 50  0000 C CNN
F 2 "" H 3700 7750 50  0001 C CNN
F 3 "" H 3700 7750 50  0001 C CNN
	1    3700 7750
	1    0    0    -1  
$EndComp
Text GLabel 3400 5450 0    50   Input ~ 0
~CS
Text GLabel 4000 5450 2    50   Output ~ 0
~OPL_CS
Text GLabel 3400 6150 0    50   Input ~ 0
~RST
Text GLabel 4000 6150 2    50   Output ~ 0
~OPL_RST
Wire Wire Line
	3700 4300 3050 4300
Wire Wire Line
	3050 4300 3050 5000
Wire Wire Line
	3050 6400 3700 6400
Wire Wire Line
	3700 5700 3050 5700
Connection ~ 3050 5700
Wire Wire Line
	3050 5700 3050 6400
Wire Wire Line
	3700 5000 3050 5000
Connection ~ 3050 5000
Wire Wire Line
	3050 5000 3050 5700
$Comp
L power:GND #PWR0138
U 1 1 5DCDBB6A
P 3050 6400
F 0 "#PWR0138" H 3050 6150 50  0001 C CNN
F 1 "GND" H 3055 6227 50  0000 C CNN
F 2 "" H 3050 6400 50  0001 C CNN
F 3 "" H 3050 6400 50  0001 C CNN
	1    3050 6400
	1    0    0    -1  
$EndComp
Connection ~ 3050 6400
Text GLabel 6100 5750 0    50   Input ~ 0
~OPL_IRQ
$Comp
L 74xx:74HC04 U101
U 5 1 5DCDD39D
P 6400 5750
F 0 "U101" H 6400 6067 50  0000 C CNN
F 1 "74AHCT04" H 6400 5976 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6400 5750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6400 5750 50  0001 C CNN
	5    6400 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R203
U 1 1 5DCDEB3B
P 6700 5900
F 0 "R203" H 6770 5946 50  0000 L CNN
F 1 "2.2K" H 6770 5855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6630 5900 50  0001 C CNN
F 3 "~" H 6700 5900 50  0001 C CNN
F 4 "Xicon 270-2.2K/REEL-RC" H 6700 5900 50  0001 C CNN "Part"
	1    6700 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R204
U 1 1 5DCDF804
P 6700 6300
F 0 "R204" H 6770 6346 50  0000 L CNN
F 1 "3.3K" H 6770 6255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6630 6300 50  0001 C CNN
F 3 "~" H 6700 6300 50  0001 C CNN
F 4 "Xicon 270-3.3K-RC" H 6700 6300 50  0001 C CNN "Part"
	1    6700 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0139
U 1 1 5DCE303F
P 6700 6450
F 0 "#PWR0139" H 6700 6200 50  0001 C CNN
F 1 "GND" H 6705 6277 50  0000 C CNN
F 2 "" H 6700 6450 50  0001 C CNN
F 3 "" H 6700 6450 50  0001 C CNN
	1    6700 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 6050 6700 6100
Text GLabel 6950 6100 2    50   Output ~ 0
IRQ
Wire Wire Line
	6700 6100 6950 6100
Connection ~ 6700 6100
Wire Wire Line
	6700 6100 6700 6150
Text Notes 5800 5350 0    50   Italic 0
Invert IRQ signal and level-shift to 3V3.
Text Notes 3200 3650 0    50   Italic 0
Level-shift Raspberry Pi to OPL\n(control signals)
Text Notes 6150 4500 0    50   Italic 0
Generate ~RD
Text Notes 8150 950  0    50   Italic 0
Raspberry Pi HAT ID ROM
Text Notes 8350 2800 0    50   Italic 0
Convenience pass-through headers
Text Notes 5650 4350 0    50   Italic 0
U101 is defined in the Clock Source sheet.
$EndSCHEMATC
