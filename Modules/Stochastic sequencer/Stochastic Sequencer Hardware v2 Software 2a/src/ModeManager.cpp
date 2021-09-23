#include "ModeManager.h"
#include <Arduino.h>
#include <WS2812Serial.h>
#include "PinDefs.h"
//#include "Settings.h"



// ---------- 1) MODE MANAGER --------- //

// 1.1) INITIAL SETUP
void ModeManager::assignSelChLEDS(LEDpixel* sel_ptr, LEDpixel* ch1_ptr, LEDpixel* ch2_ptr, LEDpixel* ch3_ptr){
    LED_select_ptr = sel_ptr;
    LED_chA_ptr = ch1_ptr;
    LED_chB_ptr = ch2_ptr;
    LED_chC_ptr = ch3_ptr;
}

void ModeManager::assignStageLED(LEDpixel* led_ptr, int idx){
    LED_stages_ptr[idx] = led_ptr;
}

void ModeManager::LoadChanelColorsFromSettings( unsigned int ClrA[3], unsigned int ClrB[3], unsigned int ClrC[3] ){
    for(int i=0; i<3; i++){
        Clr_ChA[i] = ClrA[i];
        Clr_ChB[i] = ClrB[i];
        Clr_ChC[i] = ClrC[i];
    }
}

void ModeManager::ResetAllCycles(){
    ResetCycle('A');
    ResetCycle('B');
    ResetCycle('C');
    //Serial.println("test");
}

// 1.2) regular use
void ModeManager::Touch_UI_Master(){
    // This co-ordinates everything the touchUI is doing

    // QUANTIZATION MODE
    if(Sw_TouchMode_Down && !Sw_TouchMode_Up){
        displayActiveStepModeActive = 0;
        Touch_UpdateChannelSelectionsQmode(); 
        if(!selectModeActive){
            ResetAllLedsExceptSelectToOff();
            Touch_UpdateQuantizationSelection();
            Touch_DisplayQuantizationSelection();
        }
        
    }

    // CYCLE SET MODE
    if(!Sw_TouchMode_Down && !Sw_TouchMode_Up){
        displayActiveStepModeActive = 0;
        Touch_UpdateChannelSetCycleMode(); 
        if(cycleEditModeActive){
            Touch_SetCycle();
        }
        Touch_UpdateCycleSelectDisplay();
    }

    // TRIGGER MODE
    if(!Sw_TouchMode_Down && Sw_TouchMode_Up){
        displayActiveStepModeActive = 1;
    }


    // MAKE SURE THAT WE TIDY THINGS UP WHENEVER WE SWITCH MODES
    if(Touch_DidTheModeChange()){
        // disengage from select mode
        selectModeActive = 0;
        //LED_select_ptr->ClearInstructions();
        ResetAllLedsToOff();
        ChAselected = 0;
        ChBselected = 0;
        ChCselected = 0;
        cycleEditModeActive = 0;
        cycleEditBegan = false;
        displayActiveStepModeActive = 0;
    }

}

bool ModeManager::Touch_DidTheModeChange(){
    bool ModeChanged = false;

    //check for change
    if(Sw_TouchMode_Down !=  Sw_TouchMode_Down_PreviousCycle){
        ModeChanged = true;
    } 
    if(Sw_TouchMode_Up != Sw_TouchMode_Up_PreviousCycle){
        ModeChanged = true;
    }

    //Update memory 
    Sw_TouchMode_Down_PreviousCycle = Sw_TouchMode_Down;
    Sw_TouchMode_Up_PreviousCycle = Sw_TouchMode_Up;

    return ModeChanged;

}

void ModeManager::UpdateSwitchStates( char Sw1States, char Sw2States){
    
    //read the states
    Sw_TouchMode_Up = bitRead(Sw2States, 2);
    Sw_TouchMode_Down = bitRead(Sw2States, 3);
    Sw_TrigProbMode_Up = bitRead(Sw2States, 0);
    Sw_TrigProbMode_Down = bitRead(Sw2States, 1);
    Sw_Accent_Up = bitRead(Sw1States, 5);
    Sw_Accent_Down = bitRead(Sw1States, 4);
    Sw_Length_Up = bitRead(Sw2States, 7);
    Sw_Length_Down = bitRead(Sw2States, 6);
    Sw_Subdivs_Up = bitRead(Sw1States, 2);
    Sw_Subdivs_Down = bitRead(Sw2States, 6);
    Sw_StartPos_Up = bitRead(Sw1States, 3);
    Sw_StartPos_Down = bitRead(Sw2States, 4);
    Sw_MultiTrig_Left = bitRead(Sw1States, 6);
    Sw_MultiTrig_Right = bitRead(Sw1States, 7);
    Sw_OutputMode_Left = bitRead(Sw1States, 1);
    Sw_OutputMode_Right = bitRead(Sw1States, 0);


    // adjust mode flags as appropriate
    if(Sw_MultiTrig_Right){
        MultiTrigMode = 1;
    }else{
        MultiTrigMode = 0;
    }
    }

