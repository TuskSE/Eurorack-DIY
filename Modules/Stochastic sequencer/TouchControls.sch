EESchema Schematic File Version 4
LIBS:Stochastic sequencer v2-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 7
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
L SamTuskCustom:MPR121_breakout U17
U 1 1 5E64D9A8
P 3275 4525
F 0 "U17" H 3325 5390 50  0000 C CNN
F 1 "MPR121_breakout" H 3325 5299 50  0000 C CNN
F 2 "Eurocad:MPR121 breakout (adafruit)" H 3275 4525 50  0001 C CNN
F 3 "" H 3275 4525 50  0001 C CNN
	1    3275 4525
	1    0    0    -1  
$EndComp
Text Notes 1325 975  0    50   ~ 0
Each touch button uses:\n- Thonkikonn jack with switch contact removed\n- 5mm addressable LED from coolcomponents, SKU 1484
$Comp
L power:+5V #PWR0161
U 1 1 5E650EE7
P 3375 3100
F 0 "#PWR0161" H 3375 2950 50  0001 C CNN
F 1 "+5V" H 3390 3273 50  0000 C CNN
F 2 "" H 3375 3100 50  0001 C CNN
F 3 "" H 3375 3100 50  0001 C CNN
	1    3375 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C44
U 1 1 5E6512E6
P 3250 2950
F 0 "C44" V 3021 2950 50  0000 C CNN
F 1 "100nF" V 3112 2950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3250 2950 50  0001 C CNN
F 3 "~" H 3250 2950 50  0001 C CNN
	1    3250 2950
	0    1    1    0   
$EndComp
$Comp
L eurocad:LedTouchJack U16
U 1 1 5E6518EB
P 10450 2250
F 0 "U16" V 9700 2375 50  0000 L CNN
F 1 "LedTouchJack" V 9800 2175 50  0000 L CNN
F 2 "Eurocad:LedTouchJack" H 10650 2250 50  0001 C CNN
F 3 "" H 10650 2250 50  0001 C CNN
	1    10450 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 2725 3375 2725
Wire Wire Line
	3375 2725 3375 2950
Wire Wire Line
	3350 2950 3375 2950
Connection ~ 3375 2950
Wire Wire Line
	3375 2950 3375 3100
Wire Wire Line
	3200 2550 3200 2725
Wire Wire Line
	3200 2725 3100 2725
Wire Wire Line
	3100 2725 3100 2950
Connection ~ 3100 2950
Wire Wire Line
	3100 2950 3100 3100
Wire Wire Line
	3100 2950 3150 2950
Wire Wire Line
	3100 2550 3100 2600
Wire Wire Line
	3100 2600 2900 2600
Wire Wire Line
	3400 2550 3400 2600
NoConn ~ 3300 1900
$Comp
L power:GND #PWR0160
U 1 1 5E652180
P 3100 3100
F 0 "#PWR0160" H 3100 2850 50  0001 C CNN
F 1 "GND" H 3105 2927 50  0000 C CNN
F 2 "" H 3100 3100 50  0001 C CNN
F 3 "" H 3100 3100 50  0001 C CNN
	1    3100 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0164
U 1 1 5E652268
P 4050 3100
F 0 "#PWR0164" H 4050 2950 50  0001 C CNN
F 1 "+5V" H 4065 3273 50  0000 C CNN
F 2 "" H 4050 3100 50  0001 C CNN
F 3 "" H 4050 3100 50  0001 C CNN
	1    4050 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C45
U 1 1 5E65226E
P 3925 2950
F 0 "C45" V 3696 2950 50  0000 C CNN
F 1 "100nF" V 3787 2950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3925 2950 50  0001 C CNN
F 3 "~" H 3925 2950 50  0001 C CNN
	1    3925 2950
	0    1    1    0   
$EndComp
$Comp
L eurocad:LedTouchJack U18
U 1 1 5E652275
P 9800 2250
F 0 "U18" V 9050 2375 50  0000 L CNN
F 1 "LedTouchJack" V 9150 2175 50  0000 L CNN
F 2 "Eurocad:LedTouchJack" H 10000 2250 50  0001 C CNN
F 3 "" H 10000 2250 50  0001 C CNN
	1    9800 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	3975 2725 4050 2725
