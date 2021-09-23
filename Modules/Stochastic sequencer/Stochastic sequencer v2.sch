EESchema Schematic File Version 4
LIBS:Stochastic sequencer v2-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 7
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
L teensy:Teensy-LC U1
U 1 1 5CD0AF00
P 4700 2075
F 0 "U1" H 4725 3312 60  0000 C CNN
F 1 "Teensy-LC" H 4725 3206 60  0000 C CNN
F 2 "teensy:TeensyLC_fixed_pads" H 4700 1525 60  0001 C CNN
F 3 "" H 4700 1525 60  0000 C CNN
	1    4700 2075
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 2725 6600 2725
Text Label 5575 3825 2    50   ~ 0
WS2812_level_boost
Text Notes 3875 675  0    50   ~ 0
power with 5V for LED driving!
$Sheet
S 750  3775 1125 700 
U 5E0CE445
F0 "DigitalInputs and Normalization Probes" 50
F1 "Digital Inputs.sch" 50
$EndSheet
Text GLabel 3650 3025 0    50   Input ~ 0
Din_CLKpin_p
Text GLabel 3650 2425 0    50   Input ~ 0
Din_SERpin_p
Text GLabel 3650 1525 0    50   Input ~ 0
Din_latchPin_p
$Sheet
S 750  2925 1100 600 
U 5E16F5D5
F0 "Analog Inputs" 50
F1 "Analog Inputs.sch" 50
$EndSheet
$Sheet
S 725  2125 1100 625 
U 5E3554A1
F0 "CV and Accent outputs" 50
F1 "CVouts.sch" 50
$EndSheet
$Sheet
S 700  1425 1100 475 
U 5E62621A
F0 "Digital Outputs" 50
F1 "DigiOuts.sch" 50
$EndSheet
Text GLabel 5800 2125 2    50   Input ~ 0
DAC_SDApin_p
Text GLabel 5800 2225 2    50   Input ~ 0
DAC_SCLpin_p
Text GLabel 5800 2325 2    50   Input ~ 0
DAC_A_LDACpin_p
Text GLabel 3650 1825 0    50   Input ~ 0
DAC_C_LDACpin_p
Text GLabel 3650 1925 0    50   Input ~ 0
DAC_B_LDACpin_p
Text GLabel 3650 2225 0    50   Input ~ 0
AreadMuxControlPin3_p
Text GLabel 3650 2125 0    50   Input ~ 0
AreadMuxControlPin2_p
Text GLabel 3650 2025 0    50   Input ~ 0
AreadMuxControlPin1_p
Text GLabel 3650 2525 0    50   Input ~ 0
WS2812_serial_p
Wire Wire Line
	6600 2725 6600 3825
Wire Wire Line
	6600 3825 2775 3825
Wire Wire Line
	2775 3825 2775 1625
Wire Wire Line
	2775 1625 3650 1625