void ModeManager::UpdateButtonsPressed( uint16_t capTouch_currtouched ){
    // converts touchbutton data from a 16 bit unint to an array of binary numbers, 
    // which i find easier to work with

    // store previous values
    for (int i=0; i<12; i++){
        buttonsPressedPreviously[i] = buttonsPressed[i];
    }

    // read in new values
    for (int i=0; i<12; i++){
        buttonsPressed[i] = bitRead(capTouch_currtouched,11-i);
    }

    // look for changes
    for (int i=0; i<12; i++){
        if (buttonsPressed[i]==1 && buttonsPressedPreviously[i]==0){
            buttonsNewPresses[i]=1;
        }else{
            buttonsNewPresses[i]=0;
        }
    }

    // for debugging
    //for (int i=0; i<12; i++){
    //    Serial.print(buttonsNewPresses[i]);
    //}
    //Serial.println(" ");

}

void ModeManager::Touch_UpdateChannelSelectionsQmode(){
// this handles the selection of different channels for editing, using the touch controls
// e.g. in quantization mode, this would entail the selection of which channels we are setting quantization for

    // If we have just entered select mode, we want to make some changes to the LED indicators
    if (buttonsPressed[0] && !buttonsPressedPreviously[0]){
        // we just entered select mode
        selectModeActive = 1;

        // light up the select buttons dimly, as a visual indicator that we are in select mode
        ResetAllLedsToOff();
        LED_chA_ptr->AddColor(Clr_ChA,dim);
        LED_chB_ptr->AddColor(Clr_ChB,dim);
        LED_chC_ptr->AddColor(Clr_ChC,dim);

        // use *bright* LED to indicate active channels
        if(ChAselected){
            LED_chA_ptr->AddColor(Clr_ChA,bright);
        }
        if(ChBselected){
            LED_chB_ptr->AddColor(Clr_ChB,bright);
        }
        if(ChCselected){
            LED_chC_ptr->AddColor(Clr_ChC,bright);
        }
    }

    // If we have just exited select mode, we want to make some changes to the LED indicators
    if (!buttonsPressed[0] && buttonsPressedPreviously[0]){
        selectModeActive = 0;
        LED_chA_ptr->ClearInstructions();
        LED_chB_ptr->ClearInstructions();
        LED_chC_ptr->ClearInstructions();
        //color the LED on the select button so we know which channel(s) is selected
        LED_select_ptr->ClearInstructions();
        if(ChAselected){
            LED_select_ptr->AddColor(Clr_ChA,bright);
        }
        if(ChBselected){
            LED_select_ptr->AddColor(Clr_ChB,bright);
        }
        if(ChCselected){
            LED_select_ptr->AddColor(Clr_ChC,bright);
        }
    }

    // if select mode is active
    if(selectModeActive){
        // for each channel, check for button presses which would cause us to select/deselect a channel
        // if a button press occured, update LED display - bright LED means channel selected

        if (buttonsPressed[1] && !buttonsPressedPreviously[1]){
            ChAselected = !ChAselected;
            if(ChAselected){
                LED_chA_ptr->AddColor(Clr_ChA,bright);
            }else{
                LED_chA_ptr->SubtractColor(Clr_ChA,bright);
            }

        }

        if (buttonsPressed[2] && !buttonsPressedPreviously[2]){
            ChBselected = !ChBselected;
            if(ChBselected){
                LED_chB_ptr->AddColor(Clr_ChB,bright);
            }else{
                LED_chB_ptr->SubtractColor(Clr_ChB,bright);
            }
        }

        if (buttonsPressed[3] && !buttonsPressedPreviously[3]){
            ChCselected = !ChCselected;
            if(ChCselected){
                LED_chC_ptr->AddColor(Clr_ChC,bright);
            }else{
                LED_chC_ptr->SubtractColor(Clr_ChC,bright);
            }
        }

    }


}

