EESchema Schematic File Version 4
LIBS:Stochastic sequencer v2-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L eurocad:EURO_PWR_2x5 J38
U 1 1 5E255D6E
P 1700 1450
F 0 "J38" H 1700 1897 60  0000 C CNN
F 1 "EURO_PWR_2x5" H 1700 1791 60  0000 C CNN
F 2 "Eurocad:Eurorack_power_header" H 1700 1450 60  0001 C CNN
F 3 "" H 1700 1450 60  0000 C CNN
	1    1700 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1350 2225 1350
Wire Wire Line
	1250 1350 1175 1350
Wire Wire Line
	1175 1550 1250 1550
Wire Wire Line
	1250 1450 1175 1450
$Comp
L power:GND #PWR0185
U 1 1 5E255ECF
P 1100 1450
F 0 "#PWR0185" H 1100 1200 50  0001 C CNN
F 1 "GND" V 1105 1322 50  0000 R CNN
F 2 "" H 1100 1450 50  0001 C CNN
F 3 "" H 1100 1450 50  0001 C CNN
	1    1100 1450
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0186
U 1 1 5E255EE4
P 2300 1450
F 0 "#PWR0186" H 2300 1200 50  0001 C CNN
F 1 "GND" V 2305 1322 50  0000 R CNN
F 2 "" H 2300 1450 50  0001 C CNN
F 3 "" H 2300 1450 50  0001 C CNN
	1    2300 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1250 1250 1175 1250
Wire Wire Line
	1175 1250 1175 875 
Wire Wire Line
	1175 875  1700 875 
Wire Wire Line
	2225 875  2225 1250
Wire Wire Line
	2225 1250 2150 1250
Wire Wire Line
	2150 1650 2225 1650
Wire Wire Line
	2225 1650 2225 1875
Wire Wire Line
	2225 1875 1700 1875
Wire Wire Line
	1175 1875 1175 1650
Wire Wire Line
	1175 1650 1250 1650
Wire Wire Line
	1700 875  1700 800 
Connection ~ 1700 875 
Wire Wire Line
	1700 875  2225 875 
Wire Wire Line
	1700 1875 1700 1975
Connection ~ 1700 1875
Wire Wire Line
	1700 1875 1175 1875
Text Label 1700 800  0    50   ~ 0
+12V_in
Text Label 1700 1975 0    50   ~ 0
-12V_in
$Comp
L Diode:1N4001 D9
U 1 1 5E2565A1
P 3500 1000
F 0 "D9" H 3500 784 50  0000 C CNN
F 1 "1N4001" H 3500 875 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P3.81mm_Vertical_AnodeUp" H 3500 825 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 3500 1000 50  0001 C CNN
	1    3500 1000
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4001 D10
U 1 1 5E256615
P 3500 1625
F 0 "D10" H 3500 1841 50  0000 C CNN
F 1 "1N4001" H 3500 1750 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P3.81mm_Vertical_AnodeUp" H 3500 1450 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 3500 1625 50  0001 C CNN
	1    3500 1625
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C56
U 1 1 5E2566BA
P 4000 1175
F 0 "C56" H 4091 1221 50  0000 L CNN
F 1 "100uF" H 4091 1130 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4000 1175 50  0001 C CNN
F 3 "~" H 4000 1175 50  0001 C CNN
	1    4000 1175
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C57
U 1 1 5E2566FA
P 4000 1450
F 0 "C57" H 4091 1496 50  0000 L CNN
F 1 "100uF" H 4091 1405 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4000 1450 50  0001 C CNN
F 3 "~" H 4000 1450 50  0001 C CNN
	1    4000 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1000 4000 1000
Wire Wire Line
	4000 1000 4000 1075
Wire Wire Line
	4000 1275 4000 1300
Wire Wire Line
	4000 1550 4000 1625
Wire Wire Line
	4000 1625 3650 1625
Wire Wire Line
	3350 1000 3075 1000