Wire Wire Line
	4050 2725 4050 2950
Wire Wire Line
	4025 2950 4050 2950
Connection ~ 4050 2950
Wire Wire Line
	4050 2950 4050 3100
Wire Wire Line
	3875 2550 3875 2725
Wire Wire Line
	3875 2725 3775 2725
Wire Wire Line
	3775 2725 3775 2950
Connection ~ 3775 2950
Wire Wire Line
	3775 2950 3775 3100
Wire Wire Line
	3775 2950 3825 2950
Wire Wire Line
	3775 2550 3775 2600
Wire Wire Line
	4075 2550 4075 2600
NoConn ~ 3975 1900
$Comp
L power:GND #PWR0162
U 1 1 5E65228D
P 3775 3100
F 0 "#PWR0162" H 3775 2850 50  0001 C CNN
F 1 "GND" H 3780 2927 50  0000 C CNN
F 2 "" H 3775 3100 50  0001 C CNN
F 3 "" H 3775 3100 50  0001 C CNN
	1    3775 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 2600 3775 2600
$Comp
L power:+5V #PWR0166
U 1 1 5E6525BB
P 4725 3100
F 0 "#PWR0166" H 4725 2950 50  0001 C CNN
F 1 "+5V" H 4740 3273 50  0000 C CNN
F 2 "" H 4725 3100 50  0001 C CNN
F 3 "" H 4725 3100 50  0001 C CNN
	1    4725 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C46
U 1 1 5E6525C1
P 4600 2950
F 0 "C46" V 4371 2950 50  0000 C CNN
F 1 "100nF" V 4462 2950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4600 2950 50  0001 C CNN
F 3 "~" H 4600 2950 50  0001 C CNN
	1    4600 2950
	0    1    1    0   
$EndComp
$Comp
L eurocad:LedTouchJack U19
U 1 1 5E6525C8
P 9125 2250
F 0 "U19" V 8375 2375 50  0000 L CNN
F 1 "LedTouchJack" V 8475 2175 50  0000 L CNN
F 2 "Eurocad:LedTouchJack" H 9325 2250 50  0001 C CNN
F 3 "" H 9325 2250 50  0001 C CNN
	1    9125 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 2725 4725 2725
Wire Wire Line
	4725 2725 4725 2950
Wire Wire Line
	4700 2950 4725 2950
Connection ~ 4725 2950
Wire Wire Line
	4725 2950 4725 3100
Wire Wire Line
	4550 2550 4550 2725
Wire Wire Line
	4550 2725 4450 2725
Wire Wire Line
	4450 2725 4450 2950
Connection ~ 4450 2950
Wire Wire Line
	4450 2950 4450 3100
Wire Wire Line
	4450 2950 4500 2950
Wire Wire Line
	4450 2550 4450 2600
Wire Wire Line
	4750 2550 4750 2600
NoConn ~ 4650 1900
$Comp
L power:GND #PWR0165
U 1 1 5E6525E0
P 4450 3100
F 0 "#PWR0165" H 4450 2850 50  0001 C CNN
F 1 "GND" H 4455 2927 50  0000 C CNN
F 2 "" H 4450 3100 50  0001 C CNN
F 3 "" H 4450 3100 50  0001 C CNN
	1    4450 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4075 2600 4450 2600
$Comp
L power:+5V #PWR0168
U 1 1 5E652BF3
P 5375 3100
F 0 "#PWR0168" H 5375 2950 50  0001 C CNN
F 1 "+5V" H 5390 3273 50  0000 C CNN
F 2 "" H 5375 3100 50  0001 C CNN
F 3 "" H 5375 3100 50  0001 C CNN
	1    5375 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C47
U 1 1 5E652BF9
P 5250 2950
F 0 "C47" V 5021 2950 50  0000 C CNN
F 1 "100nF" V 5112 2950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5250 2950 50  0001 C CNN
F 3 "~" H 5250 2950 50  0001 C CNN
	1    5250 2950
	0    1    1    0   
