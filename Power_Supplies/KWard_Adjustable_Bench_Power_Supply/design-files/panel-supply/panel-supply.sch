EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "KWard Bench PSU - Panel meter supply"
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
U 1 1 641B17A4
P 1750 4500
F 0 "J1" H 1668 4717 50  0000 C CNN
F 1 "12.6VAC input" H 1668 4626 50  0000 C CNN
F 2 "TerminalBlock_TE-Connectivity:TerminalBlock_TE_282834-2_1x02_P2.54mm_Horizontal" H 1750 4500 50  0001 C CNN
F 3 "~" H 1750 4500 50  0001 C CNN
	1    1750 4500
	-1   0    0    1   
$EndComp
$Comp
L jrt-ICs:DB10x D1
U 1 1 641C3084
P 2800 4450
F 0 "D1" H 2950 4750 50  0000 L CNN
F 1 "DB101" H 2950 4650 50  0000 L CNN
F 2 "Diodes_THT:Diode_Bridge_DIP-4_W7.62mm_P5.08mm" H 2800 4450 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/345/db101s-1012s-17410.pdf" H 2800 4450 50  0001 C CNN
	1    2800 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 4400 2150 4400
Wire Wire Line
	2150 4400 2150 4150
Wire Wire Line
	2150 4150 2800 4150
Wire Wire Line
	1950 4500 2150 4500
Wire Wire Line
	2150 4500 2150 4750
Wire Wire Line
	2150 4750 2800 4750
$Comp
L Device:CP1 C1
U 1 1 641C5CA9
P 3400 4600
F 0 "C1" H 3515 4646 50  0000 L CNN
F 1 "2200µF" H 3515 4555 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D12.5mm_P5.00mm" H 3400 4600 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/129/RJH-4600.pdf" H 3400 4600 50  0001 C CNN
F 4 "555-RJH-25V222MI9#" H 3400 4600 50  0001 C CNN "Mouser"
	1    3400 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4450 2500 4900
Wire Wire Line
	2500 4900 3400 4900
Wire Wire Line
	3400 4900 3400 4750
Wire Wire Line
	3100 4450 3400 4450
Text Notes 3500 4800 0    50   ~ 0
25V
$Comp
L Regulator_Linear:LM2937xT U1
U 1 1 641C7498
P 4100 4450
F 0 "U1" H 4100 4692 50  0000 C CNN
F 1 "LM2940" H 4100 4601 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4100 4675 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2937.pdf" H 4100 4400 50  0001 C CNN
	1    4100 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 4450 3800 4450
Connection ~ 3400 4450
Wire Wire Line
	4100 4750 4100 4900
Wire Wire Line
	4100 4900 3400 4900
Connection ~ 3400 4900
$Comp
L Device:CP1 C2
U 1 1 641C9B64
P 4650 4600
F 0 "C2" H 4765 4646 50  0000 L CNN
F 1 "220µF" H 4765 4555 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 4650 4600 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/977/e_YXS-1600637.pdf" H 4650 4600 50  0001 C CNN
F 4 "25YXS220MEFC6.3X11" H 4650 4600 50  0001 C CNN "Mouser"
	1    4650 4600
	1    0    0    -1  
$EndComp
Text Notes 4750 4800 0    50   ~ 0
25V
Wire Wire Line
	4650 4750 4650 4900
Wire Wire Line
	4650 4900 4100 4900
Connection ~ 4100 4900
Wire Wire Line
	4400 4450 4650 4450
$Comp
L jrt-ICs:MEE1SxxxxDC U2
U 1 1 641DF49E
P 5950 3850
F 0 "U2" V 5996 3620 50  0000 R CNN
F 1 "MEE1S12xxDC" V 5905 3620 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5950 3850 50  0001 C CNN
F 3 "" H 5950 3850 50  0001 C CNN
	1    5950 3850
	0    -1   -1   0   
$EndComp
$Comp
L jrt-ICs:MEE1SxxxxDC U3
U 1 1 641E07F9
P 6950 3850
F 0 "U3" V 6996 3620 50  0000 R CNN
F 1 "MEE1S12xxDC" V 6905 3620 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 6950 3850 50  0001 C CNN
F 3 "" H 6950 3850 50  0001 C CNN
	1    6950 3850
	0    -1   -1   0   
$EndComp
$Comp
L jrt-ICs:MEE1SxxxxDC U4
U 1 1 641E0D9C
P 7950 3850
F 0 "U4" V 7996 3620 50  0000 R CNN
F 1 "MEE1S12xxDC" V 7905 3620 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 7950 3850 50  0001 C CNN
F 3 "" H 7950 3850 50  0001 C CNN
	1    7950 3850
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 641E4A71
P 5000 3000
F 0 "J2" V 5350 3050 50  0000 R CNN
F 1 "12V DC fan" V 5250 3050 50  0000 R CNN
F 2 "TerminalBlock_TE-Connectivity:TerminalBlock_TE_282834-2_1x02_P2.54mm_Horizontal" H 5000 3000 50  0001 C CNN
F 3 "~" H 5000 3000 50  0001 C CNN
	1    5000 3000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 641E5FA1