void ModeManager::UpdateChSelLeds(){
    bool dimMarkersShow = selectModeActive | cycleEditModeActive;

    LED_chA_ptr->ClearInstructions();
    LED_chB_ptr->ClearInstructions();
    LED_chC_ptr->ClearInstructions();

    if(ChAselected){
        LED_chA_ptr->AddColor(Clr_ChA,bright);
    }else{
        if(dimMarkersShow){LED_chA_ptr->AddColor(Clr_ChA,dim);}
    }



    if(ChBselected){
        LED_chB_ptr->AddColor(Clr_ChB,bright);
    }else{
        if(dimMarkersShow){LED_chB_ptr->AddColor(Clr_ChB,dim);}
    }


    if(ChCselected){
        LED_chC_ptr->AddColor(Clr_ChC,bright);
    }else{
        if(dimMarkersShow){LED_chC_ptr->AddColor(Clr_ChC,dim);}
    }

}

void ModeManager::Touch_UpdateChannelSetCycleMode(){
    // Manages just the selection of which channel is active for editing 

    // to select a channel (or channels):
    // hold down the "select" button, and press A/B/C to activate as appropriate
    // when the select button is depressed SelectMode=0, but SetCycleMode=1. this means we can define cycles using the 8 stage buttons
    // pressing the select button again now brings us out of SetCycleMode, so SelectMode=0 SetCycleMode=0
    // nb, "select mode" indicates that the select button is being pressed right now, so we select the cycle


    // If we have pressed the select button and we weren't already in cycle edit mode,  
    
    // if the select button has just been pressed
    if (buttonsPressed[0] && !buttonsPressedPreviously[0]){
        if(!cycleEditModeActive){
            // go into select mode
            selectModeActive = 1;

            // reset our channel selections
            ChAselected = 0;
            ChBselected = 0;
            ChCselected = 0;

            // light up the select LED
            LED_select_ptr->AddColor(Clr_white,bright);
            UpdateChSelLeds();
            
        }else if(cycleEditModeActive){
            //exit from cycle edit mode
            cycleEditModeActive = 0;

            ChAselected = 0;
            ChBselected = 0;
            ChCselected = 0;
            LED_select_ptr->SubtractColor(Clr_white,bright);
            UpdateChSelLeds();
            cycleEditBegan = false; // reset this flag
        }
    }

    // if the select button is depressed
    if (!buttonsPressed[0] && buttonsPressedPreviously[0]){

        if(selectModeActive){
            // if the used had selected a channel when they were in select mode
            if(ChAselected | ChBselected | ChCselected){
                // we are exiting channel select mode
                // and entering cycle edit mode
                selectModeActive = 0;
                cycleEditModeActive = 1;
                UpdateChSelLeds();

            }else{
                // simply exit select mode without moving on to cycle mode
                selectModeActive = 0;
                LED_select_ptr->SubtractColor(Clr_white,bright);
                UpdateChSelLeds();
            }

        }

    }

    // if select mode is active and a channel button is pushed
    if(selectModeActive){
        // for each channel, check for button presses which would cause us to select/deselect a channel
        // if a button press occured, update LED display - bright LED means channel selected

        if (buttonsPressed[1] && !buttonsPressedPreviously[1]){
            ChAselected = !ChAselected;
            UpdateChSelLeds();
        }

        if (buttonsPressed[2] && !buttonsPressedPreviously[2]){
            ChBselected = !ChBselected;
            UpdateChSelLeds();
        }

        if (buttonsPressed[3] && !buttonsPressedPreviously[3]){
            ChCselected = !ChCselected;
            UpdateChSelLeds();
        }
    }

    // if select mode is inactive and a channel button is pushed
    // display the cycle on the stage LEDs
    // this is basically a display-only mode
    if(!selectModeActive){
        if (buttonsPressed[1] && !buttonsPressedPreviously[1]){
            ChAselected = !ChAselected;
            UpdateChSelLeds();
        }

        if (buttonsPressed[2] && !buttonsPressedPreviously[2]){
            ChBselected = !ChBselected;
            UpdateChSelLeds();
        }

        if (buttonsPressed[3] && !buttonsPressedPreviously[3]){
            ChCselected = !ChCselected;
            UpdateChSelLeds();
        }
    }

}

void ModeManager::Touch_SetCycle(){
    // this is intended to run while we are in cycle edit mode
    // every time we press a button corresponding to a stage, add that stage to the cycle, for the selected channels
    for(int i=0; i<8; i++){
        if(buttonsPressed[i+4] && !buttonsPressedPreviously[i+4]){
            // if a button just got pushed...

            // if this is the first push of a stage button since we went into cycle mode, then reset the relevant cycles 
            if(!cycleEditBegan){
                cycleEditBegan = true;

                if(ChAselected){
                    ResetCycle('A');
                }
                if(ChBselected){
                    ResetCycle('B');
                }
                if(ChCselected){
                    ResetCycle('C');
                }

                Touch_UpdateCycleSelectDisplay();
            }


            // add the stage to the cycle
            if(ChAselected){
                AddStageToCycle('A',i);
            }

            if(ChBselected){
                AddStageToCycle('B',i);
            }            

            if(ChCselected){
                AddStageToCycle('C',i);
            }           


        }
    }
}


