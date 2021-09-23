#ifndef ModeManager_H_
#define ModeManager_H_
#include <Arduino.h>
#include <RandomNumberGen.h>
#include <AnalogIn.h>


//See ColorDefs.cpp for definitions of the various colors which the RGB leds will use

class LEDpixel {
    private:
    unsigned int ColorToDisplayR;  //Brightness on a scale from 0 to 255
    unsigned int ColorToDisplayG;
    unsigned int ColorToDisplayB;
    unsigned int MasterBrightness;  // on a scale of 0 to 100, where 100 is the brightest possible. Everything else gets scaled to this number
    unsigned int MaximumBrightness; //scale of 0 to 255. Don't allow brightness, in any color, to exeed this value
    unsigned int PixelCoordinate; //e.g 0 is the first LED in the chain, 1 is the second LED in the chain, etc

    public:
    LEDpixel();
    void setup(unsigned int Coordinate, unsigned int MasterBrightnessToSet, unsigned int MaxBrightnessToSet);
    void ClearInstructions(); //resets the stored pixel value to {0,0,0}
    void AddColor (unsigned int Color[3], int Brightness);  //Adds to the stored Pixel Value. brightness is on a scale 0 to 100
    void SubtractColor (unsigned int Color[3], int Brightness); //Subtracts from the stored Pixel Value. brightness is on a scale 0 to 100
    void SetCoordinate(int Coordinate);
    void SetMasterBrightnessValues(unsigned int MasterBrightnessToSet, unsigned int MaxBrightnessToSet);
    int CommunicateOutputColor(); 
    int Coordinate(); //Return the pixel co-ordinate


    // testing only
    void printAccessTest();

};


// The mode manager keeps track of the switches, the modes controlled by the switches, and the touch inputs
class ModeManager{
    private:
    // these keep track of the touch buttons, an ddetect those which have been pressed down since the previous cycle
    bool buttonsPressed[12], buttonsPressedPreviously[12], buttonsNewPresses[12];

    // these keep track of what channels are selected for editing using the touch buttons
    bool selectModeActive = 0;
    bool cycleEditModeActive = 0;
    bool ChAselected = 0;
    bool ChBselected = 0;
    bool ChCselected = 0;

    bool displayActiveStepModeActive = 1; // when true, cycle manager is permitted to print to LEDs

    // these point to the LED objects, so that we can write instructions to the LEDs
    LEDpixel * LED_select_ptr, * LED_chA_ptr, * LED_chB_ptr, * LED_chC_ptr;
    LEDpixel * LED_stages_ptr[8];

    // These define the colors assigned to channels A,B,C
    unsigned int Clr_ChA[3]    = { 255, 0,  0 };
    unsigned int Clr_ChB[3]  = { 0, 255, 0 };
    unsigned int Clr_ChC[3]   = { 0, 0, 255 };
    unsigned int Clr_start[3] = { 0, 255, 0 };
    unsigned int Clr_end[3] = { 255, 0, 0 };
    unsigned int Clr_white[3] = { 150, 150, 150 };

    // brightness values for corresponding to "dim" and "bright" LED intensity
    const int dim = 8;
    const int bright = 28;



    // In the future this might have a knob
    // 1000 = each step seeds a single other step
    // 1500 = each step seeds a single other step PLUS another with 50% probability
    // 500 = each step seeds a single other step 50% of the time
    //int PropogationProbability = 1000;


    public:
    // These track the states of the toggle switches
    bool Sw_TouchMode_Up, Sw_TouchMode_Down, Sw_TrigProbMode_Up, Sw_TrigProbMode_Down;
    bool Sw_Accent_Up, Sw_Accent_Down, Sw_Length_Up, Sw_Length_Down;
    bool Sw_Subdivs_Up, Sw_Subdivs_Down, Sw_StartPos_Up, Sw_StartPos_Down;
    bool Sw_MultiTrig_Left, Sw_MultiTrig_Right, Sw_OutputMode_Left, Sw_OutputMode_Right;

    bool Sw_TouchMode_Up_PreviousCycle, Sw_TouchMode_Down_PreviousCycle, Sw_TrigProbMode_Up_PreviousCycle, Sw_TrigProbMode_Down_PreviousCycle;
    bool Sw_Accent_Up_PreviousCycle, Sw_Accent_Down_PreviousCycle, Sw_Length_Up_PreviousCycle, Sw_Length_Down_PreviousCycle;
    bool Sw_Subdivs_Up_PreviousCycle, Sw_Subdivs_Down_PreviousCycle, Sw_StartPos_Up_PreviousCycle, Sw_StartPos_Down_PreviousCycle;
    bool Sw_MultiTrig_Left_PreviousCycle, Sw_MultiTrig_Right_PreviousCycle, Sw_OutputMode_Left_PreviousCycle, Sw_OutputMode_Right_PreviousCycle;

    //variables
        // for quantization: the 12 bits correspond to C, C#, D, D#, etc
        // a "true" value means we quantize to that bit
    bool quantizationA[12] = {0,0,0,0,0,0,0,0,0,0,0,0};  
    bool quantizationB[12] = {0,0,0,0,0,0,0,0,0,0,0,0};
    bool quantizationC[12] = {0,0,0,0,0,0,0,0,0,0,0,0};
    bool MultiTrigMode = 0;