Wire Wire Line
	3350 1625 3100 1625
Text Label 3075 1000 2    50   ~ 0
+12V_in
Text Label 3100 1625 2    50   ~ 0
-12V_in
Wire Wire Line
	4000 1300 4500 1300
Connection ~ 4000 1300
Wire Wire Line
	4000 1300 4000 1350
$Comp
L power:GND #PWR0187
U 1 1 5E257A54
P 4500 1300
F 0 "#PWR0187" H 4500 1050 50  0001 C CNN
F 1 "GND" V 4505 1172 50  0000 R CNN
F 2 "" H 4500 1300 50  0001 C CNN
F 3 "" H 4500 1300 50  0001 C CNN
	1    4500 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4000 1000 4525 1000
Connection ~ 4000 1000
Connection ~ 4000 1625
Wire Wire Line
	4000 1625 4525 1625
$Comp
L power:+12V #PWR0188
U 1 1 5E2586CB
P 4525 1000
F 0 "#PWR0188" H 4525 850 50  0001 C CNN
F 1 "+12V" V 4540 1128 50  0000 L CNN
F 2 "" H 4525 1000 50  0001 C CNN
F 3 "" H 4525 1000 50  0001 C CNN
	1    4525 1000
	0    1    1    0   
$EndComp
$Comp
L power:-12V #PWR0189
U 1 1 5E258718
P 4525 1625
F 0 "#PWR0189" H 4525 1725 50  0001 C CNN
F 1 "-12V" V 4540 1753 50  0000 L CNN
F 2 "" H 4525 1625 50  0001 C CNN
F 3 "" H 4525 1625 50  0001 C CNN
	1    4525 1625
	0    1    1    0   
$EndComp
$Comp
L Regulator_Linear:LM7805_TO220 U29
U 1 1 5E258ACF
P 6750 1800
F 0 "U29" H 6750 2042 50  0000 C CNN
F 1 "LM7805_TO220" H 6750 1951 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 6750 2025 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7805.pdf" H 6750 1750 50  0001 C CNN
	1    6750 1800
	1    0    0    -1  
$EndComp
Text Notes 5900 1200 0    50   ~ 0
Using the TO220 (1A) version to handle the potentially\nhigh power drawer from the addressible leds (up to ~50mA per LED)\n\nCap values copied from westlicht performer\n\nIf regulator choices seem wierd, that's because I'm restricting myself to what's available at tayda
$Comp
L Device:C_Small C58
U 1 1 5E2590D9
P 6250 2075
F 0 "C58" H 6342 2121 50  0000 L CNN
F 1 "100nF" H 6342 2030 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6250 2075 50  0001 C CNN
F 3 "~" H 6250 2075 50  0001 C CNN
	1    6250 2075
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C66
U 1 1 5E2591A3
P 7525 2075
F 0 "C66" H 7617 2121 50  0000 L CNN
F 1 "100nF" H 7617 2030 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7525 2075 50  0001 C CNN
F 3 "~" H 7525 2075 50  0001 C CNN
	1    7525 2075
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C62
U 1 1 5E25923E
P 7100 2075
F 0 "C62" H 7191 2121 50  0000 L CNN
F 1 "22uF" H 7191 2030 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7100 2075 50  0001 C CNN
F 3 "~" H 7100 2075 50  0001 C CNN
	1    7100 2075
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 2100 6750 2275
Wire Wire Line
	6250 2175 6250 2275
Wire Wire Line
	7100 2175 7100 2275
Wire Wire Line
	7525 2175 7525 2275
Wire Wire Line
	6250 1975 6250 1800
Wire Wire Line
	6250 1800 6450 1800
Wire Wire Line
	7050 1800 7100 1800
Wire Wire Line
	7100 1800 7100 1975
Wire Wire Line
	7100 1800 7525 1800
Wire Wire Line
	7525 1800 7525 1975
Connection ~ 7100 1800
Wire Wire Line
	6250 1800 5975 1800