void ModeManager::Touch_UpdateQuantizationSelection(){
    // NB: this doesn't check whether you are in quantization selection mode or whatever
    // I trust there will be some higher function which executes this only when appropriate


    for(int i=0; i<11; i++){
    // read through all of the touch buttons corresponding to quantization notes

        if (buttonsPressed[i+1] && !buttonsPressedPreviously[i+1]){
            // if a button has just been touched, flip the quantization state for the corresponding note on all active channels
            // UNLESS we are editing multiple channels at once, and quantization for this note in "on" in one channel and "off" in another
            // in that case, just turn the channel off!

            // this marker tells us if there is any led lit up. i.e. for all the channels we are currently editing, is ANY active on this note?
            bool ActiveQuantizationMarker = ( (ChAselected && quantizationA[i]) || (ChBselected && quantizationB[i]) || (ChCselected && quantizationC[i]) );

            if(ActiveQuantizationMarker){
                if(ChAselected){quantizationA[i]=0;}
                if(ChBselected){quantizationB[i]=0;}
                if(ChCselected){quantizationC[i]=0;}
            }else{
                if(ChAselected){quantizationA[i] = !quantizationA[i];}
                if(ChBselected){quantizationB[i] = !quantizationB[i];}
                if(ChCselected){quantizationC[i] = !quantizationC[i];}
            }

        }
    }
}

void ModeManager::Touch_DisplayQuantizationSelection_SingleChannel(bool quantization[12], unsigned int Clr_Ch[3]){
    if(quantization[0]){
        LED_chA_ptr->AddColor(Clr_Ch,bright);
    }

    if(quantization[1]){
        LED_chB_ptr->AddColor(Clr_Ch,bright);
    }

    if(quantization[2]){
        LED_chC_ptr->AddColor(Clr_Ch,bright);
    }

    for(int i=0; i<8; i++){
        if(quantization[i+3]){
            LED_stages_ptr[i]->AddColor(Clr_Ch,bright);
        }
    }
}



void ModeManager::Touch_DisplayQuantizationSelection(){

    //ResetAllLedsToOff();

    if(ChAselected){
        Touch_DisplayQuantizationSelection_SingleChannel(quantizationA,Clr_ChA);
    }

    if(ChBselected){
        Touch_DisplayQuantizationSelection_SingleChannel(quantizationB,Clr_ChB);
    }

    if(ChCselected){
        Touch_DisplayQuantizationSelection_SingleChannel(quantizationC,Clr_ChC);
    }

}



// 1.4) REGULAR USE, SUB-FUNCTIONS
void ModeManager::ResetAllLedsToOff(){
    LED_select_ptr->ClearInstructions();
    LED_chA_ptr->ClearInstructions();
    LED_chB_ptr->ClearInstructions();
    LED_chC_ptr->ClearInstructions();
    for(int i=0; i<8; i++){
        LED_stages_ptr[i]->ClearInstructions();
    }
}

void ModeManager::ResetAllLedsExceptSelectToOff(){
    LED_chA_ptr->ClearInstructions();
    LED_chB_ptr->ClearInstructions();
    LED_chC_ptr->ClearInstructions();
    for(int i=0; i<8; i++){
        LED_stages_ptr[i]->ClearInstructions();
    }
}

void ModeManager::ResetStageLedsToOff(){
    for(int i=0; i<8; i++){
        LED_stages_ptr[i]->ClearInstructions();
    }
}

// 1.3) TESTING AND DEVELOPMENT
void ModeManager::activateLED_test(unsigned int Color[3], int Brightness){
    // testing only
    // this just checks that we can access the LED objects as expected
    LED_select_ptr->printAccessTest();
    LED_stages_ptr[4]->printAccessTest();
}

void ModeManager::ResetCycle(char channel){
    // removes the set cycle by resetting all stages to the end signal (8)

    int * ChCyclePtr;

    if(channel=='A'){
        ChCyclePtr = &ChAcycle[0];
    }else if(channel=='B'){
        ChCyclePtr = &ChBcycle[0];
    }else if (channel=='C'){
        ChCyclePtr = &ChCcycle[0];
    }else{
        //Serial.print("ResetCycle function called for a non-existant channel");
        return;
    }

    for(int i=0; i<10; i++){
        *(ChCyclePtr+i) = 8;
    }

}