$EndComp
$Comp
L eurocad:LedTouchJack U20
U 1 1 5E652C00
P 8450 2250
F 0 "U20" V 7700 2375 50  0000 L CNN
F 1 "LedTouchJack" V 7800 2175 50  0000 L CNN
F 2 "Eurocad:LedTouchJack" H 8650 2250 50  0001 C CNN
F 3 "" H 8650 2250 50  0001 C CNN
	1    8450 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 2725 5375 2725
Wire Wire Line
	5375 2725 5375 2950
Wire Wire Line
	5350 2950 5375 2950
Connection ~ 5375 2950
Wire Wire Line
	5375 2950 5375 3100
Wire Wire Line
	5200 2550 5200 2725
Wire Wire Line
	5200 2725 5100 2725
Wire Wire Line
	5100 2725 5100 2950
Connection ~ 5100 2950
Wire Wire Line
	5100 2950 5100 3100
Wire Wire Line
	5100 2950 5150 2950
Wire Wire Line
	5100 2550 5100 2600
Wire Wire Line
	5400 2550 5400 2600
NoConn ~ 5300 1900
$Comp
L power:GND #PWR0167
U 1 1 5E652C18
P 5100 3100
F 0 "#PWR0167" H 5100 2850 50  0001 C CNN
F 1 "GND" H 5105 2927 50  0000 C CNN
F 2 "" H 5100 3100 50  0001 C CNN
F 3 "" H 5100 3100 50  0001 C CNN
	1    5100 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2600 5100 2600
$Comp
L power:+5V #PWR0170
U 1 1 5E65380C
P 6050 3100
F 0 "#PWR0170" H 6050 2950 50  0001 C CNN
F 1 "+5V" H 6065 3273 50  0000 C CNN
F 2 "" H 6050 3100 50  0001 C CNN
F 3 "" H 6050 3100 50  0001 C CNN
	1    6050 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C48
U 1 1 5E653812
P 5925 2950
F 0 "C48" V 5696 2950 50  0000 C CNN
F 1 "100nF" V 5787 2950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5925 2950 50  0001 C CNN
F 3 "~" H 5925 2950 50  0001 C CNN
	1    5925 2950
	0    1    1    0   
$EndComp
$Comp
L eurocad:LedTouchJack U21
U 1 1 5E653819
P 7775 2250
F 0 "U21" V 7025 2375 50  0000 L CNN
F 1 "LedTouchJack" V 7125 2175 50  0000 L CNN
F 2 "Eurocad:LedTouchJack" H 7975 2250 50  0001 C CNN
F 3 "" H 7975 2250 50  0001 C CNN
	1    7775 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	5975 2725 6050 2725
Wire Wire Line
	6050 2725 6050 2950
Wire Wire Line
	6025 2950 6050 2950
Connection ~ 6050 2950
Wire Wire Line
	6050 2950 6050 3100
Wire Wire Line
	5875 2550 5875 2725
Wire Wire Line
	5875 2725 5775 2725
Wire Wire Line
	5775 2725 5775 2950
Connection ~ 5775 2950
Wire Wire Line
	5775 2950 5775 3100
Wire Wire Line
	5775 2950 5825 2950
Wire Wire Line
	5775 2550 5775 2600
Wire Wire Line
	6075 2550 6075 2600
NoConn ~ 5975 1900
$Comp
L power:GND #PWR0169
U 1 1 5E653830
P 5775 3100
F 0 "#PWR0169" H 5775 2850 50  0001 C CNN
F 1 "GND" H 5780 2927 50  0000 C CNN
F 2 "" H 5775 3100 50  0001 C CNN
F 3 "" H 5775 3100 50  0001 C CNN
	1    5775 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0172
U 1 1 5E653836
P 6725 3100
F 0 "#PWR0172" H 6725 2950 50  0001 C CNN
F 1 "+5V" H 6740 3273 50  0000 C CNN
F 2 "" H 6725 3100 50  0001 C CNN
F 3 "" H 6725 3100 50  0001 C CNN
	1    6725 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C49
