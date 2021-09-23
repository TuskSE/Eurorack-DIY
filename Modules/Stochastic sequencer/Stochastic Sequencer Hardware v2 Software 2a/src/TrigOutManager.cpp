#include <Arduino.h>
#include "TrigOutManager.h"


//initialize variables
TrigOutManager::TrigOutManager (int TrigLengthInMicroSeconds){
  //intialize
  TrigLengthMicros = TrigLengthInMicroSeconds;
  OutputPulseOccuring = false;
  //GateModeTimeoutLengthMicros = 20000;
}


void TrigOutManager::StartPulse(){
  OutputPulseOccuring = true;
  CurrentPulseEndtimeMicros = micros() + TrigLengthMicros;
  
  //If the micros() timer is close to rollover, then the value of CurrentPulseEndtimeMicros will have rolled over, as both are unsigned long.
  //Work out if such a rollover has occured:
  if (CurrentPulseEndtimeMicros < TrigLengthMicros){  
    RolloverFlag = true;  } else {  
      RolloverFlag = false; }
}

void TrigOutManager::EndPulse(){
    //We allow a pulse to be cancelled only after a certain amount of time since the pulse started. this is neccessary because otherwise, in clock divider mode, through pulses and main pulses which ought to be exactly coincident are actually staggered a little, and if the through pulse comes slightly later - we don't want it to kill the main pulse in that case.
    if (micros()>(CurrentPulseEndtimeMicros+GateModeTimeoutLengthMicros)){
           OutputPulseOccuring = false;
    }
  //To do: deal with rollover!
}


bool TrigOutManager::ShouldWeBeOutputting(){
  if(OutputPulseOccuring){
  //if gate mode is on, we only stop a pulse when specifically instructed
  //otherwise, we check against the time the current pulse is supposed to end

      if(GateMode==true){
          return true;
        }else{ // check against the time the current pulse is supposed to end
               if(RolloverFlag == false){
                 if (micros()>CurrentPulseEndtimeMicros){
                    OutputPulseOccuring = false;
                   return false;
                  } else {
                    return true;
                 }
               }else{ // RolleverFlag == true
                 if ( (micros()>CurrentPulseEndtimeMicros) && (micros() < 100*TrigLengthMicros) ){
                   OutputPulseOccuring = false;
                   return false;
                 } else {
                   return true;
                 }
              }
        }
  } else { //no output pulse occuring
    return false;
    }
}
  