Wire Wire Line
	5975 1800 5975 1725
Connection ~ 6250 1800
$Comp
L power:+12V #PWR0192
U 1 1 5E25BF5C
P 5975 1725
F 0 "#PWR0192" H 5975 1575 50  0001 C CNN
F 1 "+12V" H 5990 1898 50  0000 C CNN
F 2 "" H 5975 1725 50  0001 C CNN
F 3 "" H 5975 1725 50  0001 C CNN
	1    5975 1725
	1    0    0    -1  
$EndComp
Wire Wire Line
	7525 1800 7600 1800
Connection ~ 7525 1800
$Comp
L power:+5V #PWR0210
U 1 1 5E25C75F
P 7600 1800
F 0 "#PWR0210" H 7600 1650 50  0001 C CNN
F 1 "+5V" V 7615 1928 50  0000 L CNN
F 2 "" H 7600 1800 50  0001 C CNN
F 3 "" H 7600 1800 50  0001 C CNN
	1    7600 1800
	0    1    1    0   
$EndComp
$Comp
L Device:Ferrite_Bead FB1
U 1 1 5E25C88F
P 6050 4100
F 0 "FB1" V 5776 4100 50  0000 C CNN
F 1 "Ferrite_Bead" V 5867 4100 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5980 4100 50  0001 C CNN
F 3 "~" H 6050 4100 50  0001 C CNN
	1    6050 4100
	0    1    1    0   
$EndComp
$Comp
L Regulator_Linear:LM1117-3.3 U31
U 1 1 5E25D2BD
P 6750 4100
F 0 "U31" H 6750 4342 50  0000 C CNN
F 1 "LM1117-3.3" H 6750 4251 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 6750 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 6750 4100 50  0001 C CNN
	1    6750 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0194
U 1 1 5E25D5F4
P 6250 2275
F 0 "#PWR0194" H 6250 2025 50  0001 C CNN
F 1 "GND" H 6255 2102 50  0000 C CNN
F 2 "" H 6250 2275 50  0001 C CNN
F 3 "" H 6250 2275 50  0001 C CNN
	1    6250 2275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0198
U 1 1 5E25D636
P 6750 2275
F 0 "#PWR0198" H 6750 2025 50  0001 C CNN
F 1 "GND" H 6755 2102 50  0000 C CNN
F 2 "" H 6750 2275 50  0001 C CNN
F 3 "" H 6750 2275 50  0001 C CNN
	1    6750 2275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0202
U 1 1 5E25D657
P 7100 2275
F 0 "#PWR0202" H 7100 2025 50  0001 C CNN
F 1 "GND" H 7105 2102 50  0000 C CNN
F 2 "" H 7100 2275 50  0001 C CNN
F 3 "" H 7100 2275 50  0001 C CNN
	1    7100 2275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0206
U 1 1 5E25D678
P 7525 2275
F 0 "#PWR0206" H 7525 2025 50  0001 C CNN
F 1 "GND" H 7530 2102 50  0000 C CNN
F 2 "" H 7525 2275 50  0001 C CNN
F 3 "" H 7525 2275 50  0001 C CNN
	1    7525 2275
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0190
U 1 1 5E25DBC8
P 5650 3925
F 0 "#PWR0190" H 5650 3775 50  0001 C CNN
F 1 "+5V" H 5665 4098 50  0000 C CNN
F 2 "" H 5650 3925 50  0001 C CNN
F 3 "" H 5650 3925 50  0001 C CNN
	1    5650 3925
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3925 5650 4100
Wire Wire Line
	5650 4100 5900 4100