void ModeManager::AddStageToCycle(char channel, int stage){

    // figure out what channel we're adding to
    int * ChCyclePtr;
    if(channel=='A'){
        ChCyclePtr = &ChAcycle[0];
    }else if(channel=='B'){
        ChCyclePtr = &ChBcycle[0];
    }else if (channel=='C'){
        ChCyclePtr = &ChCcycle[0];
    }else{
        //Serial.print("AddStageToCycle function called for a non-existant channel");
        return;
    }

    // step through the cycle until we find an end signal "8", and replace that signal with the new stage value
    for(int i=0; i<10; i++){
        if( *(ChCyclePtr+i) == 8 ){
            *(ChCyclePtr+i) = stage;
            break;
        }
    }

}

void ModeManager::Touch_UpdateCycleSelectDisplay(){
    ResetStageLedsToOff();
    
    if(ChAselected){
        Touch_UpdateCycleSelectDisplaySingleChannel(&ChAcycle[0],Clr_ChA);
    }
    if(ChBselected){
        Touch_UpdateCycleSelectDisplaySingleChannel(&ChBcycle[0],Clr_ChB);
    }
    if(ChCselected){
        Touch_UpdateCycleSelectDisplaySingleChannel(&ChCcycle[0],Clr_ChC);
    }
}


void ModeManager::Touch_UpdateCycleSelectDisplaySingleChannel(int * ChCyclePtr, unsigned int Clr_Ch[3]){
    // go through every step in the cycle, and light up the correposponding stages
    // NB: the idea here is that brightnesses add up, so if a stage appears twice in the cycle, the light is brighter than if it appeared only once
    // at a future date this might want rewriting so that it's possible to identify the start and end stages
    int stage = 0;
    for(int i=0; i<10; i++){
        stage = *(ChCyclePtr+i);
        if( stage == 8 ){
            // end signal
            break;

        }else{
            LED_stages_ptr[stage]->AddColor(Clr_Ch,dim);
        }
    }
}

void ModeManager::UpdateMultitrigMode(){
    if(!Sw_MultiTrig_Left && Sw_MultiTrig_Right){
        MultiTrigMode = 1;
    }else{
        MultiTrigMode = 0;
    }

}

void ModeManager::DisplayActiveSteps(bool * stageIsActiveA, bool * stageIsActiveB, bool * stageIsActiveC){
    // this will run only if the appropriate display mode is activated
    if(displayActiveStepModeActive){
        
        // clear the display
        ResetStageLedsToOff();
        for(int i=0;i<8;i++){
            if(stageIsActiveA[i]){
                LED_stages_ptr[i]->AddColor(Clr_ChA,dim);
            }
            if(stageIsActiveB[i]){
                LED_stages_ptr[i]->AddColor(Clr_ChB,dim);
                //Serial.println("hm");
            }
            if(stageIsActiveC[i]){
                LED_stages_ptr[i]->AddColor(Clr_ChC,dim);
            }            
        }

    }
}



// ---------- 2) LED PIXELS --------- //

LEDpixel::LEDpixel(){
    PixelCoordinate = 0;
    MasterBrightness = 10;
    MaximumBrightness = 255;
    ColorToDisplayR = 0;
    ColorToDisplayG = 0;
    ColorToDisplayB = 0;
}

void LEDpixel::setup (unsigned int Coordinate, unsigned int MasterBrightnessToSet, unsigned int MaxBrightnessToSet) {
    PixelCoordinate = Coordinate;
    MasterBrightness = MasterBrightnessToSet;
    MaximumBrightness = MaxBrightnessToSet;
    ColorToDisplayR = 0;
    ColorToDisplayG = 0;
    ColorToDisplayB = 0;

    //Check values within expected range
    if (MasterBrightness>100){ 
        MasterBrightness=100; 
    }
    if (MasterBrightness<0){ 
        MasterBrightness=0; 
    } 
}

void LEDpixel::ClearInstructions(){
    ColorToDisplayR = 0;
    ColorToDisplayG = 0;
    ColorToDisplayB = 0;
    //Serial.println("clear");
}

void LEDpixel::AddColor(unsigned int Color[3], int Brightness){
    //Check Brightness is within expected Range
    if(Brightness>100){
        Brightness = 100;
    }
    if(Brightness<0){
        Brightness = 0;
    }

    int BrightnessMultiplier = Brightness * MasterBrightness; //expect a range 0 to 100
    
    ColorToDisplayR = ColorToDisplayR + Color[0]*BrightnessMultiplier/10000;
    ColorToDisplayG = ColorToDisplayG + Color[1]*BrightnessMultiplier/10000;
    ColorToDisplayB = ColorToDisplayB + Color[2]*BrightnessMultiplier/10000;

    //Serial.println("color added");
}

