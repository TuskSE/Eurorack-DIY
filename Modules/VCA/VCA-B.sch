EESchema Schematic File Version 4
LIBS:VCA-cache
EELAYER 26 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 3 7
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
L eurocad:PJ301M-12 J3
U 1 1 5E6450B4
P 3175 2575
AR Path="/5E4F7922/5E6450B4" Ref="J3"  Part="1" 
AR Path="/5E6561C0/5E6450B4" Ref="J?"  Part="1" 
AR Path="/5E65AD2D/5E6450B4" Ref="J?"  Part="1" 
AR Path="/5E65F56D/5E6450B4" Ref="J?"  Part="1" 
AR Path="/5E67D69E/5E6450B4" Ref="J?"  Part="1" 
AR Path="/5E700726/5E6450B4" Ref="J9"  Part="1" 
AR Path="/5E71BF83/5E6450B4" Ref="J?"  Part="1" 
F 0 "J9" H 2697 2559 50  0000 R CNN
F 1 "PJ301M-12" H 2697 2650 50  0000 R CNN
F 2 "Eurocad:PJ301M-12-MoreMetal" H 3175 2575 50  0001 C CNN
F 3 "" H 3175 2575 50  0000 C CNN
	1    3175 2575
	1    0    0    1   
$EndComp
$Comp
L eurocad:PJ301M-12 J4
U 1 1 5E6450B7
P 3175 3900
AR Path="/5E4F7922/5E6450B7" Ref="J4"  Part="1" 
AR Path="/5E6561C0/5E6450B7" Ref="J?"  Part="1" 
AR Path="/5E65AD2D/5E6450B7" Ref="J?"  Part="1" 
AR Path="/5E65F56D/5E6450B7" Ref="J?"  Part="1" 
AR Path="/5E67D69E/5E6450B7" Ref="J?"  Part="1" 
AR Path="/5E700726/5E6450B7" Ref="J10"  Part="1" 
AR Path="/5E71BF83/5E6450B7" Ref="J?"  Part="1" 
F 0 "J10" H 2697 3884 50  0000 R CNN
F 1 "PJ301M-12" H 2697 3975 50  0000 R CNN
F 2 "Eurocad:PJ301M-12-MoreMetal" H 3175 3900 50  0001 C CNN
F 3 "" H 3175 3900 50  0000 C CNN
	1    3175 3900
	1    0    0    1   
$EndComp
Text Notes 2725 2375 0    50   ~ 0
CV1
Text Notes 2750 3700 0    50   ~ 0
CV2
$Comp
L power:GND #PWR011
U 1 1 5E6450B9
P 3675 3300
AR Path="/5E4F7922/5E6450B9" Ref="#PWR011"  Part="1" 
AR Path="/5E6561C0/5E6450B9" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E6450B9" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E6450B9" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E6450B9" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E6450B9" Ref="#PWR030"  Part="1" 
AR Path="/5E71BF83/5E6450B9" Ref="#PWR?"  Part="1" 
F 0 "#PWR030" H 3675 3050 50  0001 C CNN
F 1 "GND" H 3680 3127 50  0000 C CNN
F 2 "" H 3675 3300 50  0001 C CNN
F 3 "" H 3675 3300 50  0001 C CNN
	1    3675 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV5
U 1 1 5E6450BD
P 4100 2875
AR Path="/5E4F7922/5E6450BD" Ref="RV5"  Part="1" 
AR Path="/5E6561C0/5E6450BD" Ref="RV?"  Part="1" 
AR Path="/5E65AD2D/5E6450BD" Ref="RV?"  Part="1" 
AR Path="/5E65F56D/5E6450BD" Ref="RV?"  Part="1" 
AR Path="/5E67D69E/5E6450BD" Ref="RV?"  Part="1" 
AR Path="/5E700726/5E6450BD" Ref="RV8"  Part="1" 
AR Path="/5E71BF83/5E6450BD" Ref="RV?"  Part="1" 
F 0 "RV8" H 4030 2921 50  0000 R CNN
F 1 "100k" H 4030 2830 50  0000 R CNN
F 2 "Eurocad:Tayda A-1629 Slide Pot_30mm" H 4100 2875 50  0001 C CNN
F 3 "~" H 4100 2875 50  0001 C CNN
	1    4100 2875
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5E6450BE
P 4100 3325
AR Path="/5E4F7922/5E6450BE" Ref="#PWR014"  Part="1" 
AR Path="/5E6561C0/5E6450BE" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E6450BE" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E6450BE" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E6450BE" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E6450BE" Ref="#PWR033"  Part="1" 
AR Path="/5E71BF83/5E6450BE" Ref="#PWR?"  Part="1" 
F 0 "#PWR033" H 4100 3075 50  0001 C CNN
F 1 "GND" H 4105 3152 50  0000 C CNN
F 2 "" H 4100 3325 50  0001 C CNN
F 3 "" H 4100 3325 50  0001 C CNN
	1    4100 3325
	1    0    0    -1  
$EndComp
$Comp
L Device:R R27
U 1 1 5E6450C3
P 4450 3075
AR Path="/5E4F7922/5E6450C3" Ref="R27"  Part="1" 
AR Path="/5E6561C0/5E6450C3" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E6450C3" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E6450C3" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E6450C3" Ref="R?"  Part="1" 
AR Path="/5E700726/5E6450C3" Ref="R56"  Part="1" 
AR Path="/5E71BF83/5E6450C3" Ref="R?"  Part="1" 
F 0 "R56" H 4520 3121 50  0000 L CNN
F 1 "47k" H 4520 3030 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4380 3075 50  0001 C CNN
F 3 "~" H 4450 3075 50  0001 C CNN
	1    4450 3075
	1    0    0    -1  
$EndComp
$Comp
L Device:R R26
U 1 1 5E6450C5
P 4450 2675
AR Path="/5E4F7922/5E6450C5" Ref="R26"  Part="1" 
AR Path="/5E6561C0/5E6450C5" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E6450C5" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E6450C5" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E6450C5" Ref="R?"  Part="1" 
AR Path="/5E700726/5E6450C5" Ref="R55"  Part="1" 
AR Path="/5E71BF83/5E6450C5" Ref="R?"  Part="1" 
F 0 "R55" H 4520 2721 50  0000 L CNN
F 1 "47k" H 4520 2630 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4380 2675 50  0001 C CNN
F 3 "~" H 4450 2675 50  0001 C CNN
	1    4450 2675
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2475 4100 2725
Wire Wire Line
	4100 3025 4100 3275
Wire Wire Line
	4250 2875 4450 2875
Wire Wire Line
	4450 2875 4450 2925
Wire Wire Line
	4450 2825 4450 2875
Connection ~ 4450 2875
Wire Wire Line
	4450 2525 4450 2475
Wire Wire Line
	4100 2475 4450 2475
Wire Wire Line
	4450 3225 4450 3275
Wire Wire Line
	4450 3275 4100 3275
Connection ~ 4100 3275
Wire Wire Line
	4100 3275 4100 3325
Wire Wire Line
	3675 2725 3675 3300
$Comp
L Device:R R31
U 1 1 5E6450C9
P 4775 2475
AR Path="/5E4F7922/5E6450C9" Ref="R31"  Part="1" 
AR Path="/5E6561C0/5E6450C9" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E6450C9" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E6450C9" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E6450C9" Ref="R?"  Part="1" 
AR Path="/5E700726/5E6450C9" Ref="R60"  Part="1" 
AR Path="/5E71BF83/5E6450C9" Ref="R?"  Part="1" 
F 0 "R60" V 4568 2475 50  0000 C CNN
F 1 "100k" V 4659 2475 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4705 2475 50  0001 C CNN
F 3 "~" H 4775 2475 50  0001 C CNN
	1    4775 2475
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 2475 4625 2475
Connection ~ 4450 2475
$Comp
L Amplifier_Operational:TL074 U3
U 1 1 5E6450CA
P 5425 2675
AR Path="/5E4F7922/5E6450CA" Ref="U3"  Part="1" 
AR Path="/5E6561C0/5E6450CA" Ref="U?"  Part="1" 
AR Path="/5E65AD2D/5E6450CA" Ref="U?"  Part="1" 
AR Path="/5E65F56D/5E6450CA" Ref="U?"  Part="1" 
AR Path="/5E67D69E/5E6450CA" Ref="U?"  Part="1" 
AR Path="/5E700726/5E6450CA" Ref="U5"  Part="1" 
AR Path="/5E71BF83/5E6450CA" Ref="U?"  Part="1" 
F 0 "U5" H 5475 2500 50  0000 C CNN
F 1 "TL074" H 5400 2675 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5375 2775 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 5475 2875 50  0001 C CNN
	1    5425 2675
	1    0    0    1   
$EndComp
$Comp
L Device:R R33
U 1 1 5E6450CE
P 5450 2275
AR Path="/5E4F7922/5E6450CE" Ref="R33"  Part="1" 
AR Path="/5E6561C0/5E6450CE" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E6450CE" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E6450CE" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E6450CE" Ref="R?"  Part="1" 
AR Path="/5E700726/5E6450CE" Ref="R62"  Part="1" 
AR Path="/5E71BF83/5E6450CE" Ref="R?"  Part="1" 
F 0 "R62" V 5243 2275 50  0000 C CNN
F 1 "100k" V 5334 2275 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5380 2275 50  0001 C CNN
F 3 "~" H 5450 2275 50  0001 C CNN
	1    5450 2275
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 2275 5050 2275
Wire Wire Line
	5050 2275 5050 2475