P 5000 4100
F 0 "R1" H 5070 4146 50  0000 L CNN
F 1 "R" H 5070 4055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P2.54mm_Vertical" V 4930 4100 50  0001 C CNN
F 3 "~" H 5000 4100 50  0001 C CNN
	1    5000 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4450 5000 4450
Wire Wire Line
	5000 4450 5000 4250
Connection ~ 4650 4450
Wire Wire Line
	5000 3950 5000 3200
Wire Wire Line
	4650 4900 5400 4900
Wire Wire Line
	8050 4900 8050 4250
Connection ~ 4650 4900
Wire Wire Line
	5100 3200 5400 3200
Wire Wire Line
	5400 3200 5400 4900
Connection ~ 5400 4900
Wire Wire Line
	5400 4900 6050 4900
Wire Wire Line
	5000 4450 5850 4450
Wire Wire Line
	7850 4450 7850 4250
Connection ~ 5000 4450
Wire Wire Line
	5850 4250 5850 4450
Connection ~ 5850 4450
Wire Wire Line
	5850 4450 6850 4450
Wire Wire Line
	6850 4250 6850 4450
Connection ~ 6850 4450
Wire Wire Line
	6850 4450 7850 4450
Wire Wire Line
	6050 4250 6050 4900
Connection ~ 6050 4900
Wire Wire Line
	6050 4900 7050 4900
Wire Wire Line
	7050 4250 7050 4900
Connection ~ 7050 4900
Wire Wire Line
	7050 4900 8050 4900
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 641E942C
P 5900 3000
F 0 "J3" V 6250 3050 50  0000 R CNN
F 1 "B+ voltage meter" V 6150 3050 50  0000 R CNN
F 2 "TerminalBlock_TE-Connectivity:TerminalBlock_TE_282834-2_1x02_P2.54mm_Horizontal" H 5900 3000 50  0001 C CNN
F 3 "~" H 5900 3000 50  0001 C CNN
	1    5900 3000
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 641E97BD
P 6900 3000
F 0 "J4" V 7250 3050 50  0000 R CNN
F 1 "B+ current meter" V 7150 3050 50  0000 R CNN
F 2 "TerminalBlock_TE-Connectivity:TerminalBlock_TE_282834-2_1x02_P2.54mm_Horizontal" H 6900 3000 50  0001 C CNN
F 3 "~" H 6900 3000 50  0001 C CNN
	1    6900 3000
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 641E9B02
P 7900 3000
F 0 "J5" V 8250 3050 50  0000 R CNN
F 1 "C- voltage meter" V 8150 3050 50  0000 R CNN
F 2 "TerminalBlock_TE-Connectivity:TerminalBlock_TE_282834-2_1x02_P2.54mm_Horizontal" H 7900 3000 50  0001 C CNN
F 3 "~" H 7900 3000 50  0001 C CNN
	1    7900 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5850 3450 5850 3200
Wire Wire Line
	5850 3200 5900 3200
Wire Wire Line
	6000 3200 6050 3200
Wire Wire Line
	6050 3200 6050 3450
Wire Wire Line
	6850 3450 6850 3200
Wire Wire Line
	6850 3200 6900 3200
Wire Wire Line
	7000 3200 7050 3200
Wire Wire Line
	7050 3200 7050 3450
Wire Wire Line
	7850 3450 7850 3200
Wire Wire Line
	7850 3200 7900 3200
Wire Wire Line
	8000 3200 8050 3200
Wire Wire Line
	8050 3200 8050 3450
Text Notes 5950 5450 0    50   ~ 0
Choose the appropriate MEE1-series DC-DC converter\nfor the voltage requirements of your panel meters.  If any\nof your meters are capable of runing at 12Vdc, then simply\ninstall jumpers between the appropriate pins of DC-DC\nconverter footprint(s).
Text Notes 3050 3950 0    50   ~ 0
Choose a resistor appropriate your your 12Vdc\nfan if you wish to limit the current or drop some\nof the voltage, or use a jumper if no resistor is\nneeded.
Text Notes 2900 5200 0    50   ~ 0
ESR of the output capacitor is critical, and must be in the range\nof 100mOhm - 1Ohm.  Part selected is Rubycon 25YXS220MEFC6.3X11.
Text Notes 1550 4950 0    50   Italic 10
Triad F5-12
$EndSCHEMATC