void LEDpixel::SubtractColor(unsigned int Color[3], int Brightness){
    //Check Brightness is within expected Range
    if(Brightness>100){
        Brightness = 100;
    }
    if(Brightness<0){
        Brightness = 0;
    }
    
    int BrightnessMultiplier = Brightness * MasterBrightness; //expect a range 0 to 100

    // caclulate the values we need to subtract
    unsigned int ValueToSubtractR = Color[0]*BrightnessMultiplier/10000;
    unsigned int ValueToSubtractG = Color[1]*BrightnessMultiplier/10000;
    unsigned int ValueToSubtractB = Color[2]*BrightnessMultiplier/10000;

    // do the subtraction, but making sure we don't accidentally take the brightness below 0
    if(ValueToSubtractR > ColorToDisplayR){
        ColorToDisplayR = 0;
    }else{
        ColorToDisplayR = ColorToDisplayR - ValueToSubtractR;
    }

    if(ValueToSubtractG > ColorToDisplayG){
        ColorToDisplayG = 0;
    }else{
        ColorToDisplayG = ColorToDisplayG - ValueToSubtractG;
    }

    if(ValueToSubtractB > ColorToDisplayB){
        ColorToDisplayB = 0;
    }else{
        ColorToDisplayB = ColorToDisplayB - ValueToSubtractB;
    }

}


int LEDpixel::CommunicateOutputColor(){
    //check we are not above max brightness
    if(ColorToDisplayR>MaximumBrightness){ColorToDisplayR=MaximumBrightness;}
    if(ColorToDisplayG>MaximumBrightness){ColorToDisplayG=MaximumBrightness;}
    if(ColorToDisplayB>MaximumBrightness){ColorToDisplayB=MaximumBrightness;}

    //Concatenate the RBG values together
    int ColorOut = (ColorToDisplayG<< 16)|(ColorToDisplayR<<8)|ColorToDisplayB;
    return ColorOut;
}

int LEDpixel::Coordinate(){
    return PixelCoordinate;
}

void LEDpixel::SetCoordinate(int Coordinate){
    PixelCoordinate = Coordinate;
}

void LEDpixel::SetMasterBrightnessValues(unsigned int MasterBrightnessToSet, unsigned int MaxBrightnessToSet){
    MasterBrightness = MasterBrightnessToSet;
    MaximumBrightness = MaxBrightnessToSet;
}

void LEDpixel::printAccessTest(){
    //Serial.print("access successful, coordinate = ");
    //Serial.println(PixelCoordinate);
    
}





// ---------- 3) CYCLE MANAGER --------- //

// initialization
void cycleManager::initialize(RandomNumberGenerator * rngpointer,ModeManager * modemanager_ptr,AnalogInManager * analogin_ptr, char channel){
    LinkRNG(rngpointer);
    LinkModeManager(modemanager_ptr);
    LinkAnalogInManager(analogin_ptr);
    LinkCycle(channel);
    for(int i=0;i<10;i++){
        stepIsActive[i]=0;
        stepIsSilent[i]=1;
    }
}

void cycleManager::LinkModeManager(ModeManager * modemanager_ptr){
    MM_ptr = modemanager_ptr;
}

void cycleManager::LinkRNG(RandomNumberGenerator * rngpointer){
    RNG_ptr = rngpointer;
}

void cycleManager::LinkAnalogInManager(AnalogInManager * analogin_ptr ){
    AI_ptr = analogin_ptr;
}

void cycleManager::LinkCycle(char channel){
    if(channel=='A'){
        stageOfStepI_ptr = &MM_ptr->ChAcycle[0];
    }
    if(channel=='B'){
        stageOfStepI_ptr = &MM_ptr->ChBcycle[0];
    }
    if(channel=='C'){
        stageOfStepI_ptr = &MM_ptr->ChCcycle[0];
    }
}


// regular use