Wire Wire Line
	5050 2575 5125 2575
Wire Wire Line
	5050 2475 4925 2475
Connection ~ 5050 2475
Wire Wire Line
	5050 2475 5050 2575
Wire Wire Line
	5600 2275 5875 2275
Wire Wire Line
	5875 2275 5875 2675
Wire Wire Line
	5875 2675 5725 2675
Wire Wire Line
	4850 2875 4850 2775
Wire Wire Line
	4850 2775 5125 2775
Wire Wire Line
	3625 2475 3975 2475
Connection ~ 4100 2475
$Comp
L power:GND #PWR012
U 1 1 5E4F83AF
P 3725 4625
AR Path="/5E4F7922/5E4F83AF" Ref="#PWR012"  Part="1" 
AR Path="/5E6561C0/5E4F83AF" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E4F83AF" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E4F83AF" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E4F83AF" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E4F83AF" Ref="#PWR031"  Part="1" 
AR Path="/5E71BF83/5E4F83AF" Ref="#PWR?"  Part="1" 
F 0 "#PWR031" H 3725 4375 50  0001 C CNN
F 1 "GND" H 3730 4452 50  0000 C CNN
F 2 "" H 3725 4625 50  0001 C CNN
F 3 "" H 3725 4625 50  0001 C CNN
	1    3725 4625
	1    0    0    -1  
$EndComp
Wire Wire Line
	3625 4050 3725 4050
$Comp
L Device:R_POT RV6
U 1 1 5E6450D3
P 4100 4200
AR Path="/5E4F7922/5E6450D3" Ref="RV6"  Part="1" 
AR Path="/5E6561C0/5E6450D3" Ref="RV?"  Part="1" 
AR Path="/5E65AD2D/5E6450D3" Ref="RV?"  Part="1" 
AR Path="/5E65F56D/5E6450D3" Ref="RV?"  Part="1" 
AR Path="/5E67D69E/5E6450D3" Ref="RV?"  Part="1" 
AR Path="/5E700726/5E6450D3" Ref="RV9"  Part="1" 
AR Path="/5E71BF83/5E6450D3" Ref="RV?"  Part="1" 
F 0 "RV9" H 4030 4246 50  0000 R CNN
F 1 "100k" H 4030 4155 50  0000 R CNN
F 2 "Eurocad:Tayda A-1629 Slide Pot_30mm" H 4100 4200 50  0001 C CNN
F 3 "~" H 4100 4200 50  0001 C CNN
	1    4100 4200
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5E6450D6
P 4100 4650
AR Path="/5E4F7922/5E6450D6" Ref="#PWR015"  Part="1" 
AR Path="/5E6561C0/5E6450D6" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E6450D6" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E6450D6" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E6450D6" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E6450D6" Ref="#PWR034"  Part="1" 
AR Path="/5E71BF83/5E6450D6" Ref="#PWR?"  Part="1" 
F 0 "#PWR034" H 4100 4400 50  0001 C CNN
F 1 "GND" H 4105 4477 50  0000 C CNN
F 2 "" H 4100 4650 50  0001 C CNN
F 3 "" H 4100 4650 50  0001 C CNN
	1    4100 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R29
U 1 1 5E6450DB
P 4450 4400
AR Path="/5E4F7922/5E6450DB" Ref="R29"  Part="1" 
AR Path="/5E6561C0/5E6450DB" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E6450DB" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E6450DB" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E6450DB" Ref="R?"  Part="1" 
AR Path="/5E700726/5E6450DB" Ref="R58"  Part="1" 
AR Path="/5E71BF83/5E6450DB" Ref="R?"  Part="1" 
F 0 "R58" H 4520 4446 50  0000 L CNN
F 1 "47k" H 4520 4355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4380 4400 50  0001 C CNN
F 3 "~" H 4450 4400 50  0001 C CNN
	1    4450 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R28
U 1 1 5E6450DE
P 4450 4000
AR Path="/5E4F7922/5E6450DE" Ref="R28"  Part="1" 
AR Path="/5E6561C0/5E6450DE" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E6450DE" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E6450DE" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E6450DE" Ref="R?"  Part="1" 
AR Path="/5E700726/5E6450DE" Ref="R57"  Part="1" 
AR Path="/5E71BF83/5E6450DE" Ref="R?"  Part="1" 
F 0 "R57" H 4520 4046 50  0000 L CNN
F 1 "47k" H 4520 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4380 4000 50  0001 C CNN
F 3 "~" H 4450 4000 50  0001 C CNN
	1    4450 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3800 4100 4050
Wire Wire Line
	4100 4350 4100 4600
Wire Wire Line
	4250 4200 4450 4200
Wire Wire Line
	4450 4200 4450 4250
Wire Wire Line
	4450 4150 4450 4200
Connection ~ 4450 4200
Wire Wire Line
	4450 3850 4450 3800
Wire Wire Line
	4100 3800 4450 3800
Wire Wire Line
	4450 4550 4450 4600
Wire Wire Line
	4450 4600 4100 4600
Connection ~ 4100 4600
Wire Wire Line
	4100 4600 4100 4650
Wire Wire Line
	3725 4050 3725 4625
$Comp
L Device:R R32
U 1 1 5E6450DF
P 4775 3800
AR Path="/5E4F7922/5E6450DF" Ref="R32"  Part="1" 
AR Path="/5E6561C0/5E6450DF" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E6450DF" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E6450DF" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E6450DF" Ref="R?"  Part="1" 
AR Path="/5E700726/5E6450DF" Ref="R61"  Part="1" 
AR Path="/5E71BF83/5E6450DF" Ref="R?"  Part="1" 
F 0 "R61" V 4568 3800 50  0000 C CNN
F 1 "100k" V 4659 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4705 3800 50  0001 C CNN
F 3 "~" H 4775 3800 50  0001 C CNN
	1    4775 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 3800 4625 3800
Connection ~ 4450 3800
$Comp
L Device:R R34
U 1 1 5E6450E2
P 5450 3600
AR Path="/5E4F7922/5E6450E2" Ref="R34"  Part="1" 
AR Path="/5E6561C0/5E6450E2" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E6450E2" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E6450E2" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E6450E2" Ref="R?"  Part="1" 
AR Path="/5E700726/5E6450E2" Ref="R63"  Part="1" 
AR Path="/5E71BF83/5E6450E2" Ref="R?"  Part="1" 
F 0 "R63" V 5243 3600 50  0000 C CNN
F 1 "100k" V 5334 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5380 3600 50  0001 C CNN
F 3 "~" H 5450 3600 50  0001 C CNN
	1    5450 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 3600 5050 3600
Wire Wire Line
	5050 3600 5050 3800
Wire Wire Line
	5050 3900 5125 3900
Wire Wire Line
	5050 3800 4925 3800
Connection ~ 5050 3800
Wire Wire Line
	5050 3800 5050 3900
Wire Wire Line
	5600 3600 5875 3600
Wire Wire Line
	5875 3600 5875 4000
Wire Wire Line
	5875 4000 5725 4000
Wire Wire Line
	4850 4200 4850 4100
Wire Wire Line
	4850 4100 5125 4100
Wire Wire Line
	3625 3800 4100 3800
Connection ~ 4100 3800
$Comp
L Amplifier_Operational:TL074 U3
U 2 1 5E4F83FB
P 5425 4000
AR Path="/5E4F7922/5E4F83FB" Ref="U3"  Part="2" 
AR Path="/5E6561C0/5E4F83FB" Ref="U?"  Part="2" 
AR Path="/5E65AD2D/5E4F83FB" Ref="U?"  Part="2" 
AR Path="/5E65F56D/5E4F83FB" Ref="U?"  Part="2" 
AR Path="/5E67D69E/5E4F83FB" Ref="U?"  Part="2" 
AR Path="/5E700726/5E4F83FB" Ref="U5"  Part="2" 
AR Path="/5E71BF83/5E4F83FB" Ref="U?"  Part="2" 
F 0 "U5" H 5475 3825 50  0000 C CNN
F 1 "TL074" H 5400 4000 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5375 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 5475 4200 50  0001 C CNN
	2    5425 4000
	1    0    0    1   
$EndComp
Text Notes 5025 1650 0    50   ~ 0
Attenuverter circuit from https://kassu2000.blogspot.com/2018/04/precision-attenuverter-mixer.html
Wire Wire Line
	4450 2875 4850 2875
Wire Wire Line
	4450 4200 4850 4200
