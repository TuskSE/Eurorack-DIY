#include <Arduino.h>
#include <Metro.h> 
#include <WS2812Serial.h>
#include <i2c_t3.h>
#include "Settings.h"
#include "Adafruit_MPR121.h"
//#include "LEDcontrol.h"
#include "PinDefs.h"
#include "DigitalIO.h"
#include "ModeManager.h"
#include "AnalogOut.h"
#include "TrigOutManager.h"
#include <SPI.h>
#include "RandomNumberGen.h"
//#include "AnalogIn.h"

//Set up LED display params
const int NumLEDs = 12;
byte drawingMemory[NumLEDs*3];         //  3 bytes per LED
DMAMEM byte displayMemory[NumLEDs*12]; // 12 bytes per LED
WS2812Serial leds(NumLEDs, displayMemory, drawingMemory, WS2812_serialPin, WS2812_GRB);

//Set up addressible LEDs
LEDpixel LED_select;
LEDpixel LED_chA;
LEDpixel LED_chB;
LEDpixel LED_chC;
LEDpixel LED_stages[8]; //We will finish setting these up later setup(). Led_stages[0] corresponds to the leftmost channel

//Set up random number generator
RandomNumberGenerator RNG;

void UpdateLeds(){
  //This will update the display of all LEDs
  leds.setPixel(LED_select.Coordinate(), LED_select.CommunicateOutputColor());
  leds.setPixel(LED_chA.Coordinate(), LED_chA.CommunicateOutputColor());
  leds.setPixel(LED_chB.Coordinate(), LED_chB.CommunicateOutputColor());
  leds.setPixel(LED_chC.Coordinate(), LED_chC.CommunicateOutputColor());
  for (int i=0; i<8; i++){
    leds.setPixel(LED_stages[i].Coordinate(), LED_stages[i].CommunicateOutputColor());
  }
  leds.show();
}

//Set up Capacitave touch buttons
#ifndef _BV
#define _BV(bit) (1 << (bit)) 
#endif
Adafruit_MPR121 capTouch = Adafruit_MPR121();
uint16_t capTouch_lasttouched = 0;
uint16_t capTouch_currtouched = 0;

//Set up IO management
DigiIOManager DIO;
AnalogOutManager AO;
AnalogInManager AI;
TrigOutManager DO_ResetAll(TriggerLengthInMicroseconds);
TrigOutManager DO_ResetA(TriggerLengthInMicroseconds);
TrigOutManager DO_ResetB(TriggerLengthInMicroseconds);
TrigOutManager DO_ResetC(TriggerLengthInMicroseconds);
TrigOutManager DO_TriggerAll(TriggerLengthInMicroseconds);
TrigOutManager DO_TriggerA(TriggerLengthInMicroseconds);
TrigOutManager DO_TriggerB(TriggerLengthInMicroseconds);
TrigOutManager DO_TriggerC(TriggerLengthInMicroseconds);

//set up stage manager
stageManager SM;

//Set up mode management
ModeManager ModeManagerAll;

//set up cycle manager
cycleManager cycleA,cycleB,cycleC;

//Set up temporary variables
int i, j;


//temp test
void print_scan_status(uint8_t target, uint8_t all);

uint8_t found, target, all;


void setup() {
  //Wire.begin(); 
  Serial.begin(9600);

  //Set up LED addresses 
  leds.begin();

	//Set up addressible LEDs
	LED_select.SetCoordinate (11);
	LED_select.SetMasterBrightnessValues(MasterBrightness, MaxBrightness);
	LED_chA.SetCoordinate (10);
	LED_chA.SetMasterBrightnessValues(MasterBrightness, MaxBrightness);
	LED_chB.SetCoordinate (9);
	LED_chB.SetMasterBrightnessValues(MasterBrightness, MaxBrightness);
	LED_chC.SetCoordinate (8);
	LED_chC.SetMasterBrightnessValues(MasterBrightness, MaxBrightness);

  for(i = 0; i<8; i++){
    LED_stages[i].SetCoordinate(7-i);
    LED_stages[i].SetMasterBrightnessValues(MasterBrightness, MaxBrightness);
  } 

	

  if(LEDstartupSequence){
					
			//An unneccessary little startup sequence
			for (j=0; j<8; j++){
					LED_stages[j].AddColor(Clr_green,25);
					//leds.setPixel(LED_stages[j].Coordinate(), LED_stages[j].CommunicateOutputColor());
					//leds.show();
					delay(200);
					UpdateLeds();
					LED_stages[j].ClearInstructions();
			}
			UpdateLeds();
			LED_chA.AddColor(Clr_red,20);
			LED_chB.AddColor(Clr_green,20);
			LED_chC.AddColor(Clr_blue,20);
			LED_select.AddColor(Clr_white,20);
			UpdateLeds();
			delay(200);
			LED_chA.ClearInstructions();
			LED_chB.ClearInstructions();
			LED_chC.ClearInstructions();
			LED_select.ClearInstructions();
			UpdateLeds();
 
  }

	


	//Set up touch buttons
    Wire.begin(I2C_MASTER, 0x00, I2C_PINS_18_19, I2C_PULLUP_EXT, 400000);
    Wire.setDefaultTimeout(10000); // 10ms
	if (!capTouch.begin(0x5A, &Wire, 12, 6)) {
		Serial.println("MPR121 not found, check wiring?");
		while (1);
	}
  	
	  
	//set up analog out
	Wire1.begin(I2C_MASTER, 0x00, I2C_PINS_22_23, I2C_PULLUP_EXT, 10000);
	Wire1.setDefaultTimeout(10000); // 10ms
	pinMode(Dout_DAC_A_LDACpin, OUTPUT);
	pinMode(Dout_DAC_B_LDACpin, OUTPUT);
	pinMode(Dout_DAC_C_LDACpin, OUTPUT);
	SM.initialize();
	AO.assignWire(&Wire1);
	delay(2);
	AO.setI2CaddressAll();
	delay(2);
	AO.setVoltageReferenceAllInternal(true);
	delay(2);
	AO.setGainAll2x(false);

	//set up analog in
	AI.initialize();
	Serial.println("MPR121 found!");




	//set up digital IO
	DIO.SetupDout(Dout_SERpin, Dout_LATCHpin, Dout_CLKpin);
	DIO.SetupDin(Din_SERpin, Din_latchPin, Din_CLKpin);

	//Read digital IO states
	DIO.ReadAllDigitalIn();
	ModeManagerAll.UpdateSwitchStates(DIO.ReportSwStates1(),DIO.ReportSwStates2());

	//Make sure trigger outputs are at 0
	DIO.UpdateTriggerOutputs(false,false,false,false,false,false);

	// Give the mode manager pointers to let it control the LEDs
	ModeManagerAll.assignSelChLEDS(&LED_select, &LED_chA, &LED_chB, &LED_chC);
	for(i = 0; i<8; i++){
		ModeManagerAll.assignStageLED(&LED_stages[i], i);
   	} 
	// Read in channel colors from the settings file
	ModeManagerAll.LoadChanelColorsFromSettings(Clr_ChA, Clr_ChB, Clr_ChC);

	// Finish setting up the mode manager
	ModeManagerAll.ResetAllCycles();

	// Set up RNG
	RNG.initialize();

	// set up cycle managers
	cycleA.initialize(&RNG,&ModeManagerAll,&AI,'A');
	cycleB.initialize(&RNG,&ModeManagerAll,&AI,'B');
	cycleC.initialize(&RNG,&ModeManagerAll,&AI,'C');

}