void cycleManager::resetCycle(){

    if(stageOfStepI_ptr[0]==8){
        // there is no cycle set. Nothing to do here.
        return;
    }

    // reset the trigger counts, active stages, etc
    for(int i=0; i<10; i++){
        stepIsActive[i] = false;
        stepIsSilent[i] = false;
    }

    // determine which steps to activate

    // Multi trig mode off
    if(!MM_ptr->MultiTrigMode){
        // activate one step only
        Serial.println("Reset cycle; activate one step only");


        if(!MM_ptr->Sw_StartPos_Up  & !MM_ptr->Sw_StartPos_Down) {
            // P slider have no effect on start position - just start at 1
            // or don't start anything, if there is no cycle set for the channel!
            int i = 0;
            if(stageOfStepI_ptr[i]!=8){
                activateStep(i);
            }
            //activateStep(0);
        }else{
            // P sliders determine start position

            // We need to normalize the P sliders so that the probability adds to 1
            // Or equivalently, scale our dice roll
            int PsliderSum = 0;
            int i=0;
            for(i=0;i<10;i++){
                if(stageOfStepI_ptr[i]==8){
                    break; //there is no cycle!
                }
                // cycle through every step in the cycle, and add the corresponding slider probabilities
                PsliderSum = PsliderSum + AI_ptr->PsliderValuesAdjustedInt[stageOfStepI_ptr[i]];
            }

            // Generate a random number between 0 and PsliderSum
            int rnumScaled = RNG_ptr->randomNumber()*PsliderSum/RNG_ptr->maxRandomNumber;

            // imagine a numberline from 0 to PsliderSum
            // it is divided into segments, the length of which are proportional to the probability of a particular stage
            // our random number falls randomly on this numberline. We want to find which segment it had landed in.
            PsliderSum=0;
            for(i=0;stageOfStepI_ptr[i]<8;i++){
                PsliderSum = PsliderSum + AI_ptr->PsliderValuesAdjustedInt[stageOfStepI_ptr[i]];
                if(PsliderSum>rnumScaled){
                    break;
                }
            }
            
            activateStep(i);

        }
    }else if(MM_ptr->MultiTrigMode){
        // Multi trig mode is on
        //Serial.println("reset cycle, multiple steps");

        for(int i=0;i<10;i++){
            if(stageOfStepI_ptr[i]==8){
                // we have already probed all of the active steps
                break;
            }

            if(AI_ptr->PsliderValuesAdjustedInt[stageOfStepI_ptr[i]] > RNG_ptr->randomNumber()){
                activateStep(i);
            }
        }

    }

    // if dice roll <> deja vu, reroll dice

    // if P(startpos) = off, start at first step with probability given by PropogationProbability

    // if P(startpos) = true, do a dice roll for each possible stage
    // with probs scaled by the multitrig switch
}

void cycleManager::activateStep(int i){

    //Serial.print("activate step: ");
    //Serial.println(i);

    // check for non-trivial cases 
    if(i>9 || stageOfStepI_ptr[i]==8 || i<0){

        // if the Lower RH switch is toggled left, then triggers should just loop round in either direction
        // without triggering a whole cycle reset

        // if the lower RH switch is toggled right, then triggers which go off the end of the cycle should trigger
        // a cycle reset
        if(!MM_ptr->Sw_OutputMode_Right){
            if(i<0){
                //we have fallen off the cycle to the left. loop round to the right. 
                for(int j=9; j>=0; j=j-1){
                    Serial.println(j);
                    if(stageOfStepI_ptr[j]!=8){
                        // we have found the new step we should activate 
                        i = j;
                        break;
                    }
                }
            }else if(i>9 || stageOfStepI_ptr[i]==8){
                //we have fallen off the cycle to the right. loop round to the left
                i=0;
            }
        }else if(MM_ptr->Sw_OutputMode_Right){
            // trigger cycle reset
            resetCycle();
            return;
        }
    }


    if(stageOfStepI_ptr[0] == 8 ){
        // there is no cycle defined
        return;
    }

    // initialize parmaters
    stepIsSilent[i]=0;
    stepIsActive[i]=1;
    stepSubdivs[i] = 1;
    stepTimeActive[i]=0;


    // roll to see if it is a skipped step
    if(MM_ptr->Sw_TrigProbMode_Down){
        if(AI_ptr->PsliderValuesAdjustedInt[stageOfStepI_ptr[i]] < RNG_ptr->randomNumber()){
            stepIsActive[i]=0;
            propograteStep(i);
            //Serial.print("step skipped");
            return;
        }
    }

    // roll to see if it is a pause (silent) step
    if(MM_ptr->Sw_TrigProbMode_Up){
        if(AI_ptr->PsliderValuesAdjustedInt[stageOfStepI_ptr[i]] < RNG_ptr->randomNumber()){
            stepIsSilent[i]=1;
        }
    }

    // determine length from sliders
    // I'm keeping this non-probabilistic for now
    if(MM_ptr->Sw_Length_Up){
        stepLength[i] = 1+ AI_ptr->PsliderValuesAdjustedInt[stageOfStepI_ptr[i]]/1000;
        if(stepLength[i]==0){
            Serial.print("Step length 0: this isn't supposed to happen!");
        }
    }else{
        stepLength[i] = 1;
    }

    // determine subdivs from sliders
    if(MM_ptr->Sw_Subdivs_Up){
        stepSubdivs[i] = AI_ptr->PsliderValuesAdjustedInt[stageOfStepI_ptr[i]]/1000;
        if(stepSubdivs[i]==0){
            stepIsSilent[i]=1;
        }
    }
        
    
}