$Comp
L Device:R R38
U 1 1 5E6450EB
P 6875 4450
AR Path="/5E4F7922/5E6450EB" Ref="R38"  Part="1" 
AR Path="/5E6561C0/5E6450EB" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E6450EB" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E6450EB" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E6450EB" Ref="R?"  Part="1" 
AR Path="/5E700726/5E6450EB" Ref="R67"  Part="1" 
AR Path="/5E71BF83/5E6450EB" Ref="R?"  Part="1" 
F 0 "R67" V 6668 4450 50  0000 C CNN
F 1 "47k" V 6759 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6805 4450 50  0001 C CNN
F 3 "~" H 6875 4450 50  0001 C CNN
	1    6875 4450
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL074 U4
U 3 1 5E6450ED
P 7850 7125
AR Path="/5E4F7922/5E6450ED" Ref="U4"  Part="3" 
AR Path="/5E6561C0/5E6450ED" Ref="U?"  Part="3" 
AR Path="/5E65AD2D/5E6450ED" Ref="U?"  Part="3" 
AR Path="/5E65F56D/5E6450ED" Ref="U?"  Part="3" 
AR Path="/5E67D69E/5E6450ED" Ref="U?"  Part="3" 
AR Path="/5E700726/5E6450ED" Ref="U6"  Part="3" 
AR Path="/5E71BF83/5E6450ED" Ref="U?"  Part="3" 
F 0 "U6" H 7875 6950 50  0000 C CNN
F 1 "TL074" H 7800 7125 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7800 7225 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 7900 7325 50  0001 C CNN
	3    7850 7125
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR023
U 1 1 5E6450EF
P 8200 4725
AR Path="/5E4F7922/5E6450EF" Ref="#PWR023"  Part="1" 
AR Path="/5E6561C0/5E6450EF" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E6450EF" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E6450EF" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E6450EF" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E6450EF" Ref="#PWR042"  Part="1" 
AR Path="/5E71BF83/5E6450EF" Ref="#PWR?"  Part="1" 
F 0 "#PWR042" H 8200 4475 50  0001 C CNN
F 1 "GND" H 8205 4552 50  0000 C CNN
F 2 "" H 8200 4725 50  0001 C CNN
F 3 "" H 8200 4725 50  0001 C CNN
	1    8200 4725
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 4650 8200 4725
$Comp
L Device:R R41
U 1 1 5E6450F3
P 7225 4725
AR Path="/5E4F7922/5E6450F3" Ref="R41"  Part="1" 
AR Path="/5E6561C0/5E6450F3" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E6450F3" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E6450F3" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E6450F3" Ref="R?"  Part="1" 
AR Path="/5E700726/5E6450F3" Ref="R70"  Part="1" 
AR Path="/5E71BF83/5E6450F3" Ref="R?"  Part="1" 
F 0 "R70" H 7025 4775 50  0000 L CNN
F 1 "470R" H 6950 4700 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7155 4725 50  0001 C CNN
F 3 "~" H 7225 4725 50  0001 C CNN
	1    7225 4725
	1    0    0    -1  
$EndComp
Wire Wire Line
	7375 4450 7225 4450
Wire Wire Line
	7225 4450 7225 4575
$Comp
L Device:C_Small C7
U 1 1 5E4F842D
P 7225 5075
AR Path="/5E4F7922/5E4F842D" Ref="C7"  Part="1" 
AR Path="/5E6561C0/5E4F842D" Ref="C?"  Part="1" 
AR Path="/5E65AD2D/5E4F842D" Ref="C?"  Part="1" 
AR Path="/5E65F56D/5E4F842D" Ref="C?"  Part="1" 
AR Path="/5E67D69E/5E4F842D" Ref="C?"  Part="1" 
AR Path="/5E700726/5E4F842D" Ref="C18"  Part="1" 
AR Path="/5E71BF83/5E4F842D" Ref="C?"  Part="1" 
F 0 "C18" H 7317 5121 50  0000 L CNN
F 1 "560p" H 7317 5030 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7225 5075 50  0001 C CNN
F 3 "~" H 7225 5075 50  0001 C CNN
	1    7225 5075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5E4F8434
P 7225 5250
AR Path="/5E4F7922/5E4F8434" Ref="#PWR021"  Part="1" 
AR Path="/5E6561C0/5E4F8434" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E4F8434" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E4F8434" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E4F8434" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E4F8434" Ref="#PWR040"  Part="1" 
AR Path="/5E71BF83/5E4F8434" Ref="#PWR?"  Part="1" 
F 0 "#PWR040" H 7225 5000 50  0001 C CNN
F 1 "GND" H 7230 5077 50  0000 C CNN
F 2 "" H 7225 5250 50  0001 C CNN
F 3 "" H 7225 5250 50  0001 C CNN
	1    7225 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7225 5175 7225 5250
Wire Wire Line
	7225 4875 7225 4975
$Comp
L Device:R R44
U 1 1 5E6450FC
P 7825 3425
AR Path="/5E4F7922/5E6450FC" Ref="R44"  Part="1" 
AR Path="/5E6561C0/5E6450FC" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E6450FC" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E6450FC" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E6450FC" Ref="R?"  Part="1" 
AR Path="/5E700726/5E6450FC" Ref="R73"  Part="1" 
AR Path="/5E71BF83/5E6450FC" Ref="R?"  Part="1" 
F 0 "R73" V 8032 3425 50  0000 C CNN
F 1 "47k" V 7941 3425 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7755 3425 50  0001 C CNN
F 3 "~" H 7825 3425 50  0001 C CNN
	1    7825 3425
	0    -1   -1   0   
$EndComp
Connection ~ 5875 2675
Wire Wire Line
	6050 4000 5875 4000
Connection ~ 5875 4000
Wire Wire Line
	7225 4450 7025 4450
Connection ~ 7225 4450
Wire Wire Line
	6725 4450 6575 4450
$Comp
L Device:R R43
U 1 1 5E4F8449
P 7675 3900
AR Path="/5E4F7922/5E4F8449" Ref="R43"  Part="1" 
AR Path="/5E6561C0/5E4F8449" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E4F8449" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E4F8449" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E4F8449" Ref="R?"  Part="1" 
AR Path="/5E700726/5E4F8449" Ref="R72"  Part="1" 
AR Path="/5E71BF83/5E4F8449" Ref="R?"  Part="1" 
F 0 "R72" V 7468 3900 50  0000 C CNN
F 1 "10M" V 7559 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7605 3900 50  0001 C CNN
F 3 "~" H 7675 3900 50  0001 C CNN
	1    7675 3900
	0    1    1    0   
$EndComp
$Comp
L Device:R R42
U 1 1 5E4F8450
P 7325 3900
AR Path="/5E4F7922/5E4F8450" Ref="R42"  Part="1" 
AR Path="/5E6561C0/5E4F8450" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E4F8450" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E4F8450" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E4F8450" Ref="R?"  Part="1" 
AR Path="/5E700726/5E4F8450" Ref="R71"  Part="1" 
AR Path="/5E71BF83/5E4F8450" Ref="R?"  Part="1" 
F 0 "R71" V 7118 3900 50  0000 C CNN
F 1 "10M" V 7209 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7255 3900 50  0001 C CNN
F 3 "~" H 7325 3900 50  0001 C CNN
	1    7325 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	7525 3900 7475 3900
Wire Wire Line
	7175 3900 7100 3900
Wire Wire Line
	7825 3900 8175 3900
Wire Wire Line
	8175 3900 8175 4025
Connection ~ 8175 4450
Wire Wire Line
	8175 4450 8025 4450
$Comp
L Device:C_Small C9
U 1 1 5E4F845E
P 8725 4025
AR Path="/5E4F7922/5E4F845E" Ref="C9"  Part="1" 
AR Path="/5E6561C0/5E4F845E" Ref="C?"  Part="1" 
AR Path="/5E65AD2D/5E4F845E" Ref="C?"  Part="1" 
AR Path="/5E65F56D/5E4F845E" Ref="C?"  Part="1" 
AR Path="/5E67D69E/5E4F845E" Ref="C?"  Part="1" 
AR Path="/5E700726/5E4F845E" Ref="C20"  Part="1" 
AR Path="/5E71BF83/5E4F845E" Ref="C?"  Part="1" 
F 0 "C20" V 8496 4025 50  0000 C CNN
F 1 "47p" V 8587 4025 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8725 4025 50  0001 C CNN
F 3 "~" H 8725 4025 50  0001 C CNN
	1    8725 4025
	0    1    1    0   
$EndComp
Wire Wire Line
	8625 4025 8175 4025
Connection ~ 8175 4025
Wire Wire Line
	8175 4025 8175 4450
Wire Wire Line
	8825 4025 9050 4025
Wire Wire Line
	9050 4025 9050 4550
Wire Wire Line
	9050 4550 8950 4550
$Comp
L Device:R_POT RV7
U 1 1 5E4F846B
P 9050 5075
AR Path="/5E4F7922/5E4F846B" Ref="RV7"  Part="1" 
AR Path="/5E6561C0/5E4F846B" Ref="RV?"  Part="1" 
AR Path="/5E65AD2D/5E4F846B" Ref="RV?"  Part="1" 
AR Path="/5E65F56D/5E4F846B" Ref="RV?"  Part="1" 
AR Path="/5E67D69E/5E4F846B" Ref="RV?"  Part="1" 
AR Path="/5E700726/5E4F846B" Ref="RV10"  Part="1" 
AR Path="/5E71BF83/5E4F846B" Ref="RV?"  Part="1" 
F 0 "RV10" H 8980 5029 50  0000 R CNN
F 1 "100k" H 8980 5120 50  0000 R CNN
F 2 "Eurocad:SongHuei9mmPot" H 9050 5075 50  0001 C CNN
F 3 "~" H 9050 5075 50  0001 C CNN
	1    9050 5075
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9050 4925 9050 4550
Connection ~ 9050 4550
$Comp
L Device:R R47
U 1 1 5E64510A
P 9050 5450
AR Path="/5E4F7922/5E64510A" Ref="R47"  Part="1" 
AR Path="/5E6561C0/5E64510A" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E64510A" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E64510A" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E64510A" Ref="R?"  Part="1" 
AR Path="/5E700726/5E64510A" Ref="R76"  Part="1" 
AR Path="/5E71BF83/5E64510A" Ref="R?"  Part="1" 
F 0 "R76" H 8980 5404 50  0000 R CNN
F 1 "11k" H 8980 5495 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8980 5450 50  0001 C CNN
F 3 "~" H 9050 5450 50  0001 C CNN
	1    9050 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	9050 5225 9050 5300