U 1 1 5E65383C
P 6600 2950
F 0 "C49" V 6371 2950 50  0000 C CNN
F 1 "100nF" V 6462 2950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6600 2950 50  0001 C CNN
F 3 "~" H 6600 2950 50  0001 C CNN
	1    6600 2950
	0    1    1    0   
$EndComp
$Comp
L eurocad:LedTouchJack U22
U 1 1 5E653843
P 7125 2250
F 0 "U22" V 6375 2375 50  0000 L CNN
F 1 "LedTouchJack" V 6475 2175 50  0000 L CNN
F 2 "Eurocad:LedTouchJack" H 7325 2250 50  0001 C CNN
F 3 "" H 7325 2250 50  0001 C CNN
	1    7125 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	6650 2725 6725 2725
Wire Wire Line
	6725 2725 6725 2950
Wire Wire Line
	6700 2950 6725 2950
Connection ~ 6725 2950
Wire Wire Line
	6725 2950 6725 3100
Wire Wire Line
	6550 2550 6550 2725
Wire Wire Line
	6550 2725 6450 2725
Wire Wire Line
	6450 2725 6450 2950
Connection ~ 6450 2950
Wire Wire Line
	6450 2950 6450 3100
Wire Wire Line
	6450 2950 6500 2950
Wire Wire Line
	6450 2550 6450 2600
Wire Wire Line
	6750 2550 6750 2600
NoConn ~ 6650 1900
$Comp
L power:GND #PWR0171
U 1 1 5E653859
P 6450 3100
F 0 "#PWR0171" H 6450 2850 50  0001 C CNN
F 1 "GND" H 6455 2927 50  0000 C CNN
F 2 "" H 6450 3100 50  0001 C CNN
F 3 "" H 6450 3100 50  0001 C CNN
	1    6450 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6075 2600 6450 2600
$Comp
L power:+5V #PWR0174
U 1 1 5E653860
P 7400 3100
F 0 "#PWR0174" H 7400 2950 50  0001 C CNN
F 1 "+5V" H 7415 3273 50  0000 C CNN
F 2 "" H 7400 3100 50  0001 C CNN
F 3 "" H 7400 3100 50  0001 C CNN
	1    7400 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C50
U 1 1 5E653866
P 7275 2950
F 0 "C50" V 7046 2950 50  0000 C CNN
F 1 "100nF" V 7137 2950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7275 2950 50  0001 C CNN
F 3 "~" H 7275 2950 50  0001 C CNN
	1    7275 2950
	0    1    1    0   
$EndComp
$Comp
L eurocad:LedTouchJack U23
U 1 1 5E65386D
P 6450 2250
F 0 "U23" V 5700 2375 50  0000 L CNN
F 1 "LedTouchJack" V 5800 2175 50  0000 L CNN
F 2 "Eurocad:LedTouchJack" H 6650 2250 50  0001 C CNN
F 3 "" H 6650 2250 50  0001 C CNN
	1    6450 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	7325 2725 7400 2725
Wire Wire Line
	7400 2725 7400 2950
Wire Wire Line
	7375 2950 7400 2950
Connection ~ 7400 2950
Wire Wire Line
	7400 2950 7400 3100
Wire Wire Line
	7225 2550 7225 2725
Wire Wire Line
	7225 2725 7125 2725
Wire Wire Line
	7125 2725 7125 2950
Connection ~ 7125 2950
Wire Wire Line
	7125 2950 7125 3100
Wire Wire Line
	7125 2950 7175 2950
Wire Wire Line
	7125 2550 7125 2600
Wire Wire Line
	7425 2550 7425 2600
NoConn ~ 7325 1900
$Comp
L power:GND #PWR0173
U 1 1 5E653883
P 7125 3100
F 0 "#PWR0173" H 7125 2850 50  0001 C CNN
F 1 "GND" H 7130 2927 50  0000 C CNN
F 2 "" H 7125 3100 50  0001 C CNN
F 3 "" H 7125 3100 50  0001 C CNN
	1    7125 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 2600 7125 2600