$Comp
L Device:C_Small C59
U 1 1 5E25F3D1
P 6250 4375
F 0 "C59" H 6342 4421 50  0000 L CNN
F 1 "100nF" H 6342 4330 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6250 4375 50  0001 C CNN
F 3 "~" H 6250 4375 50  0001 C CNN
	1    6250 4375
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C67
U 1 1 5E25F3D8
P 7525 4375
F 0 "C67" H 7617 4421 50  0000 L CNN
F 1 "100nF" H 7617 4330 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7525 4375 50  0001 C CNN
F 3 "~" H 7525 4375 50  0001 C CNN
	1    7525 4375
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C63
U 1 1 5E25F3DF
P 7100 4375
F 0 "C63" H 7191 4421 50  0000 L CNN
F 1 "22uF" H 7191 4330 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7100 4375 50  0001 C CNN
F 3 "~" H 7100 4375 50  0001 C CNN
	1    7100 4375
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 4400 6750 4575
Wire Wire Line
	6250 4475 6250 4575
Wire Wire Line
	7100 4475 7100 4575
Wire Wire Line
	7525 4475 7525 4575
$Comp
L power:GND #PWR0195
U 1 1 5E25F3EA
P 6250 4575
F 0 "#PWR0195" H 6250 4325 50  0001 C CNN
F 1 "GND" H 6255 4402 50  0000 C CNN
F 2 "" H 6250 4575 50  0001 C CNN
F 3 "" H 6250 4575 50  0001 C CNN
	1    6250 4575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0200
U 1 1 5E25F3F0
P 6750 4575
F 0 "#PWR0200" H 6750 4325 50  0001 C CNN
F 1 "GND" H 6755 4402 50  0000 C CNN
F 2 "" H 6750 4575 50  0001 C CNN
F 3 "" H 6750 4575 50  0001 C CNN
	1    6750 4575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0203
U 1 1 5E25F3F6
P 7100 4575
F 0 "#PWR0203" H 7100 4325 50  0001 C CNN
F 1 "GND" H 7105 4402 50  0000 C CNN
F 2 "" H 7100 4575 50  0001 C CNN
F 3 "" H 7100 4575 50  0001 C CNN
	1    7100 4575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0207
U 1 1 5E25F3FC
P 7525 4575
F 0 "#PWR0207" H 7525 4325 50  0001 C CNN
F 1 "GND" H 7530 4402 50  0000 C CNN
F 2 "" H 7525 4575 50  0001 C CNN
F 3 "" H 7525 4575 50  0001 C CNN
	1    7525 4575
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 4100 6250 4100
Wire Wire Line
	6250 4100 6250 4275
Connection ~ 6250 4100
Wire Wire Line
	6250 4100 6450 4100
Wire Wire Line
	7100 4275 7100 4100
Wire Wire Line
	7050 4100 7100 4100
Connection ~ 7100 4100
Wire Wire Line
	7100 4100 7525 4100
Wire Wire Line
	7525 4100 7525 4275
Wire Wire Line
	7800 4100 7525 4100
Connection ~ 7525 4100
$Comp
L Device:Ferrite_Bead FB2
U 1 1 5E2672C7
P 6050 5350
F 0 "FB2" V 5776 5350 50  0000 C CNN
F 1 "Ferrite_Bead" V 5867 5350 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5980 5350 50  0001 C CNN
F 3 "~" H 6050 5350 50  0001 C CNN
	1    6050 5350
	0    1    1    0   
$EndComp
$Comp
L Regulator_Linear:LM1117-3.3 U32
U 1 1 5E2672CE
P 6750 5350
F 0 "U32" H 6750 5592 50  0000 C CNN
F 1 "LM1117-3.3" H 6750 5501 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 6750 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 6750 5350 50  0001 C CNN
	1    6750 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0191
U 1 1 5E2672D5
P 5650 5175
F 0 "#PWR0191" H 5650 5025 50  0001 C CNN
F 1 "+5V" H 5665 5348 50  0000 C CNN
F 2 "" H 5650 5175 50  0001 C CNN
F 3 "" H 5650 5175 50  0001 C CNN
	1    5650 5175
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5175 5650 5350
Wire Wire Line
	5650 5350 5900 5350