Wire Wire Line
	9050 5600 9050 5675
$Comp
L power:GND #PWR024
U 1 1 5E64510D
P 9050 5675
AR Path="/5E4F7922/5E64510D" Ref="#PWR024"  Part="1" 
AR Path="/5E6561C0/5E64510D" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E64510D" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E64510D" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E64510D" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E64510D" Ref="#PWR043"  Part="1" 
AR Path="/5E71BF83/5E64510D" Ref="#PWR?"  Part="1" 
F 0 "#PWR043" H 9050 5425 50  0001 C CNN
F 1 "GND" H 9055 5502 50  0000 C CNN
F 2 "" H 9050 5675 50  0001 C CNN
F 3 "" H 9050 5675 50  0001 C CNN
	1    9050 5675
	1    0    0    -1  
$EndComp
Text Notes 7875 5750 0    35   ~ 0
the relative values of these two\ndetermines the maximum amplification\nin maximally-exponential mode\nCurrently it is set for ~10x (at 5V CV)\nSo 20x at 10V CV\nThis should be enough to amplify\nup line level signals
Wire Wire Line
	7575 4750 7575 5075
Wire Wire Line
	7575 5075 8900 5075
$Comp
L power:+5V #PWR019
U 1 1 5E645110
P 6575 4450
AR Path="/5E4F7922/5E645110" Ref="#PWR019"  Part="1" 
AR Path="/5E6561C0/5E645110" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E645110" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E645110" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E645110" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E645110" Ref="#PWR038"  Part="1" 
AR Path="/5E71BF83/5E645110" Ref="#PWR?"  Part="1" 
F 0 "#PWR038" H 6575 4300 50  0001 C CNN
F 1 "+5V" V 6590 4578 50  0000 L CNN
F 2 "" H 6575 4450 50  0001 C CNN
F 3 "" H 6575 4450 50  0001 C CNN
	1    6575 4450
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR020
U 1 1 5E4F848C
P 7100 3900
AR Path="/5E4F7922/5E4F848C" Ref="#PWR020"  Part="1" 
AR Path="/5E6561C0/5E4F848C" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E4F848C" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E4F848C" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E4F848C" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E4F848C" Ref="#PWR039"  Part="1" 
AR Path="/5E71BF83/5E4F848C" Ref="#PWR?"  Part="1" 
F 0 "#PWR039" H 7100 3750 50  0001 C CNN
F 1 "+5V" V 7115 4028 50  0000 L CNN
F 2 "" H 7100 3900 50  0001 C CNN
F 3 "" H 7100 3900 50  0001 C CNN
	1    7100 3900
	0    -1   -1   0   
$EndComp
Connection ~ 8175 3900
$Comp
L Amplifier_Operational:TL074 U3
U 4 1 5E645117
P 8650 4550
AR Path="/5E4F7922/5E645117" Ref="U3"  Part="4" 
AR Path="/5E6561C0/5E645117" Ref="U?"  Part="4" 
AR Path="/5E65AD2D/5E645117" Ref="U?"  Part="4" 
AR Path="/5E65F56D/5E645117" Ref="U?"  Part="4" 
AR Path="/5E67D69E/5E645117" Ref="U?"  Part="4" 
AR Path="/5E700726/5E645117" Ref="U5"  Part="4" 
AR Path="/5E71BF83/5E645117" Ref="U?"  Part="4" 
F 0 "U5" H 8675 4375 50  0000 C CNN
F 1 "TL074" H 8625 4550 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8600 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 8700 4750 50  0001 C CNN
	4    8650 4550
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5E64511A
P 6500 3550
AR Path="/5E4F7922/5E64511A" Ref="#PWR018"  Part="1" 
AR Path="/5E6561C0/5E64511A" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E64511A" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E64511A" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E64511A" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E64511A" Ref="#PWR037"  Part="1" 
AR Path="/5E71BF83/5E64511A" Ref="#PWR?"  Part="1" 
F 0 "#PWR037" H 6500 3300 50  0001 C CNN
F 1 "GND" H 6505 3377 50  0000 C CNN
F 2 "" H 6500 3550 50  0001 C CNN
F 3 "" H 6500 3550 50  0001 C CNN
	1    6500 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6575 3525 6500 3525
Wire Wire Line
	6500 3525 6500 3550
$Comp
L Device:R R35
U 1 1 5E64511C
P 6250 3050
AR Path="/5E4F7922/5E64511C" Ref="R35"  Part="1" 
AR Path="/5E6561C0/5E64511C" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E64511C" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E64511C" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E64511C" Ref="R?"  Part="1" 
AR Path="/5E700726/5E64511C" Ref="R64"  Part="1" 
AR Path="/5E71BF83/5E64511C" Ref="R?"  Part="1" 
F 0 "R64" V 6043 3050 50  0000 C CNN
F 1 "100k" V 6134 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6180 3050 50  0001 C CNN
F 3 "~" H 6250 3050 50  0001 C CNN
	1    6250 3050
	0    1    1    0   
$EndComp
$Comp
L Device:R R36
U 1 1 5E64511F
P 6250 3400
AR Path="/5E4F7922/5E64511F" Ref="R36"  Part="1" 
AR Path="/5E6561C0/5E64511F" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E64511F" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E64511F" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E64511F" Ref="R?"  Part="1" 
AR Path="/5E700726/5E64511F" Ref="R65"  Part="1" 
AR Path="/5E71BF83/5E64511F" Ref="R?"  Part="1" 
F 0 "R65" V 6043 3400 50  0000 C CNN
F 1 "100k" V 6134 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6180 3400 50  0001 C CNN
F 3 "~" H 6250 3400 50  0001 C CNN
	1    6250 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	6050 4000 6050 3400
Wire Wire Line
	6050 3400 6100 3400
Wire Wire Line
	6100 3050 6025 3050
Wire Wire Line
	6025 3050 6025 2675
Wire Wire Line
	6025 2675 5875 2675
$Comp
L Device:R R39
U 1 1 5E645122
P 6925 3050
AR Path="/5E4F7922/5E645122" Ref="R39"  Part="1" 
AR Path="/5E6561C0/5E645122" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E645122" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E645122" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E645122" Ref="R?"  Part="1" 
AR Path="/5E700726/5E645122" Ref="R68"  Part="1" 
AR Path="/5E71BF83/5E645122" Ref="R?"  Part="1" 
F 0 "R68" V 6718 3050 50  0000 C CNN
F 1 "100k" V 6809 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6855 3050 50  0001 C CNN
F 3 "~" H 6925 3050 50  0001 C CNN
	1    6925 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	7075 3050 7275 3050
Wire Wire Line
	7275 3050 7275 3425
Wire Wire Line
	7275 3425 7175 3425
Connection ~ 7275 3425
Wire Wire Line
	7975 3425 8175 3425
Wire Wire Line
	8175 3425 8175 3900
Text Notes 6275 2275 0    50   ~ 0
I put this unity voltage mixer \nhere purely so that we can have\na combined CV indicator LED
Wire Wire Line
	6400 3050 6475 3050
Wire Wire Line
	6400 3400 6475 3400
Wire Wire Line
	6475 3400 6475 3325
Connection ~ 6475 3050
Wire Wire Line
	6475 3050 6775 3050
Wire Wire Line
	6575 3325 6475 3325
Connection ~ 6475 3325
Wire Wire Line
	6475 3325 6475 3050
$Comp
L Amplifier_Operational:TL074 U4
U 1 1 5E645126
P 11425 2425
AR Path="/5E4F7922/5E645126" Ref="U4"  Part="1" 
AR Path="/5E6561C0/5E645126" Ref="U?"  Part="1" 
AR Path="/5E65AD2D/5E645126" Ref="U?"  Part="1" 
AR Path="/5E65F56D/5E645126" Ref="U?"  Part="1" 
AR Path="/5E67D69E/5E645126" Ref="U?"  Part="1" 
AR Path="/5E700726/5E645126" Ref="U6"  Part="1" 
AR Path="/5E71BF83/5E645126" Ref="U?"  Part="1" 
F 0 "U6" H 11475 2250 50  0000 C CNN
F 1 "TL074" H 11400 2425 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 11375 2525 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 11475 2625 50  0001 C CNN
	1    11425 2425
	1    0    0    1   
$EndComp
Wire Wire Line
	11025 2525 11125 2525