$Comp
L power:+5V #PWR0176
U 1 1 5E65388A
P 8050 3100
F 0 "#PWR0176" H 8050 2950 50  0001 C CNN
F 1 "+5V" H 8065 3273 50  0000 C CNN
F 2 "" H 8050 3100 50  0001 C CNN
F 3 "" H 8050 3100 50  0001 C CNN
	1    8050 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C51
U 1 1 5E653890
P 7925 2950
F 0 "C51" V 7696 2950 50  0000 C CNN
F 1 "100nF" V 7787 2950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7925 2950 50  0001 C CNN
F 3 "~" H 7925 2950 50  0001 C CNN
	1    7925 2950
	0    1    1    0   
$EndComp
$Comp
L eurocad:LedTouchJack U24
U 1 1 5E653897
P 5775 2250
F 0 "U24" V 5025 2375 50  0000 L CNN
F 1 "LedTouchJack" V 5125 2175 50  0000 L CNN
F 2 "Eurocad:LedTouchJack" H 5975 2250 50  0001 C CNN
F 3 "" H 5975 2250 50  0001 C CNN
	1    5775 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	7975 2725 8050 2725
Wire Wire Line
	8050 2725 8050 2950
Wire Wire Line
	8025 2950 8050 2950
Connection ~ 8050 2950
Wire Wire Line
	8050 2950 8050 3100
Wire Wire Line
	7875 2550 7875 2725
Wire Wire Line
	7875 2725 7775 2725
Wire Wire Line
	7775 2725 7775 2950
Connection ~ 7775 2950
Wire Wire Line
	7775 2950 7775 3100
Wire Wire Line
	7775 2950 7825 2950
Wire Wire Line
	7775 2550 7775 2600
NoConn ~ 7975 1900
$Comp
L power:GND #PWR0175
U 1 1 5E6538AC
P 7775 3100
F 0 "#PWR0175" H 7775 2850 50  0001 C CNN
F 1 "GND" H 7780 2927 50  0000 C CNN
F 2 "" H 7775 3100 50  0001 C CNN
F 3 "" H 7775 3100 50  0001 C CNN
	1    7775 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7425 2600 7775 2600
Wire Wire Line
	5400 2600 5775 2600
Wire Wire Line
	7975 2550 7975 2725
Wire Wire Line
	6650 2550 6650 2725
Wire Wire Line
	5975 2550 5975 2725
Wire Wire Line
	5300 2550 5300 2725
Wire Wire Line
	4650 2550 4650 2725
Wire Wire Line
	3975 2550 3975 2725
Wire Wire Line
	3300 2550 3300 2725
Wire Wire Line
	8075 2550 8075 2600
$Comp
L power:+5V #PWR0178
U 1 1 5E6744A4
P 8725 3100
F 0 "#PWR0178" H 8725 2950 50  0001 C CNN
F 1 "+5V" H 8740 3273 50  0000 C CNN
F 2 "" H 8725 3100 50  0001 C CNN
F 3 "" H 8725 3100 50  0001 C CNN
	1    8725 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C52
U 1 1 5E6744AA
P 8600 2950
F 0 "C52" V 8371 2950 50  0000 C CNN
F 1 "100nF" V 8462 2950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8600 2950 50  0001 C CNN
F 3 "~" H 8600 2950 50  0001 C CNN
	1    8600 2950
	0    1    1    0   
$EndComp
$Comp
L eurocad:LedTouchJack U25
U 1 1 5E6744B1
P 5100 2250
F 0 "U25" V 4350 2375 50  0000 L CNN
F 1 "LedTouchJack" V 4450 2175 50  0000 L CNN
F 2 "Eurocad:LedTouchJack" H 5300 2250 50  0001 C CNN
F 3 "" H 5300 2250 50  0001 C CNN
	1    5100 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	8650 2725 8725 2725
Wire Wire Line
	8725 2725 8725 2950
Wire Wire Line
	8700 2950 8725 2950
Connection ~ 8725 2950
Wire Wire Line
	8725 2950 8725 3100