Text GLabel 5800 2425 2    50   Input ~ 0
Dout_CLKpin_p
Text GLabel 3650 1225 0    50   Input ~ 0
Dout_SERpin_p
Text GLabel 3650 1425 0    50   Input ~ 0
Dout_LATCHpin_p
$Sheet
S 725  675  1100 550 
U 5E64D60E
F0 "Touch buttons and LEDs" 50
F1 "TouchControls.sch" 50
$EndSheet
Text GLabel 5800 2525 2    50   Input ~ 0
TouchI2C_SCL_p
Text GLabel 5800 2625 2    50   Input ~ 0
TouchI2C_SDA_p
$Comp
L power:GND #PWR01
U 1 1 5E16BE90
P 6150 1925
F 0 "#PWR01" H 6150 1675 50  0001 C CNN
F 1 "GND" V 6155 1797 50  0000 R CNN
F 2 "" H 6150 1925 50  0001 C CNN
F 3 "" H 6150 1925 50  0001 C CNN
	1    6150 1925
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6150 1925 5800 1925
NoConn ~ 3650 2925
NoConn ~ 3650 2825
NoConn ~ 3650 2725
NoConn ~ 3650 2625
$Sheet
S 775  4725 1225 675 
U 5E255CEC
F0 "Power" 50
F1 "Power.sch" 50
$EndSheet
Text GLabel 5800 3025 2    50   Input ~ 0
AreadPin1_p
Text GLabel 5800 2825 2    50   Input ~ 0
AreadPin3_p
Text GLabel 5800 2925 2    50   Input ~ 0
AreadPin2_p
Text Notes 2600 3100 1    50   ~ 0
check : can we use MOSI pin in this way?
NoConn ~ 3650 1325
NoConn ~ 3650 1125
NoConn ~ 3650 1725
NoConn ~ 3650 2325
NoConn ~ 5800 2025
NoConn ~ 5800 1725
NoConn ~ 5800 1625
NoConn ~ 5800 1225
NoConn ~ 5800 1325
$Comp
L power:+5V #PWR0213
U 1 1 5E15132A
P 6175 1825
F 0 "#PWR0213" H 6175 1675 50  0001 C CNN
F 1 "+5V" V 6190 1953 50  0000 L CNN
F 2 "" H 6175 1825 50  0001 C CNN
F 3 "" H 6175 1825 50  0001 C CNN
	1    6175 1825
	0    1    1    0   
$EndComp
Wire Wire Line
	6175 1825 5800 1825
Text Notes 6550 1850 0    50   ~ 0
NB: the teensy board has a built-in 3.3V regulator
$Comp
L Connector:Conn_01x37_Female J39
U 1 1 5E1ED464
P 8375 4225
F 0 "J39" H 8275 6250 50  0000 L CNN
F 1 "Conn_01x37_Female" H 7900 6175 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x37_P2.54mm_Vertical" H 8375 4225 50  0001 C CNN
F 3 "~" H 8375 4225 50  0001 C CNN
	1    8375 4225
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x37_Male J40
U 1 1 5E1ED682
P 9250 4225
F 0 "J40" H 9356 6203 50  0000 C CNN
F 1 "Conn_01x37_Male" H 9356 6112 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x37_P2.54mm_Vertical" H 9250 4225 50  0001 C CNN
F 3 "~" H 9250 4225 50  0001 C CNN
	1    9250 4225
	1    0    0    -1  
$EndComp
Text GLabel 8175 2525 0    50   Input ~ 0
Touch11_p
Text GLabel 8175 2625 0    50   Input ~ 0
Touch10_p
Text GLabel 8175 2725 0    50   Input ~ 0
Touch9_p
Text GLabel 8175 2825 0    50   Input ~ 0
Touch8_p
Text GLabel 8175 2925 0    50   Input ~ 0
Touch7_p
Text GLabel 8175 3025 0    50   Input ~ 0
Touch6_p
Text GLabel 8175 3125 0    50   Input ~ 0
Touch5_p
Text GLabel 8175 3225 0    50   Input ~ 0
Touch4_p
Text GLabel 8175 3325 0    50   Input ~ 0
Touch3_p
Text GLabel 8175 3425 0    50   Input ~ 0
Touch2_p
Text GLabel 8175 3525 0    50   Input ~ 0
Touch1_p
Text GLabel 8175 3625 0    50   Input ~ 0
Touch0_p
$Comp
L power:GND #PWR0214
U 1 1 5E1F1CAD
P 8175 3725
F 0 "#PWR0214" H 8175 3475 50  0001 C CNN
F 1 "GND" V 8180 3597 50  0000 R CNN
F 2 "" H 8175 3725 50  0001 C CNN
F 3 "" H 8175 3725 50  0001 C CNN
	1    8175 3725
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0215
U 1 1 5E1F1D27
P 8175 3825
F 0 "#PWR0215" H 8175 3675 50  0001 C CNN
F 1 "+5V" V 8190 3953 50  0000 L CNN
F 2 "" H 8175 3825 50  0001 C CNN
F 3 "" H 8175 3825 50  0001 C CNN
	1    8175 3825
	0    -1   -1   0   