$Comp
L Device:LED_Dual_2pin D2
U 1 1 5E645129
P 11675 1900
AR Path="/5E4F7922/5E645129" Ref="D2"  Part="1" 
AR Path="/5E6561C0/5E645129" Ref="D?"  Part="1" 
AR Path="/5E65AD2D/5E645129" Ref="D?"  Part="1" 
AR Path="/5E65F56D/5E645129" Ref="D?"  Part="1" 
AR Path="/5E67D69E/5E645129" Ref="D?"  Part="1" 
AR Path="/5E700726/5E645129" Ref="D4"  Part="1" 
AR Path="/5E71BF83/5E645129" Ref="D?"  Part="1" 
F 0 "D4" H 11675 2296 50  0000 C CNN
F 1 "Tayda A-1076" H 11675 1650 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 11675 1900 50  0001 C CNN
F 3 "~" H 11675 1900 50  0001 C CNN
	1    11675 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	11975 1900 12075 1900
Wire Wire Line
	12075 1900 12075 2425
Wire Wire Line
	12075 2425 11725 2425
Wire Wire Line
	11125 2325 11125 1900
Wire Wire Line
	11125 1900 11375 1900
Wire Wire Line
	11125 1900 10975 1900
Connection ~ 11125 1900
$Comp
L Device:R R51
U 1 1 5E4F84E1
P 10500 2850
AR Path="/5E4F7922/5E4F84E1" Ref="R51"  Part="1" 
AR Path="/5E6561C0/5E4F84E1" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E4F84E1" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E4F84E1" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E4F84E1" Ref="R?"  Part="1" 
AR Path="/5E700726/5E4F84E1" Ref="R80"  Part="1" 
AR Path="/5E71BF83/5E4F84E1" Ref="R?"  Part="1" 
F 0 "R80" H 10430 2804 50  0000 R CNN
F 1 "1M" H 10430 2895 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10430 2850 50  0001 C CNN
F 3 "~" H 10500 2850 50  0001 C CNN
	1    10500 2850
	-1   0    0    1   
$EndComp
$Comp
L Device:R R50
U 1 1 5E64512E
P 10500 2475
AR Path="/5E4F7922/5E64512E" Ref="R50"  Part="1" 
AR Path="/5E6561C0/5E64512E" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E64512E" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E64512E" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E64512E" Ref="R?"  Part="1" 
AR Path="/5E700726/5E64512E" Ref="R79"  Part="1" 
AR Path="/5E71BF83/5E64512E" Ref="R?"  Part="1" 
F 0 "R79" H 10430 2429 50  0000 R CNN
F 1 "1M" H 10430 2520 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10430 2475 50  0001 C CNN
F 3 "~" H 10500 2475 50  0001 C CNN
	1    10500 2475
	-1   0    0    1   
$EndComp
Wire Wire Line
	10500 3000 10500 3075
Wire Wire Line
	10500 2700 10500 2650
Wire Wire Line
	10500 2325 10500 2250
$Comp
L power:GND #PWR027
U 1 1 5E645131
P 10500 2250
AR Path="/5E4F7922/5E645131" Ref="#PWR027"  Part="1" 
AR Path="/5E6561C0/5E645131" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E645131" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E645131" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E645131" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E645131" Ref="#PWR046"  Part="1" 
AR Path="/5E71BF83/5E645131" Ref="#PWR?"  Part="1" 
F 0 "#PWR046" H 10500 2000 50  0001 C CNN
F 1 "GND" H 10505 2077 50  0000 C CNN
F 2 "" H 10500 2250 50  0001 C CNN
F 3 "" H 10500 2250 50  0001 C CNN
	1    10500 2250
	-1   0    0    1   
$EndComp
$Comp
L Device:R R53
U 1 1 5E645135
P 10825 1900
AR Path="/5E4F7922/5E645135" Ref="R53"  Part="1" 
AR Path="/5E6561C0/5E645135" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E645135" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E645135" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E645135" Ref="R?"  Part="1" 
AR Path="/5E700726/5E645135" Ref="R82"  Part="1" 
AR Path="/5E71BF83/5E645135" Ref="R?"  Part="1" 
F 0 "R82" V 11032 1900 50  0000 C CNN
F 1 "660R" V 10941 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10755 1900 50  0001 C CNN
F 3 "~" H 10825 1900 50  0001 C CNN
	1    10825 1900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR029
U 1 1 5E645137
P 10675 1900
AR Path="/5E4F7922/5E645137" Ref="#PWR029"  Part="1" 
AR Path="/5E6561C0/5E645137" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E645137" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E645137" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E645137" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E645137" Ref="#PWR048"  Part="1" 
AR Path="/5E71BF83/5E645137" Ref="#PWR?"  Part="1" 
F 0 "#PWR048" H 10675 1650 50  0001 C CNN
F 1 "GND" V 10680 1772 50  0000 R CNN
F 2 "" H 10675 1900 50  0001 C CNN
F 3 "" H 10675 1900 50  0001 C CNN
	1    10675 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	11025 2525 11025 2650
Wire Wire Line
	11025 2650 10500 2650
Connection ~ 10500 2650
Wire Wire Line
	10500 2650 10500 2625
Text Label 3650 3800 0    50   ~ 0
CVinB2
Wire Wire Line
	9050 4550 9500 4550
$Comp
L eurocad:PJ301M-12 J5
U 1 1 5E4F8513
P 3250 7025
AR Path="/5E4F7922/5E4F8513" Ref="J5"  Part="1" 
AR Path="/5E6561C0/5E4F8513" Ref="J?"  Part="1" 
AR Path="/5E65AD2D/5E4F8513" Ref="J?"  Part="1" 
AR Path="/5E65F56D/5E4F8513" Ref="J?"  Part="1" 
AR Path="/5E67D69E/5E4F8513" Ref="J?"  Part="1" 
AR Path="/5E700726/5E4F8513" Ref="J11"  Part="1" 
AR Path="/5E71BF83/5E4F8513" Ref="J?"  Part="1" 
F 0 "J11" H 2772 7009 50  0000 R CNN
F 1 "PJ301M-12" H 2772 7100 50  0000 R CNN
F 2 "Eurocad:PJ301M-12-MoreMetal" H 3250 7025 50  0001 C CNN
F 3 "" H 3250 7025 50  0000 C CNN
	1    3250 7025
	1    0    0    1   
$EndComp
Text Notes 2900 6850 0    50   ~ 0
In
Wire Wire Line
	3700 7175 3725 7175
Wire Wire Line
	3725 7175 3725 7350
$Comp
L power:GND #PWR013
U 1 1 5E4F8520
P 3725 7350
AR Path="/5E4F7922/5E4F8520" Ref="#PWR013"  Part="1" 
AR Path="/5E6561C0/5E4F8520" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E4F8520" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E4F8520" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E4F8520" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E4F8520" Ref="#PWR032"  Part="1" 
AR Path="/5E71BF83/5E4F8520" Ref="#PWR?"  Part="1" 
F 0 "#PWR032" H 3725 7100 50  0001 C CNN
F 1 "GND" H 3730 7177 50  0000 C CNN
F 2 "" H 3725 7350 50  0001 C CNN
F 3 "" H 3725 7350 50  0001 C CNN
	1    3725 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R25
U 1 1 5E645141
P 4200 6925
AR Path="/5E4F7922/5E645141" Ref="R25"  Part="1" 
AR Path="/5E6561C0/5E645141" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E645141" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E645141" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E645141" Ref="R?"  Part="1" 
AR Path="/5E700726/5E645141" Ref="R54"  Part="1" 
AR Path="/5E71BF83/5E645141" Ref="R?"  Part="1" 
F 0 "R54" V 3993 6925 50  0000 C CNN
F 1 "100k" V 4084 6925 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4130 6925 50  0001 C CNN
F 3 "~" H 4200 6925 50  0001 C CNN
	1    4200 6925
	0    1    1    0   
$EndComp
$Comp
L Device:R R30
U 1 1 5E645144
P 4550 7200
AR Path="/5E4F7922/5E645144" Ref="R30"  Part="1" 
AR Path="/5E6561C0/5E645144" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E645144" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E645144" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E645144" Ref="R?"  Part="1" 
AR Path="/5E700726/5E645144" Ref="R59"  Part="1" 
AR Path="/5E71BF83/5E645144" Ref="R?"  Part="1" 
F 0 "R59" H 4350 7250 50  0000 L CNN
F 1 "470R" H 4275 7175 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4480 7200 50  0001 C CNN
F 3 "~" H 4550 7200 50  0001 C CNN
	1    4550 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5E645147
P 4550 7550
AR Path="/5E4F7922/5E645147" Ref="C5"  Part="1" 
AR Path="/5E6561C0/5E645147" Ref="C?"  Part="1" 
AR Path="/5E65AD2D/5E645147" Ref="C?"  Part="1" 
AR Path="/5E65F56D/5E645147" Ref="C?"  Part="1" 
AR Path="/5E67D69E/5E645147" Ref="C?"  Part="1" 
AR Path="/5E700726/5E645147" Ref="C13"  Part="1" 
AR Path="/5E71BF83/5E645147" Ref="C?"  Part="1" 
F 0 "C13" H 4642 7596 50  0000 L CNN
F 1 "560p" H 4642 7505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 7550 50  0001 C CNN
F 3 "~" H 4550 7550 50  0001 C CNN
	1    4550 7550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5E4F853B