$Comp
L Device:C_Small C60
U 1 1 5E2672DD
P 6250 5625
F 0 "C60" H 6342 5671 50  0000 L CNN
F 1 "100nF" H 6342 5580 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6250 5625 50  0001 C CNN
F 3 "~" H 6250 5625 50  0001 C CNN
	1    6250 5625
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C68
U 1 1 5E2672E4
P 7525 5625
F 0 "C68" H 7617 5671 50  0000 L CNN
F 1 "100nF" H 7617 5580 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7525 5625 50  0001 C CNN
F 3 "~" H 7525 5625 50  0001 C CNN
	1    7525 5625
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C64
U 1 1 5E2672EB
P 7100 5625
F 0 "C64" H 7191 5671 50  0000 L CNN
F 1 "22uF" H 7191 5580 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7100 5625 50  0001 C CNN
F 3 "~" H 7100 5625 50  0001 C CNN
	1    7100 5625
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 5650 6750 5825
Wire Wire Line
	6250 5725 6250 5825
Wire Wire Line
	7100 5725 7100 5825
Wire Wire Line
	7525 5725 7525 5825
$Comp
L power:GND #PWR0196
U 1 1 5E2672F6
P 6250 5825
F 0 "#PWR0196" H 6250 5575 50  0001 C CNN
F 1 "GND" H 6255 5652 50  0000 C CNN
F 2 "" H 6250 5825 50  0001 C CNN
F 3 "" H 6250 5825 50  0001 C CNN
	1    6250 5825
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0201
U 1 1 5E2672FC
P 6750 5825
F 0 "#PWR0201" H 6750 5575 50  0001 C CNN
F 1 "GND" H 6755 5652 50  0000 C CNN
F 2 "" H 6750 5825 50  0001 C CNN
F 3 "" H 6750 5825 50  0001 C CNN
	1    6750 5825
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0204
U 1 1 5E267302
P 7100 5825
F 0 "#PWR0204" H 7100 5575 50  0001 C CNN
F 1 "GND" H 7105 5652 50  0000 C CNN
F 2 "" H 7100 5825 50  0001 C CNN
F 3 "" H 7100 5825 50  0001 C CNN
	1    7100 5825
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0208
U 1 1 5E267308
P 7525 5825
F 0 "#PWR0208" H 7525 5575 50  0001 C CNN
F 1 "GND" H 7530 5652 50  0000 C CNN
F 2 "" H 7525 5825 50  0001 C CNN
F 3 "" H 7525 5825 50  0001 C CNN
	1    7525 5825
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 5350 6250 5350
Wire Wire Line
	6250 5350 6250 5525
Connection ~ 6250 5350
Wire Wire Line
	6250 5350 6450 5350
Wire Wire Line
	7100 5525 7100 5350
Wire Wire Line
	7050 5350 7100 5350
Connection ~ 7100 5350
Wire Wire Line
	7100 5350 7525 5350
Wire Wire Line
	7525 5350 7525 5525
Wire Wire Line
	7800 5350 7525 5350
Connection ~ 7525 5350
Text GLabel 7800 4100 2    50   Input ~ 0
3.3V_Analogue
Text GLabel 7800 5350 2    50   Input ~ 0
3.3V_Digital
$Comp
L Regulator_Linear:LM7905_TO220 U30
U 1 1 5E26A751
P 6750 3300
F 0 "U30" H 6750 3150 50  0000 C CNN
F 1 "LM7905_TO220" H 6750 3059 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 6750 3100 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7905.pdf" H 6750 3300 50  0001 C CNN
	1    6750 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0199
U 1 1 5E26D1D5
P 6750 2900
F 0 "#PWR0199" H 6750 2650 50  0001 C CNN
F 1 "GND" H 6755 2727 50  0000 C CNN
F 2 "" H 6750 2900 50  0001 C CNN
F 3 "" H 6750 2900 50  0001 C CNN
	1    6750 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	6750 2900 6750 3000