void loop() {
	//Read Digital inputs
	DIO.ReadAllDigitalIn();
	//Update switch states
	if(DIO.SwitchStateChanged()){
		ModeManagerAll.UpdateSwitchStates(DIO.ReportSwStates1(),DIO.ReportSwStates2());
	}
	//Update Norm probes
	if(DIO.NormalizationStateChanged()){
		SM.UpdateNormalizationStates(DIO.ReportNormProbes());
		//AO.PrintNormalizationStates();
	}
	
	//Update Quantization settings
	SM.UpdateQuantization(ModeManagerAll.quantizationA,ModeManagerAll.quantizationB,ModeManagerAll.quantizationC);
	
	//Update digital outputs
	DIO.UpdateTriggerOutputs(DO_ResetA.ShouldWeBeOutputting(), DO_ResetB.ShouldWeBeOutputting(), DO_ResetC.ShouldWeBeOutputting(), DO_TriggerA.ShouldWeBeOutputting(), DO_TriggerB.ShouldWeBeOutputting(), DO_TriggerC.ShouldWeBeOutputting() );

	//analog inputs
	AI.readAllAnalogInputs();
	AI.convertCVknobValues();
	AI.reportVsliderDACValues(SM.stageDACvalues);
    AI.applyCVknobScalingToPsliderValues();
	SM.UpdateNormalizationStates(DIO.ReportNormProbes()); 
	//AI.printPsliderValuesAdjusted();


	//analog outputs
	SM.SetActiveStages(&cycleA.stageIsActive[0], &cycleB.stageIsActive[0], &cycleC.stageIsActive[0]);
	SM.UpdateStageVoltageValues();
	SM.WriteStageVoltagesToDACs(AO);
	//SM.PrintVoltageOutputs();

	//get the currently touched buttons
	capTouch_currtouched = capTouch.touched();

	ModeManagerAll.UpdateButtonsPressed(capTouch_currtouched);
	ModeManagerAll.Touch_UI_Master();

	UpdateLeds();

	//AI.printPsliderValuesAdjustedInt();

	// testing: display the P slider values (Adjusted) as LED intensities
	//for(i=0;i<8;i++){
		//LED_stages[i].AddColor(Clr_green,25);
	//}

	//cycleA.resetCycleAndPrintActive();
	cycleA.recievePulses(DIO.ClockInA_new, DIO.ResetInA_new);
	//cycleA.printActiveSteps();
	cycleB.recievePulses(DIO.ClockInB_new, DIO.ResetInB_new);
	cycleC.recievePulses(DIO.ClockInC_new, DIO.ResetInC_new);

	cycleA.convertStepsToStages();
	cycleB.convertStepsToStages();
	cycleC.convertStepsToStages();

	ModeManagerAll.DisplayActiveSteps(&cycleA.stageIsActive[0],&cycleB.stageIsActive[0],&cycleC.stageIsActive[0]);

	//DIO.PrintTriggerInBools();

}



/* 	//for testing: serial scanner
	delay(1000);
	found = 0;
	all = false;
    Serial.print("---------------------------------------------------\n");
    Serial.print("Starting scan...\n");
    for(target = 1; target <= 0x7F; target++) // sweep addr, skip general call
    {
        Wire.beginTransmission(target);       // slave addr
        Wire.endTransmission();  
		             // no data, just addr
    	switch(Wire.status()) 	{
    	case I2C_WAITING:  
        	Serial.printf("Addr: 0x%02X ACK\n", target);
        	found = 1;
        	break;
    	case I2C_ADDR_NAK: 
        	if(all) Serial.printf("Addr: 0x%02X\n", target); 
        	break;
    	default:
        	break;
		}
    } */