P 4550 7725
AR Path="/5E4F7922/5E4F853B" Ref="#PWR016"  Part="1" 
AR Path="/5E6561C0/5E4F853B" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E4F853B" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E4F853B" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E4F853B" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E4F853B" Ref="#PWR035"  Part="1" 
AR Path="/5E71BF83/5E4F853B" Ref="#PWR?"  Part="1" 
F 0 "#PWR035" H 4550 7475 50  0001 C CNN
F 1 "GND" H 4555 7552 50  0000 C CNN
F 2 "" H 4550 7725 50  0001 C CNN
F 3 "" H 4550 7725 50  0001 C CNN
	1    4550 7725
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 7650 4550 7725
Wire Wire Line
	4550 7350 4550 7450
Wire Wire Line
	4550 6925 4550 7050
Wire Wire Line
	4350 6925 4550 6925
Connection ~ 4550 6925
Wire Wire Line
	4550 6925 4975 6925
Text Label 3725 6925 0    50   ~ 0
InB
$Comp
L Amplifier_Operational:TL074 U4
U 2 1 5E64514F
P 6250 7025
AR Path="/5E4F7922/5E64514F" Ref="U4"  Part="2" 
AR Path="/5E6561C0/5E64514F" Ref="U?"  Part="2" 
AR Path="/5E65AD2D/5E64514F" Ref="U?"  Part="2" 
AR Path="/5E65F56D/5E64514F" Ref="U?"  Part="2" 
AR Path="/5E67D69E/5E64514F" Ref="U?"  Part="2" 
AR Path="/5E700726/5E64514F" Ref="U6"  Part="2" 
AR Path="/5E71BF83/5E64514F" Ref="U?"  Part="2" 
F 0 "U6" H 6325 6875 50  0000 C CNN
F 1 "TL074" H 6200 7025 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6200 7125 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 6300 7225 50  0001 C CNN
	2    6250 7025
	1    0    0    1   
$EndComp
$Comp
L Device:R R37
U 1 1 5E4F8550
P 6275 6650
AR Path="/5E4F7922/5E4F8550" Ref="R37"  Part="1" 
AR Path="/5E6561C0/5E4F8550" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E4F8550" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E4F8550" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E4F8550" Ref="R?"  Part="1" 
AR Path="/5E700726/5E4F8550" Ref="R66"  Part="1" 
AR Path="/5E71BF83/5E4F8550" Ref="R?"  Part="1" 
F 0 "R66" V 6275 6650 50  0000 C CNN
F 1 "100k" V 6200 6650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6205 6650 50  0001 C CNN
F 3 "~" H 6275 6650 50  0001 C CNN
	1    6275 6650
	0    1    1    0   
$EndComp
Wire Wire Line
	9500 5975 9500 4550
Wire Wire Line
	5175 5975 5175 6625
Wire Wire Line
	5950 6925 5825 6925
Wire Wire Line
	6175 6325 5825 6325
Wire Wire Line
	5825 6325 5825 6650
Connection ~ 5825 6925
Wire Wire Line
	5825 6925 5625 6925
Wire Wire Line
	6125 6650 5825 6650
Connection ~ 5825 6650
Wire Wire Line
	5825 6650 5825 6925
Wire Wire Line
	6550 7025 6675 7025
Wire Wire Line
	6425 6650 6675 6650
Connection ~ 6675 7025
Wire Wire Line
	6375 6325 6675 6325
Wire Wire Line
	6675 6325 6675 6650
Connection ~ 6675 6650
Wire Wire Line
	6675 6650 6675 7025
Wire Wire Line
	5950 7125 5825 7125
Wire Wire Line
	5825 7125 5825 7225
$Comp
L power:GND #PWR017
U 1 1 5E4F856B
P 5825 7225
AR Path="/5E4F7922/5E4F856B" Ref="#PWR017"  Part="1" 
AR Path="/5E6561C0/5E4F856B" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E4F856B" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E4F856B" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E4F856B" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E4F856B" Ref="#PWR036"  Part="1" 
AR Path="/5E71BF83/5E4F856B" Ref="#PWR?"  Part="1" 
F 0 "#PWR036" H 5825 6975 50  0001 C CNN
F 1 "GND" H 5830 7052 50  0000 C CNN
F 2 "" H 5825 7225 50  0001 C CNN
F 3 "" H 5825 7225 50  0001 C CNN
	1    5825 7225
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL074 U3
U 3 1 5E4F8571
P 6875 3425
AR Path="/5E4F7922/5E4F8571" Ref="U3"  Part="3" 
AR Path="/5E6561C0/5E4F8571" Ref="U?"  Part="3" 
AR Path="/5E65AD2D/5E4F8571" Ref="U?"  Part="3" 
AR Path="/5E65F56D/5E4F8571" Ref="U?"  Part="3" 
AR Path="/5E67D69E/5E4F8571" Ref="U?"  Part="3" 
AR Path="/5E700726/5E4F8571" Ref="U5"  Part="3" 
AR Path="/5E71BF83/5E4F8571" Ref="U?"  Part="3" 
F 0 "U5" H 6900 3250 50  0000 C CNN
F 1 "TL074" H 6850 3425 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6825 3525 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 6925 3625 50  0001 C CNN
	3    6875 3425
	1    0    0    1   
$EndComp
$Comp
L Device:R R45
U 1 1 5E64515A
P 7925 6750
AR Path="/5E4F7922/5E64515A" Ref="R45"  Part="1" 
AR Path="/5E6561C0/5E64515A" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E64515A" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E64515A" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E64515A" Ref="R?"  Part="1" 
AR Path="/5E700726/5E64515A" Ref="R74"  Part="1" 
AR Path="/5E71BF83/5E64515A" Ref="R?"  Part="1" 
F 0 "R74" V 7825 6750 50  0000 C CNN
F 1 "4.7k" V 7925 6750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7855 6750 50  0001 C CNN
F 3 "~" H 7925 6750 50  0001 C CNN
	1    7925 6750
	0    1    1    0   
$EndComp
$Comp
L Device:R R40
U 1 1 5E4F857F
P 7150 7025
AR Path="/5E4F7922/5E4F857F" Ref="R40"  Part="1" 
AR Path="/5E6561C0/5E4F857F" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E4F857F" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E4F857F" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E4F857F" Ref="R?"  Part="1" 
AR Path="/5E700726/5E4F857F" Ref="R69"  Part="1" 
AR Path="/5E71BF83/5E4F857F" Ref="R?"  Part="1" 
F 0 "R69" V 7050 7025 50  0000 C CNN
F 1 "4.7k" V 7150 7025 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7080 7025 50  0001 C CNN
F 3 "~" H 7150 7025 50  0001 C CNN
	1    7150 7025
	0    1    1    0   
$EndComp
Wire Wire Line
	6675 7025 7000 7025
Wire Wire Line
	7550 7025 7450 7025
$Comp
L Device:C_Small C8
U 1 1 5E4F8588
P 7925 6475
AR Path="/5E4F7922/5E4F8588" Ref="C8"  Part="1" 
AR Path="/5E6561C0/5E4F8588" Ref="C?"  Part="1" 
AR Path="/5E65AD2D/5E4F8588" Ref="C?"  Part="1" 
AR Path="/5E65F56D/5E4F8588" Ref="C?"  Part="1" 
AR Path="/5E67D69E/5E4F8588" Ref="C?"  Part="1" 
AR Path="/5E700726/5E4F8588" Ref="C19"  Part="1" 
AR Path="/5E71BF83/5E4F8588" Ref="C?"  Part="1" 
F 0 "C19" V 7700 6475 50  0000 C CNN
F 1 "100p" V 7787 6475 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7925 6475 50  0001 C CNN
F 3 "~" H 7925 6475 50  0001 C CNN
	1    7925 6475
	0    1    1    0   
$EndComp
Wire Wire Line
	7825 6475 7450 6475
Wire Wire Line
	7450 6475 7450 6750
Connection ~ 7450 7025
Wire Wire Line
	7450 7025 7300 7025
Wire Wire Line
	7775 6750 7450 6750
Connection ~ 7450 6750
Wire Wire Line
	7450 6750 7450 7025
Wire Wire Line
	8250 7125 8150 7125
Wire Wire Line
	8075 6750 8250 6750
Wire Wire Line
	8025 6475 8250 6475
Wire Wire Line
	8250 6475 8250 6750
Connection ~ 8250 6750
Wire Wire Line
	8250 6750 8250 7125
$Comp
L Device:R R46
U 1 1 5E645163
P 8575 7125
AR Path="/5E4F7922/5E645163" Ref="R46"  Part="1" 
AR Path="/5E6561C0/5E645163" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E645163" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E645163" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E645163" Ref="R?"  Part="1" 
AR Path="/5E700726/5E645163" Ref="R75"  Part="1" 
AR Path="/5E71BF83/5E645163" Ref="R?"  Part="1" 
F 0 "R75" V 8475 7125 50  0000 C CNN
F 1 "470R" V 8675 7125 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8505 7125 50  0001 C CNN
F 3 "~" H 8575 7125 50  0001 C CNN
	1    8575 7125
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5E645166
P 6275 6325
AR Path="/5E4F7922/5E645166" Ref="C6"  Part="1" 
AR Path="/5E6561C0/5E645166" Ref="C?"  Part="1" 
AR Path="/5E65AD2D/5E645166" Ref="C?"  Part="1" 
AR Path="/5E65F56D/5E645166" Ref="C?"  Part="1" 
AR Path="/5E67D69E/5E645166" Ref="C?"  Part="1" 
AR Path="/5E700726/5E645166" Ref="C16"  Part="1" 
AR Path="/5E71BF83/5E645166" Ref="C?"  Part="1" 
F 0 "C16" V 6046 6325 50  0000 C CNN
F 1 "47p" V 6137 6325 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6275 6325 50  0001 C CNN
F 3 "~" H 6275 6325 50  0001 C CNN
	1    6275 6325
	0    1    1    0   