Wire Wire Line
	8550 2550 8550 2725
Wire Wire Line
	8550 2725 8450 2725
Wire Wire Line
	8450 2725 8450 2950
Connection ~ 8450 2950
Wire Wire Line
	8450 2950 8450 3100
Wire Wire Line
	8450 2950 8500 2950
Wire Wire Line
	8450 2550 8450 2600
Wire Wire Line
	8750 2550 8750 2600
NoConn ~ 8650 1900
$Comp
L power:GND #PWR0177
U 1 1 5E6744C8
P 8450 3100
F 0 "#PWR0177" H 8450 2850 50  0001 C CNN
F 1 "GND" H 8455 2927 50  0000 C CNN
F 2 "" H 8450 3100 50  0001 C CNN
F 3 "" H 8450 3100 50  0001 C CNN
	1    8450 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0180
U 1 1 5E6744CE
P 9400 3100
F 0 "#PWR0180" H 9400 2950 50  0001 C CNN
F 1 "+5V" H 9415 3273 50  0000 C CNN
F 2 "" H 9400 3100 50  0001 C CNN
F 3 "" H 9400 3100 50  0001 C CNN
	1    9400 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C53
U 1 1 5E6744D4
P 9275 2950
F 0 "C53" V 9046 2950 50  0000 C CNN
F 1 "100nF" V 9137 2950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9275 2950 50  0001 C CNN
F 3 "~" H 9275 2950 50  0001 C CNN
	1    9275 2950
	0    1    1    0   
$EndComp
$Comp
L eurocad:LedTouchJack U26
U 1 1 5E6744DB
P 4450 2250
F 0 "U26" V 3700 2375 50  0000 L CNN
F 1 "LedTouchJack" V 3800 2175 50  0000 L CNN
F 2 "Eurocad:LedTouchJack" H 4650 2250 50  0001 C CNN
F 3 "" H 4650 2250 50  0001 C CNN
	1    4450 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	9325 2725 9400 2725
Wire Wire Line
	9400 2725 9400 2950
Wire Wire Line
	9375 2950 9400 2950
Connection ~ 9400 2950
Wire Wire Line
	9400 2950 9400 3100
Wire Wire Line
	9225 2550 9225 2725
Wire Wire Line
	9225 2725 9125 2725
Wire Wire Line
	9125 2725 9125 2950
Connection ~ 9125 2950
Wire Wire Line
	9125 2950 9125 3100
Wire Wire Line
	9125 2950 9175 2950
Wire Wire Line
	9125 2550 9125 2600
Wire Wire Line
	9425 2550 9425 2600
NoConn ~ 9325 1900
$Comp
L power:GND #PWR0179
U 1 1 5E6744F1
P 9125 3100
F 0 "#PWR0179" H 9125 2850 50  0001 C CNN
F 1 "GND" H 9130 2927 50  0000 C CNN
F 2 "" H 9125 3100 50  0001 C CNN
F 3 "" H 9125 3100 50  0001 C CNN
	1    9125 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 2600 9125 2600
$Comp
L power:+5V #PWR0182
U 1 1 5E6744F8
P 10075 3100
F 0 "#PWR0182" H 10075 2950 50  0001 C CNN
F 1 "+5V" H 10090 3273 50  0000 C CNN
F 2 "" H 10075 3100 50  0001 C CNN
F 3 "" H 10075 3100 50  0001 C CNN
	1    10075 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C54
U 1 1 5E6744FE
P 9950 2950
F 0 "C54" V 9721 2950 50  0000 C CNN
F 1 "100nF" V 9812 2950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9950 2950 50  0001 C CNN
F 3 "~" H 9950 2950 50  0001 C CNN
	1    9950 2950
	0    1    1    0   
$EndComp
$Comp
L eurocad:LedTouchJack U27
U 1 1 5E674505
P 3775 2250
F 0 "U27" V 3025 2375 50  0000 L CNN
F 1 "LedTouchJack" V 3125 2175 50  0000 L CNN
F 2 "Eurocad:LedTouchJack" H 3975 2250 50  0001 C CNN
F 3 "" H 3975 2250 50  0001 C CNN
	1    3775 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 2725 10075 2725