$EndComp
Text GLabel 8175 4025 0    50   Input ~ 0
3.3V_Digital
Text GLabel 8175 4125 0    50   Input ~ 0
3.3V_Analogue
$Comp
L power:-12V #PWR0216
U 1 1 5E1F1EF2
P 8175 3925
F 0 "#PWR0216" H 8175 4025 50  0001 C CNN
F 1 "-12V" V 8190 4053 50  0000 L CNN
F 2 "" H 8175 3925 50  0001 C CNN
F 3 "" H 8175 3925 50  0001 C CNN
	1    8175 3925
	0    -1   -1   0   
$EndComp
$Comp
L power:-5V #PWR0217
U 1 1 5E1F21EB
P 8175 4325
F 0 "#PWR0217" H 8175 4425 50  0001 C CNN
F 1 "-5V" V 8190 4453 50  0000 L CNN
F 2 "" H 8175 4325 50  0001 C CNN
F 3 "" H 8175 4325 50  0001 C CNN
	1    8175 4325
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0218
U 1 1 5E1F227B
P 8175 4225
F 0 "#PWR0218" H 8175 4075 50  0001 C CNN
F 1 "+12V" V 8190 4353 50  0000 L CNN
F 2 "" H 8175 4225 50  0001 C CNN
F 3 "" H 8175 4225 50  0001 C CNN
	1    8175 4225
	0    -1   -1   0   
$EndComp
NoConn ~ 5800 1425
NoConn ~ 5800 1525
$Comp
L power:GND #PWR0221
U 1 1 5E1F6A0B
P 9450 3725
F 0 "#PWR0221" H 9450 3475 50  0001 C CNN
F 1 "GND" V 9455 3597 50  0000 R CNN
F 2 "" H 9450 3725 50  0001 C CNN
F 3 "" H 9450 3725 50  0001 C CNN
	1    9450 3725
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR0222
U 1 1 5E1F6A11
P 9450 3825
F 0 "#PWR0222" H 9450 3675 50  0001 C CNN
F 1 "+5V" V 9465 3953 50  0000 L CNN
F 2 "" H 9450 3825 50  0001 C CNN
F 3 "" H 9450 3825 50  0001 C CNN
	1    9450 3825
	0    1    -1   0   
$EndComp
Text GLabel 9450 4025 2    50   Input ~ 0
3.3V_Digital
Text GLabel 9450 4125 2    50   Input ~ 0
3.3V_Analogue
$Comp
L power:-12V #PWR0223
U 1 1 5E1F6A19
P 9450 3925
F 0 "#PWR0223" H 9450 4025 50  0001 C CNN
F 1 "-12V" V 9450 4050 50  0000 L CNN
F 2 "" H 9450 3925 50  0001 C CNN
F 3 "" H 9450 3925 50  0001 C CNN
	1    9450 3925
	0    1    -1   0   
$EndComp
$Comp
L power:-5V #PWR0224
U 1 1 5E1F6A1F
P 9450 4325
F 0 "#PWR0224" H 9450 4425 50  0001 C CNN
F 1 "-5V" V 9465 4453 50  0000 L CNN
F 2 "" H 9450 4325 50  0001 C CNN
F 3 "" H 9450 4325 50  0001 C CNN
	1    9450 4325
	0    1    -1   0   
$EndComp
$Comp
L power:+12V #PWR0225
U 1 1 5E1F6A25
P 9450 4225
F 0 "#PWR0225" H 9450 4075 50  0001 C CNN
F 1 "+12V" V 9465 4353 50  0000 L CNN
F 2 "" H 9450 4225 50  0001 C CNN
F 3 "" H 9450 4225 50  0001 C CNN
	1    9450 4225
	0    1    -1   0   