$EndComp
Wire Wire Line
	7550 7225 7425 7225
Wire Wire Line
	7425 7225 7425 7325
$Comp
L power:GND #PWR022
U 1 1 5E64516A
P 7425 7325
AR Path="/5E4F7922/5E64516A" Ref="#PWR022"  Part="1" 
AR Path="/5E6561C0/5E64516A" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E64516A" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E64516A" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E64516A" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E64516A" Ref="#PWR041"  Part="1" 
AR Path="/5E71BF83/5E64516A" Ref="#PWR?"  Part="1" 
F 0 "#PWR041" H 7425 7075 50  0001 C CNN
F 1 "GND" H 7430 7152 50  0000 C CNN
F 2 "" H 7425 7325 50  0001 C CNN
F 3 "" H 7425 7325 50  0001 C CNN
	1    7425 7325
	1    0    0    -1  
$EndComp
$Comp
L eurocad:PJ301M-12 J6
U 1 1 5E64516C
P 9700 7225
AR Path="/5E4F7922/5E64516C" Ref="J6"  Part="1" 
AR Path="/5E6561C0/5E64516C" Ref="J?"  Part="1" 
AR Path="/5E65AD2D/5E64516C" Ref="J?"  Part="1" 
AR Path="/5E65F56D/5E64516C" Ref="J?"  Part="1" 
AR Path="/5E67D69E/5E64516C" Ref="J?"  Part="1" 
AR Path="/5E700726/5E64516C" Ref="J12"  Part="1" 
AR Path="/5E71BF83/5E64516C" Ref="J?"  Part="1" 
F 0 "J12" H 9222 7209 50  0000 R CNN
F 1 "PJ301M-12" H 9222 7300 50  0000 R CNN
F 2 "Eurocad:PJ301M-12-MoreMetal" H 9700 7225 50  0001 C CNN
F 3 "" H 9700 7225 50  0000 C CNN
	1    9700 7225
	-1   0    0    1   
$EndComp
Wire Wire Line
	9250 7125 8725 7125
Text Label 9025 7125 0    50   ~ 0
OutB
Wire Wire Line
	8425 7125 8375 7125
Connection ~ 8250 7125
Text Notes 5750 7575 0    50   ~ 0
Inverting buffer (1x gain)
Text Notes 7425 7600 0    50   ~ 0
Inverting buffer (1x gain)
$Comp
L power:GND #PWR025
U 1 1 5E64516E
P 9200 7450
AR Path="/5E4F7922/5E64516E" Ref="#PWR025"  Part="1" 
AR Path="/5E6561C0/5E64516E" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E64516E" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E64516E" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E64516E" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E64516E" Ref="#PWR044"  Part="1" 
AR Path="/5E71BF83/5E64516E" Ref="#PWR?"  Part="1" 
F 0 "#PWR044" H 9200 7200 50  0001 C CNN
F 1 "GND" H 9205 7277 50  0000 C CNN
F 2 "" H 9200 7450 50  0001 C CNN
F 3 "" H 9200 7450 50  0001 C CNN
	1    9200 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 7375 9200 7375
Wire Wire Line
	9200 7375 9200 7450
Text Notes 8300 5075 0    50   ~ 0
exp/lin control
Wire Wire Line
	9250 7225 9000 7225
Wire Wire Line
	9000 7225 9000 7825
Text GLabel 11250 7825 2    50   Input ~ 0
OutB_norm
Text Notes 4925 4325 0    50   ~ 0
QUESTION: do we need caps \non these feedback paths?\n
Wire Wire Line
	10850 5700 10950 5700
$Comp
L Device:LED_Dual_2pin D1
U 1 1 5E4F85D4
P 11500 5075
AR Path="/5E4F7922/5E4F85D4" Ref="D1"  Part="1" 
AR Path="/5E6561C0/5E4F85D4" Ref="D?"  Part="1" 
AR Path="/5E65AD2D/5E4F85D4" Ref="D?"  Part="1" 
AR Path="/5E65F56D/5E4F85D4" Ref="D?"  Part="1" 
AR Path="/5E67D69E/5E4F85D4" Ref="D?"  Part="1" 
AR Path="/5E700726/5E4F85D4" Ref="D3"  Part="1" 
AR Path="/5E71BF83/5E4F85D4" Ref="D?"  Part="1" 
F 0 "D3" H 11500 5471 50  0000 C CNN
F 1 "Tayda A-1076" H 11500 5380 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 11500 5075 50  0001 C CNN
F 3 "~" H 11500 5075 50  0001 C CNN
	1    11500 5075
	1    0    0    -1  
$EndComp
Wire Wire Line
	11800 5075 11900 5075
Wire Wire Line
	11900 5075 11900 5600
Wire Wire Line
	11900 5600 11550 5600
Wire Wire Line
	10950 5500 10950 5075
Wire Wire Line
	10950 5075 11200 5075
Wire Wire Line
	10950 5075 10800 5075
Connection ~ 10950 5075
$Comp
L Device:R R49
U 1 1 5E4F85E2
P 10325 6025
AR Path="/5E4F7922/5E4F85E2" Ref="R49"  Part="1" 
AR Path="/5E6561C0/5E4F85E2" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E4F85E2" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E4F85E2" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E4F85E2" Ref="R?"  Part="1" 
AR Path="/5E700726/5E4F85E2" Ref="R78"  Part="1" 
AR Path="/5E71BF83/5E4F85E2" Ref="R?"  Part="1" 
F 0 "R78" H 10255 5979 50  0000 R CNN
F 1 "1M" H 10255 6070 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10255 6025 50  0001 C CNN
F 3 "~" H 10325 6025 50  0001 C CNN
	1    10325 6025
	-1   0    0    1   
$EndComp
$Comp
L Device:R R48
U 1 1 5E645179
P 10325 5650
AR Path="/5E4F7922/5E645179" Ref="R48"  Part="1" 
AR Path="/5E6561C0/5E645179" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E645179" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E645179" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E645179" Ref="R?"  Part="1" 
AR Path="/5E700726/5E645179" Ref="R77"  Part="1" 
AR Path="/5E71BF83/5E645179" Ref="R?"  Part="1" 
F 0 "R77" H 10255 5604 50  0000 R CNN
F 1 "1M" H 10255 5695 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10255 5650 50  0001 C CNN
F 3 "~" H 10325 5650 50  0001 C CNN
	1    10325 5650
	-1   0    0    1   
$EndComp
Wire Wire Line
	10325 5875 10325 5825
Wire Wire Line
	10325 5500 10325 5425
$Comp
L power:GND #PWR026
U 1 1 5E64517A
P 10325 5425
AR Path="/5E4F7922/5E64517A" Ref="#PWR026"  Part="1" 
AR Path="/5E6561C0/5E64517A" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E64517A" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E64517A" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E64517A" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E64517A" Ref="#PWR045"  Part="1" 
AR Path="/5E71BF83/5E64517A" Ref="#PWR?"  Part="1" 
F 0 "#PWR045" H 10325 5175 50  0001 C CNN
F 1 "GND" H 10330 5252 50  0000 C CNN
F 2 "" H 10325 5425 50  0001 C CNN
F 3 "" H 10325 5425 50  0001 C CNN
	1    10325 5425
	-1   0    0    1   
$EndComp
$Comp
L Device:R R52
U 1 1 5E64517E
P 10650 5075
AR Path="/5E4F7922/5E64517E" Ref="R52"  Part="1" 
AR Path="/5E6561C0/5E64517E" Ref="R?"  Part="1" 
AR Path="/5E65AD2D/5E64517E" Ref="R?"  Part="1" 
AR Path="/5E65F56D/5E64517E" Ref="R?"  Part="1" 
AR Path="/5E67D69E/5E64517E" Ref="R?"  Part="1" 
AR Path="/5E700726/5E64517E" Ref="R81"  Part="1" 
AR Path="/5E71BF83/5E64517E" Ref="R?"  Part="1" 
F 0 "R81" V 10857 5075 50  0000 C CNN
F 1 "660R" V 10766 5075 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10580 5075 50  0001 C CNN
F 3 "~" H 10650 5075 50  0001 C CNN
	1    10650 5075
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5E645181
P 10500 5075
AR Path="/5E4F7922/5E645181" Ref="#PWR028"  Part="1" 
AR Path="/5E6561C0/5E645181" Ref="#PWR?"  Part="1" 
AR Path="/5E65AD2D/5E645181" Ref="#PWR?"  Part="1" 
AR Path="/5E65F56D/5E645181" Ref="#PWR?"  Part="1" 
AR Path="/5E67D69E/5E645181" Ref="#PWR?"  Part="1" 
AR Path="/5E700726/5E645181" Ref="#PWR047"  Part="1" 
AR Path="/5E71BF83/5E645181" Ref="#PWR?"  Part="1" 
F 0 "#PWR047" H 10500 4825 50  0001 C CNN
F 1 "GND" V 10505 4947 50  0000 R CNN
F 2 "" H 10500 5075 50  0001 C CNN
F 3 "" H 10500 5075 50  0001 C CNN
	1    10500 5075
	0    1    1    0   