Wire Wire Line
	10075 2725 10075 2950
Wire Wire Line
	10050 2950 10075 2950
Connection ~ 10075 2950
Wire Wire Line
	10075 2950 10075 3100
Wire Wire Line
	9900 2550 9900 2725
Wire Wire Line
	9900 2725 9800 2725
Wire Wire Line
	9800 2725 9800 2950
Connection ~ 9800 2950
Wire Wire Line
	9800 2950 9800 3100
Wire Wire Line
	9800 2950 9850 2950
Wire Wire Line
	9800 2550 9800 2600
Wire Wire Line
	10100 2550 10100 2600
NoConn ~ 10000 1900
$Comp
L power:GND #PWR0181
U 1 1 5E67451B
P 9800 3100
F 0 "#PWR0181" H 9800 2850 50  0001 C CNN
F 1 "GND" H 9805 2927 50  0000 C CNN
F 2 "" H 9800 3100 50  0001 C CNN
F 3 "" H 9800 3100 50  0001 C CNN
	1    9800 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9425 2600 9800 2600
$Comp
L power:+5V #PWR0184
U 1 1 5E674522
P 10725 3100
F 0 "#PWR0184" H 10725 2950 50  0001 C CNN
F 1 "+5V" H 10740 3273 50  0000 C CNN
F 2 "" H 10725 3100 50  0001 C CNN
F 3 "" H 10725 3100 50  0001 C CNN
	1    10725 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C55
U 1 1 5E674528
P 10600 2950
F 0 "C55" V 10371 2950 50  0000 C CNN
F 1 "100nF" V 10462 2950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10600 2950 50  0001 C CNN
F 3 "~" H 10600 2950 50  0001 C CNN
	1    10600 2950
	0    1    1    0   
$EndComp
$Comp
L eurocad:LedTouchJack U28
U 1 1 5E67452F
P 3100 2250
F 0 "U28" V 2350 2375 50  0000 L CNN
F 1 "LedTouchJack" V 2450 2175 50  0000 L CNN
F 2 "Eurocad:LedTouchJack" H 3300 2250 50  0001 C CNN
F 3 "" H 3300 2250 50  0001 C CNN
	1    3100 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	10650 2725 10725 2725
Wire Wire Line
	10725 2725 10725 2950
Wire Wire Line
	10700 2950 10725 2950
Connection ~ 10725 2950
Wire Wire Line
	10725 2950 10725 3100
Wire Wire Line
	10550 2550 10550 2725
Wire Wire Line
	10550 2725 10450 2725
Wire Wire Line
	10450 2725 10450 2950
Connection ~ 10450 2950
Wire Wire Line
	10450 2950 10450 3100
Wire Wire Line
	10450 2950 10500 2950
NoConn ~ 10650 1900
$Comp
L power:GND #PWR0183
U 1 1 5E674544
P 10450 3100
F 0 "#PWR0183" H 10450 2850 50  0001 C CNN
F 1 "GND" H 10455 2927 50  0000 C CNN
F 2 "" H 10450 3100 50  0001 C CNN
F 3 "" H 10450 3100 50  0001 C CNN
	1    10450 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8075 2600 8450 2600
Wire Wire Line
	10550 1900 10550 1800
Wire Wire Line
	9900 1900 9900 1800
Wire Wire Line
	9225 1900 9225 1800
Wire Wire Line
	8550 1900 8550 1800
Wire Wire Line
	7875 1900 7875 1800
Wire Wire Line
	7225 1900 7225 1800
Wire Wire Line
	6550 1900 6550 1800
Wire Wire Line
	5875 1900 5875 1800
Wire Wire Line
	5200 1900 5200 1800
Wire Wire Line
	4550 1900 4550 1800
Wire Wire Line
	3875 1900 3875 1800
Wire Wire Line
	3200 1900 3200 1800