    // These define the order of stages in a cycle
    // eg {0,1,2,3} means that we cycle through the first 4 stages before looping back to the start
    // "8" is a end signal. so {0,1,2,3,8,8,8,8,8,...} means that we cycle through the first 4 stages before looping back to the start
    int ChAcycle[10],ChBcycle[10],ChCcycle[10];
    bool cycleEditBegan = false;


    // initial setup
    void assignSelChLEDS(LEDpixel* sel_ptr, LEDpixel* ch1_ptr, LEDpixel* ch2_ptr, LEDpixel* ch3_ptr);
    void assignStageLED(LEDpixel* led_ptr, int idx);
    void LoadChanelColorsFromSettings( unsigned int ClrA[3], unsigned int ClrB[3], unsigned int ClrC[3] );
    void ResetAllCycles();

    // regular use
    void Touch_UI_Master();
    void UpdateSwitchStates( char Sw1States, char Sw2States);
    void UpdateButtonsPressed( uint16_t capTouch_currtouched );
    void Touch_UpdateChannelSelectionsQmode(); 
    void Touch_UpdateChannelSetCycleMode(); 
    void Touch_UpdateQuantizationSelection();
    void Touch_DisplayQuantizationSelection();



    // regular use, sub-functions
    void ResetAllLedsToOff();
    void ResetAllLedsExceptSelectToOff();
    void UpdateChSelLeds();
    void Touch_DisplayQuantizationSelection_SingleChannel(bool quantization[12], unsigned int Clr_Ch[3]);
    bool Touch_DidTheModeChange();
    void ResetCycle(char channel);
    void AddStageToCycle(char channel, int stage);
    void Touch_UpdateCycleSelectDisplay();
    void Touch_UpdateCycleSelectDisplaySingleChannel(int * ChCyclePtr, unsigned int Clr_Ch[3]);
    void ResetStageLedsToOff();
    void Touch_SetCycle();    
    void UpdateMultitrigMode();
    void DisplayActiveSteps(bool * stageIsActiveA, bool * stageIsActiveB, bool * stageIsActiveC);


    // for testing
    void activateLED_test(unsigned int Color[3], int Brightness);

};


// the stage manager keeps track of
// - what stages are currently active
// - wheree we are in the cycle
// - progressing steps/stages when the a clock input comes in

// a cycle is made of up to 10 steps
class cycleManager{
    private:
    
    // defines the order of stages in a cycle
    // eg {0,1,2,3} means that we cycle through the first 4 stages before looping back to the start
    // "8" is a end signal. so {0,1,2,3,8,8,8,8,8,...} means that we cycle through the first 4 stages before looping back to the start
    //int stageOfStepI[10];
    int * stageOfStepI_ptr;    // we expect to point to a 10-element array

    
    // The below few lines are old - had to cancel that due to memory problems!
    // for each step, there are two dice sets of rolls stored in memory.
    // one is used for everything which the P sliders control
    // one is used for everything related to propogration (e.g. which direction to advance in the cycle)
    // for each stage oldRNGvalue[i], oldRNGvalue[i+10],oldRNGvalue[i+2*10] etc will consulted on the 1st, 2nd and 3rd (etc) occasion that that step is triggered within a particular cycle


    // the probability sliders have a max sum value of 1000
    // this is also the max prob value the RNG will put out
    // so we have a bunch of constants here to define whether sub probabilities can go above 1
    //const int MaxStartTriggerProb = 8;

    RandomNumberGenerator * RNG_ptr;
    ModeManager * MM_ptr;
    AnalogInManager * AI_ptr;

    public:
    bool stepIsActive[10];
    bool stepIsSilent[10]; //corresponds to the "trig (pause)" probability
    bool stageIsActive[8];
    bool stageIsSilent[8];
    bool stepNeedsActivating_yesno[10] = {0,0,0,0,0,0,0,0,0,0};
    int stepNeedsActivating_step[10] = {0,0,0,0,0,0,0,0,0,0};
    int stepLength[10];  // A value of 0 means that the step lasts for 1 clock pulse. value of 1 -> 2 clock pulses. etc
    int stepTimeActive[10]; // tracks how many clock pulses since the step was activated
    int stepSubdivs[10];

    // initialization + subroutines
    void initialize(RandomNumberGenerator * rngpointer,ModeManager * modemanager_ptr,AnalogInManager * analogin_ptr, char channel);
    void LinkRNG(RandomNumberGenerator * rngpointer);
    void LinkModeManager(ModeManager * modemanager_ptr);
    void LinkAnalogInManager(AnalogInManager * analogin_ptr );
    void LinkCycle(char channel);
    void inputClockPulse();
    void inputResetPulse();    

    // regular use
    void resetCycle();
    void activateStep(int step); // activate a previously inactive step
    void progressStep(int step); // apply clock to step
    void propograteStep(int step);    
    void recievePulses(bool clockPulse, bool resetPulse); // this is where the digital in/out manager plugs into


    void displayActiveStagesOnLEDs();
    void convertStepsToStages();


    // testing
    void printCycleStages();
    void resetCycleAndPrintActive();
    void printActiveSteps();
};


#endif // ModeManager_H_


// in cycle set mode:
//  select + channel erases any existing cycle setting and primes the UI to accept a new one. Presseing select again then confirms the selection