$EndComp
Wire Wire Line
	10850 5700 10850 5825
Wire Wire Line
	10850 5825 10325 5825
Connection ~ 10325 5825
Wire Wire Line
	10325 5825 10325 5800
Wire Wire Line
	7275 3425 7450 3425
Wire Wire Line
	10500 3075 7450 3075
Wire Wire Line
	7450 3075 7450 3425
Connection ~ 7450 3425
Wire Wire Line
	7450 3425 7675 3425
Wire Wire Line
	10325 6175 10325 6700
Wire Wire Line
	10325 6700 8375 6700
Wire Wire Line
	8375 6700 8375 7125
Connection ~ 8375 7125
Wire Wire Line
	8375 7125 8250 7125
Text Notes 11425 2750 0    50   ~ 0
CV indicator
Text Notes 11275 5950 0    50   ~ 0
Out indicator
Wire Wire Line
	9000 7825 11250 7825
Wire Wire Line
	5175 5975 9500 5975
Text Notes 3700 8250 0    50   ~ 0
Normalize to InB!
Wire Wire Line
	3975 2475 3975 2325
Connection ~ 3975 2475
Wire Wire Line
	3975 2475 4100 2475
Text GLabel 3975 2325 0    50   Input ~ 0
CVinB1
Text GLabel 4025 8025 3    50   Input ~ 0
InB
Text GLabel 3900 7400 3    50   Input ~ 0
InB_norm
Wire Wire Line
	3700 6925 4025 6925
Wire Wire Line
	3900 7400 3900 7025
Wire Wire Line
	3700 7025 3900 7025
Connection ~ 4025 6925
Wire Wire Line
	4025 6925 4050 6925
Text GLabel 3800 3975 3    50   Input ~ 0
CVinB2_norm
Wire Wire Line
	3800 3975 3800 3900
Wire Wire Line
	3800 3900 3625 3900
Text GLabel 3775 2750 3    50   Input ~ 0
CVinB1_norm
Wire Wire Line
	3675 2725 3625 2725
Wire Wire Line
	3775 2750 3775 2575
Wire Wire Line
	3775 2575 3625 2575
Wire Wire Line
	4025 6925 4025 8025
$Comp
L Amplifier_Operational:TL074 U4
U 4 1 5E645185
P 11250 5600
AR Path="/5E4F7922/5E645185" Ref="U4"  Part="4" 
AR Path="/5E6561C0/5E645185" Ref="U?"  Part="4" 
AR Path="/5E65AD2D/5E645185" Ref="U?"  Part="4" 
AR Path="/5E65F56D/5E645185" Ref="U?"  Part="4" 
AR Path="/5E67D69E/5E645185" Ref="U?"  Part="4" 
AR Path="/5E700726/5E645185" Ref="U6"  Part="4" 
AR Path="/5E71BF83/5E645185" Ref="U?"  Part="4" 
F 0 "U6" H 11275 5425 50  0000 C CNN
F 1 "TL074" H 11225 5600 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 11200 5700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 11300 5800 50  0001 C CNN
	4    11250 5600
	1    0    0    1   
$EndComp
Wire Wire Line
	8175 4450 8350 4450
Wire Wire Line
	8200 4650 8350 4650
Text Notes 7875 5300 0    35   ~ 0
Pot orientated so that CW = exp
Text Notes 7450 2950 0    50   ~ 0
We need a -ve voltage here for gain > 0.
Text Notes 7450 3025 0    50   ~ 0
-5V gives 1x gain (in linear mode)
Text Notes 2725 5325 0    50   ~ 0
If CV pot has wiper shorted to ground:\n+ve CV in gets inverted twice for +ve CV into the VCA, which gives -ve gain\nSo let that be the slider "down", not up\n\nRecall : pin 3 to be orientated at top
Text Notes 11075 1475 0    50   ~ 0
Let pin 1 be the long pin\nThen -ve voltage at the opamp + pin\nmakes the light green\n
Text Notes 10850 4550 0    50   ~ 0
Let pin 1 be the long pin\nThen -ve voltage at the opamp + pin\nmakes the light red\n
Text Label 12075 2400 0    50   ~ 0
B_cvLED
Text Label 11900 5550 0    50   ~ 0
B_outLED
$Comp
L eurocad:V2164M U2
U 3 1 5E645186
P 7575 4450
AR Path="/5E700726/5E645186" Ref="U2"  Part="3" 
AR Path="/5E71BF83/5E645186" Ref="U?"  Part="3" 
F 0 "U2" H 7700 4815 50  0000 C CNN
F 1 "V2164M" H 7700 4724 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 7525 4500 50  0001 C CNN
F 3 "" H 7525 4500 50  0001 C CNN
	3    7575 4450
	1    0    0    -1  
$EndComp
$Comp
L eurocad:V2164M U2
U 4 1 5E710F46
P 5175 6925
AR Path="/5E700726/5E710F46" Ref="U2"  Part="4" 
AR Path="/5E71BF83/5E710F46" Ref="U?"  Part="4" 
F 0 "U2" H 5300 7197 50  0000 C CNN
F 1 "V2164M" H 5300 7288 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5125 6975 50  0001 C CNN
F 3 "" H 5125 6975 50  0001 C CNN
	4    5175 6925
	1    0    0    1   
$EndComp
Wire Wire Line
	5400 3275 5050 3275
Wire Wire Line
	5050 3275 5050 3600
Wire Wire Line
	5600 3275 5875 3275
$Comp
L Device:C_Small C?
U 1 1 5E61C183
P 5500 3275
AR Path="/5E4F7922/5E61C183" Ref="C?"  Part="1" 
AR Path="/5E6561C0/5E61C183" Ref="C?"  Part="1" 
AR Path="/5E65AD2D/5E61C183" Ref="C?"  Part="1" 
AR Path="/5E65F56D/5E61C183" Ref="C?"  Part="1" 
AR Path="/5E67D69E/5E61C183" Ref="C?"  Part="1" 
AR Path="/5E700726/5E61C183" Ref="C15"  Part="1" 
AR Path="/5E71BF81/5E61C183" Ref="C?"  Part="1" 
F 0 "C15" V 5271 3275 50  0000 C CNN
F 1 "47p" V 5362 3275 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5500 3275 50  0001 C CNN
F 3 "~" H 5500 3275 50  0001 C CNN
	1    5500 3275
	0    1    1    0   
$EndComp
Wire Wire Line
	5875 3600 5875 3275
Connection ~ 5875 3600
Wire Wire Line
	5400 1950 5050 1950
Wire Wire Line
	5050 1950 5050 2275
Wire Wire Line
	5600 1950 5875 1950
$Comp
L Device:C_Small C?
U 1 1 5E62D94B
P 5500 1950
AR Path="/5E4F7922/5E62D94B" Ref="C?"  Part="1" 
AR Path="/5E6561C0/5E62D94B" Ref="C?"  Part="1" 
AR Path="/5E65AD2D/5E62D94B" Ref="C?"  Part="1" 
AR Path="/5E65F56D/5E62D94B" Ref="C?"  Part="1" 
AR Path="/5E67D69E/5E62D94B" Ref="C?"  Part="1" 
AR Path="/5E700726/5E62D94B" Ref="C14"  Part="1" 
AR Path="/5E71BF81/5E62D94B" Ref="C?"  Part="1" 
F 0 "C14" V 5271 1950 50  0000 C CNN
F 1 "47p" V 5362 1950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5500 1950 50  0001 C CNN
F 3 "~" H 5500 1950 50  0001 C CNN
	1    5500 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	5875 2275 5875 1950
Connection ~ 5875 2275
Wire Wire Line
	6800 2725 6475 2725
Wire Wire Line
	7000 2725 7275 2725
$Comp
L Device:C_Small C?
U 1 1 5E63FFF1
P 6900 2725
AR Path="/5E4F7922/5E63FFF1" Ref="C?"  Part="1" 
AR Path="/5E6561C0/5E63FFF1" Ref="C?"  Part="1" 
AR Path="/5E65AD2D/5E63FFF1" Ref="C?"  Part="1" 
AR Path="/5E65F56D/5E63FFF1" Ref="C?"  Part="1" 
AR Path="/5E67D69E/5E63FFF1" Ref="C?"  Part="1" 
AR Path="/5E700726/5E63FFF1" Ref="C17"  Part="1" 
AR Path="/5E71BF81/5E63FFF1" Ref="C?"  Part="1" 
F 0 "C17" V 6671 2725 50  0000 C CNN
F 1 "47p" V 6762 2725 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6900 2725 50  0001 C CNN
F 3 "~" H 6900 2725 50  0001 C CNN
	1    6900 2725
	0    1    1    0   
$EndComp
Wire Wire Line
	7275 3050 7275 2725
Wire Wire Line
	6475 3050 6475 2725
$EndSCHEMATC