$Comp
L Device:R R134
U 1 1 5E6CAF46
P 2750 2600
F 0 "R134" V 2543 2600 50  0000 C CNN
F 1 "200R" V 2634 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2680 2600 50  0001 C CNN
F 3 "~" H 2750 2600 50  0001 C CNN
	1    2750 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	2600 2600 2500 2600
Text GLabel 2500 2600 0    50   Input ~ 0
WS2812_serial
Text GLabel 2700 4825 0    50   Input ~ 0
3.3V_Digital
Wire Wire Line
	2825 4825 2700 4825
NoConn ~ 2825 4725
$Comp
L power:GND #PWR0159
U 1 1 5E6F900C
P 2375 4625
F 0 "#PWR0159" H 2375 4375 50  0001 C CNN
F 1 "GND" V 2380 4497 50  0000 R CNN
F 2 "" H 2375 4625 50  0001 C CNN
F 3 "" H 2375 4625 50  0001 C CNN
	1    2375 4625
	0    1    1    0   
$EndComp
Wire Wire Line
	2825 4625 2375 4625
NoConn ~ 2825 4525
NoConn ~ 2825 4225
$Comp
L power:GND #PWR0163
U 1 1 5E70CB4E
P 3975 5125
F 0 "#PWR0163" H 3975 4875 50  0001 C CNN
F 1 "GND" V 3980 4997 50  0000 R CNN
F 2 "" H 3975 5125 50  0001 C CNN
F 3 "" H 3975 5125 50  0001 C CNN
	1    3975 5125
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3975 5125 3825 5125
Text GLabel 2675 4325 0    50   Input ~ 0
TouchI2C_SCL_p
Wire Wire Line
	2825 4325 2675 4325
Text GLabel 2675 4425 0    50   Input ~ 0
TouchI2C_SDA_p
Wire Wire Line
	2825 4425 2675 4425
Wire Wire Line
	10650 2550 10650 2725
NoConn ~ 10750 2550
Wire Wire Line
	10000 2550 10000 2725
Wire Wire Line
	9325 2550 9325 2725
Wire Wire Line
	8650 2550 8650 2725
Wire Wire Line
	7325 2550 7325 2725
Text GLabel 3825 3925 2    50   Input ~ 0
Touch0_p
Text GLabel 3825 4025 2    50   Input ~ 0
Touch1_p
Text GLabel 3825 4125 2    50   Input ~ 0
Touch2_p
Text GLabel 3825 4225 2    50   Input ~ 0
Touch3_p
Text GLabel 3825 4325 2    50   Input ~ 0
Touch4_p
Text GLabel 3825 4425 2    50   Input ~ 0
Touch5_p
Text GLabel 3825 4525 2    50   Input ~ 0
Touch6_p
Text GLabel 3825 4625 2    50   Input ~ 0
Touch7_p
Text GLabel 3825 4725 2    50   Input ~ 0
Touch8_p
Text GLabel 3825 4825 2    50   Input ~ 0
Touch9_p
Text GLabel 3825 4925 2    50   Input ~ 0
Touch10_p
Text GLabel 3825 5025 2    50   Input ~ 0
Touch11_p
Text GLabel 10550 1800 0    50   Input ~ 0
Touch0
Text GLabel 9900 1800 0    50   Input ~ 0
Touch1
Text GLabel 9225 1800 0    50   Input ~ 0
Touch2
Text GLabel 8550 1800 0    50   Input ~ 0
Touch3
Text GLabel 7875 1800 0    50   Input ~ 0
Touch4
Text GLabel 7225 1800 0    50   Input ~ 0
Touch5
Text GLabel 6550 1800 0    50   Input ~ 0
Touch6
Text GLabel 5875 1800 0    50   Input ~ 0
Touch7
Text GLabel 5200 1800 0    50   Input ~ 0
Touch8
Text GLabel 4550 1800 0    50   Input ~ 0
Touch9
Text GLabel 3875 1800 0    50   Input ~ 0
Touch10
Text GLabel 3200 1800 0    50   Input ~ 0
Touch11
Wire Wire Line
	10450 2550 10450 2600
Wire Wire Line
	10100 2600 10450 2600
$EndSCHEMATC