$EndComp
Text GLabel 9450 2525 2    50   Input ~ 0
Touch11
Text GLabel 9450 2625 2    50   Input ~ 0
Touch10
Text GLabel 9450 2725 2    50   Input ~ 0
Touch9
Text GLabel 9450 2825 2    50   Input ~ 0
Touch8
Text GLabel 9450 2925 2    50   Input ~ 0
Touch7
Text GLabel 9450 3025 2    50   Input ~ 0
Touch6
Text GLabel 9450 3125 2    50   Input ~ 0
Touch5
Text GLabel 9450 3225 2    50   Input ~ 0
Touch4
Text GLabel 9450 3325 2    50   Input ~ 0
Touch3
Text GLabel 9450 3425 2    50   Input ~ 0
Touch2
Text GLabel 9450 3525 2    50   Input ~ 0
Touch1
Text GLabel 9450 3625 2    50   Input ~ 0
Touch0
Text GLabel 9450 5725 2    50   Input ~ 0
DAC_SDApin
Text GLabel 9450 5625 2    50   Input ~ 0
DAC_SCLpin
Text GLabel 9450 5925 2    50   Input ~ 0
DAC_A_LDACpin
Text GLabel 9450 5525 2    50   Input ~ 0
Dout_SERpin
Text GLabel 9450 5425 2    50   Input ~ 0
Dout_LATCHpin
Text GLabel 9450 6025 2    50   Input ~ 0
DAC_B_LDACpin
Text GLabel 9450 5825 2    50   Input ~ 0
DAC_C_LDACpin
Text GLabel 9450 4425 2    50   Input ~ 0
AreadMuxControlPin1
Text GLabel 9450 4525 2    50   Input ~ 0
AreadMuxControlPin2
Text GLabel 9450 4625 2    50   Input ~ 0
AreadMuxControlPin3
Text GLabel 9450 2425 2    50   Input ~ 0
WS2812_serial
Text GLabel 9450 4725 2    50   Input ~ 0
Din_SERpin
Text GLabel 9450 5125 2    50   Input ~ 0
Din_latchPin
Text GLabel 9450 5225 2    50   Input ~ 0
Din_CLKpin
Text GLabel 9450 5325 2    50   Input ~ 0
Dout_CLKpin
Text GLabel 8175 2425 0    50   Input ~ 0
WS2812_serial_p
Text GLabel 9450 5025 2    50   Input ~ 0
AreadCon1
Text GLabel 9450 4925 2    50   Input ~ 0
AreadCon2
Text GLabel 9450 4825 2    50   Input ~ 0
AreadCon3
Text GLabel 8175 5725 0    50   Input ~ 0
DAC_SDApin_p
Text GLabel 8175 5625 0    50   Input ~ 0
DAC_SCLpin_p
Text GLabel 8175 5925 0    50   Input ~ 0
DAC_A_LDACpin_p
Text GLabel 8175 5525 0    50   Input ~ 0
Dout_SERpin_p
Text GLabel 8175 5425 0    50   Input ~ 0
Dout_LATCHpin_p
Text GLabel 8175 6025 0    50   Input ~ 0
DAC_B_LDACpin_p
Text GLabel 8175 5825 0    50   Input ~ 0
DAC_C_LDACpin_p
Text GLabel 8175 4425 0    50   Input ~ 0
AreadMuxControlPin1_p
Text GLabel 8175 4525 0    50   Input ~ 0
AreadMuxControlPin2_p
Text GLabel 8175 4625 0    50   Input ~ 0
AreadMuxControlPin3_p
Text GLabel 8175 4725 0    50   Input ~ 0
Din_SERpin_p
Text GLabel 8175 5125 0    50   Input ~ 0
Din_latchPin_p
Text GLabel 8175 5225 0    50   Input ~ 0
Din_CLKpin_p
Text GLabel 8175 5325 0    50   Input ~ 0
Dout_CLKpin_p
Text GLabel 8175 5025 0    50   Input ~ 0
AreadCon1_p
Text GLabel 8175 4925 0    50   Input ~ 0
AreadCon2_p
Text GLabel 8175 4825 0    50   Input ~ 0
AreadCon3_p
$EndSCHEMATC