void cycleManager::convertStepsToStages(){
    int i=0;

    // reset
    for(i=0;i<8;i++){
       stageIsActive[i]=0; 
       stageIsSilent[i]=1;
    }
    for(i=0;i<10;i++){
        if(stepIsActive[i]){
            stageIsActive[stageOfStepI_ptr[i]]=1;
            if(!stepIsSilent[i]){
                stageIsSilent[stageOfStepI_ptr[i]]=0;
            }        
        }
    }
}

void cycleManager::progressStep(int step){

    // if the step is not active, then there is nothing to do
    if(!stepIsActive[step]){
        return;
    }


    //Serial.print("Progressing step ");
    //Serial.println(step);    

    // if the step is active, increment the time counter
    stepTimeActive[step] = stepTimeActive[step] + 1;

    // if we have reached the end of this step, progrogate it
    if(stepTimeActive[step] >= stepLength[step]){
        stepIsActive[step]=0;
        propograteStep(step);
    }
}


void cycleManager::propograteStep(int step){
    // determine the direction of the step

    //Serial.print("current step: ");
    //Serial.println(step);

    bool dirforward = true;

    if(AI_ptr->CVknobValues[3].getValue() < 4*(RNG_ptr->randomNumber()) ){
        dirforward = false;
        Serial.println("backwards step");
    }

    // determine the size of the step jump
    // keep it deterministic for now
    int stepsize = 0;
    if( AI_ptr->CVknobValues[2].getValue() < 1000 ){
        stepsize = 0;
    }else if( AI_ptr->CVknobValues[2].getValue() < 3000 ){
        stepsize = 1;
    }else if( AI_ptr->CVknobValues[2].getValue() < 4000 ){
        stepsize = 2;
    }else{
        stepsize = 3;
    }

    Serial.print("current step: ");
    Serial.println(step);

    Serial.print("propogaton stepsize: ");
    Serial.println(stepsize);

    int stepToActivate = 0;

    // make the step
    if(dirforward){
        stepToActivate = step + stepsize;
    }else{
        stepToActivate = step - stepsize;
    }

    //Serial.print("step to be activated: ");
    //Serial.println(stepToActivate);

    // mark step for activation
    for(int i=0; i<10; i++){
        if(!stepNeedsActivating_yesno[i]){
            stepNeedsActivating_yesno[i]=1;
            stepNeedsActivating_step[i]=stepToActivate;
            break;
        }
    }
    
}

void cycleManager::inputClockPulse(){

    // initialize
    for(int i=0;i<10;i++){
        stepNeedsActivating_yesno[i]=0;
    }

    // progres steps. "stepsToActivate" will track whether any new steps need activating
    for(int i=0;i<10;i++){
        progressStep(i);
        // if appropriate, progress step will trigger propogate step which will change the "stepNeedsActivating" flag
    }

    // activate steps
    for(int i=0;i<10;i++){
        if(stepNeedsActivating_yesno[i]==1){
            activateStep(stepNeedsActivating_step[i]);
        }
    } 

}

void cycleManager::inputResetPulse(){
    resetCycle();
}

void cycleManager::recievePulses(bool clockPulse, bool resetPulse){
    //if there is a clock pulse, advance the clock
    if(clockPulse){
        inputClockPulse();
    }

    if(resetPulse){
        inputResetPulse(); 
    }
}



// testing
void cycleManager::printCycleStages(){
    Serial.print("cycle ");
    for(int i=0; i<10; i++){
        Serial.print(stageOfStepI_ptr[i]);
        Serial.print(" ");
    }
    Serial.println(" ");
}

void cycleManager::resetCycleAndPrintActive(){
    resetCycle();
    Serial.print("active steps ");
    delay(10);
    for(int i=0; i<10; i++){
        Serial.print(stepIsActive[i]);
        Serial.print(" ");
    }    
    Serial.println(" ");
}

void cycleManager::printActiveSteps(){
    Serial.println("active steps: ");
    for(int i=0;i<10;i++){
        Serial.print(stepIsActive[i]);
    }
    Serial.println(" ");
}