$Comp
L power:-12V #PWR0193
U 1 1 5E26E6E6
P 6075 3300
F 0 "#PWR0193" H 6075 3400 50  0001 C CNN
F 1 "-12V" V 6090 3428 50  0000 L CNN
F 2 "" H 6075 3300 50  0001 C CNN
F 3 "" H 6075 3300 50  0001 C CNN
	1    6075 3300
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C61
U 1 1 5E26EF90
P 6275 3100
F 0 "C61" H 6367 3146 50  0000 L CNN
F 1 "100nF" H 6367 3055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6275 3100 50  0001 C CNN
F 3 "~" H 6275 3100 50  0001 C CNN
	1    6275 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C65
U 1 1 5E26F16C
P 7175 3100
F 0 "C65" H 7266 3146 50  0000 L CNN
F 1 "22uF" H 7266 3055 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7175 3100 50  0001 C CNN
F 3 "~" H 7175 3100 50  0001 C CNN
	1    7175 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C69
U 1 1 5E26F1C8
P 7550 3075
F 0 "C69" H 7642 3121 50  0000 L CNN
F 1 "100nF" H 7642 3030 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7550 3075 50  0001 C CNN
F 3 "~" H 7550 3075 50  0001 C CNN
	1    7550 3075
	1    0    0    -1  
$EndComp
Wire Wire Line
	6075 3300 6275 3300
Wire Wire Line
	6275 3300 6275 3200
Wire Wire Line
	6275 3300 6450 3300
Connection ~ 6275 3300
Wire Wire Line
	7175 3200 7175 3300
Wire Wire Line
	7050 3300 7175 3300
Wire Wire Line
	7175 3300 7550 3300
Wire Wire Line
	7550 3300 7550 3175
Connection ~ 7175 3300
$Comp
L power:GND #PWR0197
U 1 1 5E275E2A
P 6275 2900
F 0 "#PWR0197" H 6275 2650 50  0001 C CNN
F 1 "GND" H 6280 2727 50  0000 C CNN
F 2 "" H 6275 2900 50  0001 C CNN
F 3 "" H 6275 2900 50  0001 C CNN
	1    6275 2900
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0205
U 1 1 5E275E63
P 7175 2900
F 0 "#PWR0205" H 7175 2650 50  0001 C CNN
F 1 "GND" H 7180 2727 50  0000 C CNN
F 2 "" H 7175 2900 50  0001 C CNN
F 3 "" H 7175 2900 50  0001 C CNN
	1    7175 2900
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0209
U 1 1 5E275E9C
P 7550 2900
F 0 "#PWR0209" H 7550 2650 50  0001 C CNN
F 1 "GND" H 7555 2727 50  0000 C CNN
F 2 "" H 7550 2900 50  0001 C CNN
F 3 "" H 7550 2900 50  0001 C CNN
	1    7550 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	7550 2900 7550 2975
Wire Wire Line
	7175 2900 7175 3000
Wire Wire Line
	6275 2900 6275 3000
Wire Wire Line
	7550 3300 7850 3300
Connection ~ 7550 3300
$Comp
L power:-5V #PWR0211
U 1 1 5E27BF1A
P 7850 3300
F 0 "#PWR0211" H 7850 3400 50  0001 C CNN
F 1 "-5V" V 7865 3428 50  0000 L CNN
F 2 "" H 7850 3300 50  0001 C CNN
F 3 "" H 7850 3300 50  0001 C CNN
	1    7850 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	2225 1550 2150 1550
Wire Wire Line
	2150 1450 2225 1450
Wire Wire Line
	2225 1350 2225 1450
Connection ~ 2225 1450
Wire Wire Line
	2225 1450 2300 1450
Wire Wire Line
	2225 1450 2225 1550
Wire Wire Line
	1175 1450 1175 1350
Connection ~ 1175 1450
Wire Wire Line
	1175 1450 1100 1450
Wire Wire Line
	1175 1450 1175 1550
$EndSCHEMATC
