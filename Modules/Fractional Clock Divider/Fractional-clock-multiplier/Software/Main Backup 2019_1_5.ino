#include <Metro.h> // Include the Metro library
#include <Encoder.h>

//Define all the pins
const int SwPin_DivEuc = 0;
const int SwPin_OutModes = 1;
const int SwPin_CVup = 2;
const int SwPin_CVdown = 3;
const int SwPin_Encoder = 6;
const int CtrPin_CVamt = 21;
const int CtrPin_Divisions = 20;
const int CtrPin_Length = 19;
const int OutPin_Cycle = 7;
const int OutPin_MainOut = 8;
const int OutPin_Thru = 9;
const int InPin_Trig = 18; //Low input voltage = HIGH reading on pin.
const int InPin_CV = 17;
const int LEDPin_Shuffle = 16;
const int LEDPin_internal = 13;
const int EncPinA = 4;
const int EncPinB = 5;

//recentPresses[] stores the times of the 6 most recent switch presses
//[0] = most recent, [5] = most distant
// every time we write to this, shuffle the array around
double recentClockTimes[6] = {0,0,0,0,0,0}; 
const int recentClockTimesArraySize = 6;

const double ButtonPressTimeout = 5000000; //in microseconds. if the time between two button presses is greater than this, do not use it to set the output clock. 

//sets the range for the Length and Division knobs
const int Divisions_min = 1;
const int Divisions_max = 16;
const int Length_min = 1;
const int Length_max = 16;
//To read Knob value: reading = map(analogRead(CtrPin_Length),0,1023,Length_min,Length_max);
int ControlVoltage_in = 0;
int ControlValue_Divisions, ControlValue_Divisions_Scaled = 1;
int ControlValue_Length, ControlValue_Length_Scaled =1;

double pressTimeTemp = 0; //temporarily stores the time, when the button is pressed
int clockInState = 0;
int clockInPrevState = 0; // this will remember if the clock input was "on" in the previous cycle 

//multiplication/division factors. These will eventually be controlled by pots.
//float ClicksPerCycle = 8;
float MultDivFactor2 = 2;
float MultDivFactor3 = 0.5;

Encoder EncKnob(EncPinB, EncPinA);
int EncoderValTemp = 0;
int EncoderShiftInstruction = 0; 
float EncoderShuffleInstruction = 0.0;
const int EncoderCountsPerClick = 4; //property of the encoder used: how many digital output counts corresponding to one click (indent) felt by the user.
//const int EncoderClicksPerRevolution = 20; //property of the encoder used 
int EncoderShuffleNoOfClicks = 20; //The number of clicks of encoder rotation which makes the shuffle amount return to it's starting value

bool CVcontrolCycleLength, CVcontrolDivisions, CVcontrolShuffle, CVcontrolShift;

int Temp;
//-------------------------------------------------------------------------------------------------------------------

//The PulsePredictor class is responsible for 
// + logging input pulses    + predicting when future pulses will arise
// + knowing whether it is giving good predictions or not
// + relaying pulse events to other bits of code
// + relaying, e.g., cycle times to other bits of code

const int recentPulseTimesArraySize = 10;
const int predictedFuturePulseTimesArraySize = 16;

class PulsePredictor {
  unsigned long int recentPulseTimes[recentPulseTimesArraySize];    //remembers the absolute time of the previous 10 pulses
  unsigned long int predictedFuturePulseTimes[16]; //predicts the absolute time of the next 16 pulses
  signed long int PredictionError[4]; //for the previous N pulses, record the difference between the actual pulse time and what was predicted
  bool TrustworthyPulsePredictions; // records whether the incoming clock is predictable
  bool PulseRecieved; //notes when a pulse has been recieved
  bool TransmitPulse; //notes when a pulse should be transmitted to downstream code segments
  bool PulsesShouldBeTransmitted; //notes whether pulses ought to be transmitted

  public:
  PulsePredictor (); //sets default initialization values  
  void InputPulse (); //engaging this tells the Pulse Predictor that a Pulse has arrived
  unsigned long int TimeOfNthPulse (int n); //returns the estimated time of future pulses
  unsigned long int PulseInterval (int n1, int n2); //returns the expected time between future pulses
  unsigned long int TimeOflastPulsePlusN(int); //returns the time of a pulse in the past. n=0 => last pulse. n=1 is the pulse before that. etc
  bool IsThereAPulse ();
  void RecalculatePredictions ();
  void CheckReliability ();
} InputPulsePredictor;

//sets the default initialization of the PulsePredictor
PulsePredictor::PulsePredictor () {   
  TrustworthyPulsePredictions = false;
  PulseRecieved = false;
  TransmitPulse = false;
  PulsesShouldBeTransmitted = true;
}

void PulsePredictor::InputPulse (){
     //Log the time of the input pulse

     
     //........insert the time in the array of press times, rotating the array to maintain ordering from most to least recent
      for(int i=(recentPulseTimesArraySize-1); i>0; i--){
        recentPulseTimes[i] = recentPulseTimes[i-1];
        }
      recentPulseTimes[0] =  millis();

      //Flag the fact that a pulse has been recieved
      PulseRecieved = true;

      //Flag the the pulse should be transmitted
      if (PulsesShouldBeTransmitted == true){
        TransmitPulse = true;
      }

      //check this time against what the pulse predictor was expecting, and record
      
        for(int i=3; i>0; i--){
         PredictionError[i] = PredictionError[i-1];
        }
      PredictionError[0] = recentPulseTimes[0]-predictedFuturePulseTimes[0];

      CheckReliability (); // check how reliable the last few predictions have been
      RecalculatePredictions (); //recalculate estimates of upcoming pulse times
}


void PulsePredictor::CheckReliability (){
  int sum = 0;
  for (int i=0; i<4; i++){
    sum = sum + PredictionError[i];
  }

  if (sum < 10) { TrustworthyPulsePredictions = true; } else
  { TrustworthyPulsePredictions = false; }
  
}

void PulsePredictor::RecalculatePredictions (){
  //Measure the average of the time between the last two pulses. In future, this can be more sophisticated.
  unsigned long int PulseInterval = (recentPulseTimes[0]-recentPulseTimes[2])/2;

  //Use this to predict the times of future pulses
  for(int i=0; i<predictedFuturePulseTimesArraySize; i++){
    predictedFuturePulseTimes[i] = recentPulseTimes[0]+(i+1)*PulseInterval;
  }

}

bool PulsePredictor::IsThereAPulse() {
  if ( TransmitPulse == true ) {
    TransmitPulse = false; //assume the pulse has now been transmitted - job done!
    return true;
  } else {
    return false;
  }
  
}

unsigned long int PulsePredictor::TimeOfNthPulse (int n){
  if (TrustworthyPulsePredictions){
      return predictedFuturePulseTimes[n-1];
  } else {
    return 0; //this will be the signal that there are no reliable predictions
  }
}


unsigned long int PulsePredictor::TimeOflastPulsePlusN (int n){
  if (TrustworthyPulsePredictions){
      return recentPulseTimes[n];
  } else {
    return 0; //this will be the signal that there are no reliable predictions
  }
}


//----------------------------------------------------------------------------------------------------------------------

// the TrigOutManager is called on to generate output pulses, and handles e.g. giving said pulses a finite length

class TrigOutManager {
  unsigned long TrigLengthMicros, CurrentPulseEndtimeMicros; //Length of trigger pulse in microseconds
  bool OutputPulseOccuring; //if True, we are in the middle of outputting a pulse

  public:
  TrigOutManager (); //initializes trigger length. Currently this is hardwired into the function.
  void StartPulse();
  bool ShouldWeBeOutputting();
} TrigOutManager_Thru, TrigOutManager_Cycle, TrigOutManager_Main;


//initialize variables
TrigOutManager::TrigOutManager (){
  TrigLengthMicros = 1000;
}


void TrigOutManager::StartPulse(){
  OutputPulseOccuring = true;
  CurrentPulseEndtimeMicros = micros() + TrigLengthMicros;

  //If the micros() timer is close to rollover, just skip the pulse. Quick and dirty!
  if(CurrentPulseEndtimeMicros > 429496700 ){
    OutputPulseOccuring = false;
  }
}

bool TrigOutManager::ShouldWeBeOutputting(){
  if(OutputPulseOccuring){
    if (micros()>CurrentPulseEndtimeMicros){
      OutputPulseOccuring = false;
      return false;
    } else {
      return true;
    }
  } else {
    return false;
  }
}


//------------------------------------------------------------------------------------------------------------
// This will handle clock division/multiplication. Its aim is to spread N output pulses evenly in the space between M 
// input pulses. The end of an input cycle will trigger the end of the output cycle, to ensure sync is maintained.
// To space out pulses correctly, it must recieve information about how long the cycle is expected to last. 

class DividerMultiplier {
  int InputCycleLength,OutputCycleLength,PositionInInputCycle,PositionInOutputCycle,NewPositionTemp;
  unsigned long int ExpectedCycleLength, CycleStartTime, ExpectedCycleEndTime, ExpectedIntervalTime, PulseTimes[16], ShuffleTime;
  bool CycleOutPulseStart, MainOutPulseStart, ThruPulseStart, TransmitPulses;
  float fractionalShuffle; //The fraction of an output beat by which the output should be delayed. Expected value between 0 and 1.  
  
  public:
  DividerMultiplier ();
  void CycleReset();
  bool ShouldWeOutputCyclePulse();
  bool ShouldWeOutputMainPulse();
  bool ShouldWeOutputThruPulse();
  void InputPulse();
  void SetInOutCycleLengths(int, int);
  void CalculateOutputTimesAtCycleStart();
  void CalculateOutputTimesMidCycle();
  void UpdateKnobValues(int, int, int);
  void ShiftPositionInInputCycle(int);
  void UpdateFractionalShuffleTime(float);
} DividerMultiplierMain;


DividerMultiplier::DividerMultiplier(){   //initalize values
  TransmitPulses = false;
  CycleOutPulseStart = false;
  MainOutPulseStart = false;
  ThruPulseStart = false;
  InputCycleLength = 2;
  OutputCycleLength = 3;
  PositionInInputCycle = 0;
  PositionInOutputCycle = 0; 
  CycleStartTime = 0;
  NewPositionTemp = 0;
  fractionalShuffle = 0.0;
}

void DividerMultiplier::SetInOutCycleLengths(int in, int out){
  InputCycleLength = in;
  OutputCycleLength = out;
}

void DividerMultiplier::CalculateOutputTimesAtCycleStart() {
 //do not call this until we have enough information to do the calculations!
 ExpectedCycleEndTime = InputPulsePredictor.TimeOfNthPulse(InputCycleLength); 

 if(CycleStartTime !=0 && ExpectedCycleEndTime !=0){
  TransmitPulses = true;
  ExpectedCycleLength = ExpectedCycleEndTime - CycleStartTime;
  ExpectedIntervalTime = ExpectedCycleLength/OutputCycleLength;
  
  PulseTimes[0] = CycleStartTime;
  
  //apply shuffle
  PulseTimes[0] = PulseTimes[0] + (fractionalShuffle*ExpectedIntervalTime);

  //calculate the remaining output pulse times
    for (int i=1; i < OutputCycleLength; i++){
      PulseTimes[i] = PulseTimes[i-1]+ExpectedIntervalTime;
    }
  }

}

void DividerMultiplier::CalculateOutputTimesMidCycle(){
  //both the input cycle time and output cycle time may have changed
//    Serial.print("Mid Cycle Recalc Called. Position in in cycle = ");
//    Serial.print(PositionInInputCycle);
//    Serial.print(" ");
  //first, we need to extrapolate back to when the start of the current input cycle would have been, then calculate the cycle time from that point
  CycleStartTime = InputPulsePredictor.TimeOflastPulsePlusN(PositionInInputCycle);
  ExpectedCycleEndTime = InputPulsePredictor.TimeOfNthPulse(InputCycleLength-PositionInInputCycle);

  if(CycleStartTime !=0 && ExpectedCycleEndTime !=0){
  ExpectedCycleLength = ExpectedCycleEndTime - CycleStartTime;

  //calculate the output times, adjusting for shuffle
    ExpectedIntervalTime = ExpectedCycleLength/OutputCycleLength;
    PulseTimes[0] = CycleStartTime + (fractionalShuffle*ExpectedIntervalTime);
    PulseTimes[OutputCycleLength-1] = CycleStartTime + ExpectedCycleLength + (fractionalShuffle*ExpectedIntervalTime);
    for (int i=(OutputCycleLength-1); i > 0; i--){   //calculate from the end of the cycle backwards until we get to the pulse due next
        PulseTimes[i-1] = PulseTimes[i]-ExpectedIntervalTime;
        if (PulseTimes[i-1]<millis()) { //PulseTimes[i] must be the next pulse due
          PositionInOutputCycle = i;
          break;
        }
    }
  }

}


// registers an input pulse. Advances the input pulse clock.  
//if we reached the end of the cycle, loop back to the start, emit both pulses, and calculate the times for the next set of pulses
void DividerMultiplier::InputPulse() {
  PositionInInputCycle = PositionInInputCycle + 1;
  
  ThruPulseStart=true; // pass to thru output

  if (PositionInInputCycle >= InputCycleLength){    
      PositionInInputCycle = 0;
      PositionInOutputCycle = 0;
      CycleOutPulseStart = true;
      if(fractionalShuffle == 0.0){MainOutPulseStart = true;}
      CycleStartTime = millis();
      CalculateOutputTimesAtCycleStart();
  }
      
}


void DividerMultiplier::CycleReset() {
  //This will mark the next input pulse as the start of the cycle
    PositionInInputCycle=InputCycleLength-1;
}


bool DividerMultiplier::ShouldWeOutputCyclePulse(){
  if (TransmitPulses==true){
    if(CycleOutPulseStart){
      CycleOutPulseStart = false; //registers that the instruction has been read
      return true;
      } else {
        return false;
      } 
    } else {
      return false;
    } 
}


bool DividerMultiplier::ShouldWeOutputMainPulse(){
  if (millis() > PulseTimes[PositionInOutputCycle]){
    if (PositionInOutputCycle<OutputCycleLength){      //The cycle only loops back to the start when triggered by the input signal
      PositionInOutputCycle = PositionInOutputCycle + 1;  
      return true;       
    } else
      return false; 
  } else {
      return false;
  }
}

  bool DividerMultiplier::ShouldWeOutputThruPulse(){    //Note: pulses from "main" will ALSO be passed to the thru output in divider mode. That's not handled by this function.
    if(ThruPulseStart){
      ThruPulseStart = false; //registers that the instruction has been read
      return true;
      } else {
        return false;
      } 
}

//Adjust cycle paramaters without screwing up our place in the cycle
void DividerMultiplier::UpdateKnobValues(int InCycleLengthKnobPlusCV, int OutCycleLengthKnobPlusCV, int ShuffleKnobPlusCV){
    if (InCycleLengthKnobPlusCV != InputCycleLength){
      InputCycleLength = InCycleLengthKnobPlusCV;
      DividerMultiplier::CalculateOutputTimesMidCycle();
      PositionInInputCycle = PositionInInputCycle % InputCycleLength;
      }
            
    if (OutCycleLengthKnobPlusCV != OutputCycleLength){
      //calculate the new set of times for the output cycle, and figure out where we are in the sequence
      OutputCycleLength = OutCycleLengthKnobPlusCV;
      DividerMultiplier::CalculateOutputTimesMidCycle();
    } 
  }

//change our position in the input cycle
void DividerMultiplier::ShiftPositionInInputCycle(int AmoutToShiftBy){
  if (AmoutToShiftBy != 0){
    NewPositionTemp = PositionInInputCycle + AmoutToShiftBy;
  
    //code elswhere expect "position in cycle" to be within a range of 0 .... N-1, where N is cycle length.
    //if we've ended up with a position outside this range, find the equivalent value within the range
    
    if (NewPositionTemp >= InputCycleLength){
      NewPositionTemp = NewPositionTemp + 1; //shift to a frame in which we count from 1 ... N, rather than 0 .... N-1, where N is cycle length
      NewPositionTemp = NewPositionTemp % InputCycleLength;
      NewPositionTemp = NewPositionTemp - 1; //shift back
    }
  
    while (NewPositionTemp < 0){
      NewPositionTemp = NewPositionTemp + InputCycleLength;
    }
  
    PositionInInputCycle = NewPositionTemp;
    DividerMultiplier::CalculateOutputTimesMidCycle();  // update output times to reflect where we now are in the input cycle
  }
}

void DividerMultiplier::UpdateFractionalShuffleTime(float AmountToChangeBy){
  if (AmountToChangeBy != 0){
    fractionalShuffle = fractionalShuffle + AmountToChangeBy;
  
    //force result to a value between 0 and 1;
      while (fractionalShuffle < 0 ){
        fractionalShuffle  = fractionalShuffle + 1.0;
      }
    
      while (fractionalShuffle >= 1){
        fractionalShuffle  = fractionalShuffle - 1.0;
      }
  
    //Set brightness of the shuffle indicator LED to reflect the amount of shuffle
    analogWrite(LEDPin_Shuffle, fractionalShuffle*40);
    
    //update output times accordingly
    DividerMultiplier::CalculateOutputTimesMidCycle();
  }
  
}


//------------------------------------------------------------------------------------------------------------------------
//JitterSmoother is designed to filter out jitter in potentiometer voltages (and CV) which don't correspond to changes in input voltage. 
//This very simple implementation doesn't work especially well, and risks ignoring slow CV changes (eg from a slow LFO). 

class JitterSmoother { 
  int OldValue, NewValue;
  unsigned long int SampleInterval;
  int Threshold;
  unsigned long int TimeOfLastRead;
  
  public:
  JitterSmoother ();
  void SetSampleIntervalandThreshold(unsigned long int,int);
  int SmoothChanges(int);
} JitterSmootherL, JitterSmootherD, JitterSmootherCV;


JitterSmoother::JitterSmoother(){   //initalize values
 OldValue = 1;
 NewValue = 1;
 SampleInterval = 60;
 Threshold = 50;
 TimeOfLastRead = 1;
}

int JitterSmoother::SmoothChanges(int Input){
  if ( (millis() - TimeOfLastRead) > SampleInterval){

    //needed the first time we call the function 
    if (TimeOfLastRead == 1){
      NewValue = Input;
      TimeOfLastRead = millis();
      OldValue = Input;
      return NewValue;  
    }

    //On all the following occasions...
    TimeOfLastRead = millis();  //update for future reference
     
    if ( (Input - OldValue) > Threshold ){  
    NewValue = Input; 
  } else if ( (Input - OldValue) < (-Threshold) ){
    NewValue = Input;
  }  else{
    NewValue = OldValue;
  }

  OldValue = NewValue;
  }
return NewValue;  
}

void JitterSmoother::SetSampleIntervalandThreshold(unsigned long int NewSampleInt, int NewThreshold){
  SampleInterval = NewSampleInt;
  Threshold = NewThreshold;
}


//----------------------------------------------------------------------------------------------------------------------

//the CV assigner will control the routing of CV signals. Currently, everything is controlled by a 3-way switch and this scheme is a bit overkill. but I might want something more sophisticated in future.
class CVassigner {
  bool SwPin_CVup_State;
  bool SwPin_CVdown_State;
//  bool CVcontrolCycleLength, CVcontrolDivisions, CVcontrolShuffle, CVcontrolShift;   <-- I made these to global for now
  float ControlValue_Attenuverter, ControlValue_CVin, ShuffleModifierOld, ShuffleModifierNew, ShuffleModifierChange;
  int CVzeroReading, ShiftModifierOld, ShiftModifierNew, ShiftModifierChange; //the analogRead that results when the control votlage = 0;
  const int CVscalingFactor = 80; //scales the output of CVassigner::readCV to give a result <2000
  const int ShiftCVScalingFactor = 200; //scales the effect CVassigner::ReturnShiftModifier
  const int ShuffleCVScalingFactor = 80; //scales the effect CVassigner::ReturnShuffleModifier


  public:
  CVassigner ();
  void UpdateCVrouting();
  int readCV();
  int ReturnShiftModifier();
  float ReturnFractionalShuffleModifier();
  
} CVassignerMaster;

CVassigner::CVassigner(){  //default starting state is for CV to control divisions
  SwPin_CVup_State = false;
  SwPin_CVdown_State = false;
  CVcontrolCycleLength = false;
  CVcontrolDivisions = true;
  CVcontrolShuffle = false;
  CVcontrolShift = false;
  ControlValue_Attenuverter = 0;
  ControlValue_CVin = 0;
  CVzeroReading = 1710; //this is measured empirically and then hard-coded, for now.
  ShiftModifierOld = 0;
  ShiftModifierNew = 0;
  ShiftModifierChange = 0;
  ShuffleModifierOld = 0.0;
  ShuffleModifierNew = 0.0;
  ShuffleModifierChange = 0.0;
}

void CVassigner::UpdateCVrouting(){
  if ( SwPin_CVup_State != digitalRead(SwPin_CVup) || SwPin_CVdown_State != digitalRead(SwPin_CVdown)  ){   //if the CV switch has changed position
    SwPin_CVup_State = digitalRead(SwPin_CVup);
    SwPin_CVdown_State = digitalRead(SwPin_CVdown);
    if( (SwPin_CVup_State == true) && (SwPin_CVdown_State == false) ){
      CVcontrolCycleLength = true;
      CVcontrolDivisions = false;
      CVcontrolShuffle = false;
      CVcontrolShift = false;
    }else if( (SwPin_CVup_State == true) && (SwPin_CVdown_State == true) ){  //switch in middle position. This might be false/false, depending on the switch, I guess
      CVcontrolCycleLength = false;
      CVcontrolDivisions = true;
      CVcontrolShuffle = false;
      CVcontrolShift = false;
    }else if( (SwPin_CVup_State == false) && (SwPin_CVdown_State == true) ){
      CVcontrolCycleLength = false;
      CVcontrolDivisions = false;
      CVcontrolShuffle = true;
      CVcontrolShift = false;
    }else{
      //Serial.println("ERROR: the CV assign switch is both up and down!");
    }
  }
}

//read CV will return an value between +- ~4000, scaled by the attenuverter (CV amt) knob. 
int CVassigner::readCV(){
  ControlValue_Attenuverter = map(analogRead(CtrPin_CVamt),0,4096,+100,-100);
  ControlValue_Attenuverter = map(analogRead(CtrPin_CVamt),0,4096,+100,-100);  //read twice to give time for the ADC capacitor to equilibrate, avoiding crosstalk from other analog reads 
  //aside: do we need a voltage smoother on the above?
  ControlValue_CVin = analogRead(InPin_CV)-CVzeroReading;
  ControlValue_CVin = JitterSmootherCV.SmoothChanges(analogRead(InPin_CV))-CVzeroReading; //read twice to give time for the ADC capacitor to equilibrate, avoiding crosstalk from other analog reads 
  
  return (int)(ControlValue_Attenuverter*ControlValue_CVin/CVscalingFactor);

}


int CVassigner::ReturnShiftModifier(){
  //the main fuction controlling shift takes an integer input, which is the amount to shift by: void DividerMultiplier::ShiftPositionInInputCycle(int AmoutToShiftBy)
  //we need to keep track of an overall shift related to CV, and send a signal to that fuction only when control voltage changes cause that shift to change
  
  if ( CVcontrolShift == false ) { 
    if (ShiftModifierNew != 0){  //if CV control over shift just got disabled, we want to make sure we reverse any changes which CV control exerted previously
      ShiftModifierOld = ShiftModifierNew;
      ShiftModifierNew = 0;
      return -(ShiftModifierNew-ShiftModifierOld);
    } else {
      return 0; 
    }
  } 

    ShiftModifierOld = ShiftModifierNew; //rememeber shift modifier from last function call
    ShiftModifierNew = (int)(CVassigner::readCV()/ShiftCVScalingFactor);
    ShiftModifierChange = ShiftModifierNew-ShiftModifierOld;
    return -(ShiftModifierChange);
}


float CVassigner::ReturnFractionalShuffleModifier(){
  if ( CVcontrolShuffle == false ) {
    if (ShuffleModifierNew != 0){ 
      //if CV control over shuffle just got disabled, we want to make sure we reverse any changes which CV control exerted previously
      ShuffleModifierOld = ShuffleModifierNew;
      ShuffleModifierNew = 0;
      return -(ShuffleModifierNew-ShuffleModifierOld);
    } else{
      return 0.0; 
    }
  } else { 
    ShuffleModifierOld = ShuffleModifierNew; //rememeber shift modifier from last function call
    ShuffleModifierNew = (float)(CVassigner::readCV()/ShuffleCVScalingFactor)/(float)EncoderShuffleNoOfClicks; //This gives the output the same quantization as the encoder
    ShuffleModifierChange = ShuffleModifierNew - ShuffleModifierOld;
    
        if (ShuffleModifierChange != 0){
         Serial.print(ShuffleModifierNew);
         Serial.print(" ");
         Serial.println(ShuffleModifierChange);
        }
    
    return -(ShuffleModifierChange);
  }
  
}




//----------------------------------------------------------------------------------------------------------------------

void setup() {
  // put your setup code here, to run once:
  
  //Configure pins
  pinMode(SwPin_DivEuc,INPUT_PULLUP);
  pinMode(SwPin_OutModes,INPUT_PULLUP);
  pinMode(SwPin_CVup,INPUT_PULLUP);
  pinMode(SwPin_CVdown,INPUT_PULLUP);
  pinMode(SwPin_Encoder,INPUT);
  
  pinMode(CtrPin_CVamt,INPUT);
  pinMode(CtrPin_Divisions,INPUT);
  pinMode(CtrPin_Length,INPUT);

  pinMode(OutPin_Cycle,OUTPUT);
  pinMode(OutPin_MainOut,OUTPUT);
  pinMode(OutPin_Thru,OUTPUT);
  pinMode(LEDPin_Shuffle,OUTPUT);
  pinMode(LEDPin_internal,OUTPUT);

  pinMode(InPin_Trig,INPUT_PULLUP);
  pinMode(InPin_CV,INPUT);
  
  analogReadRes(12);

  Serial.begin(9600);

  EncKnob.write(0);



  JitterSmootherCV.SetSampleIntervalandThreshold(60,200); //tunes the smoothing algorith for the control voltage
}


//----------------------------------------------------------------------------------------------------------------------

void loop() {
  // deal with input
  clockInState = digitalRead(InPin_Trig);
  
  if(clockInState == 0 && clockInPrevState == 1){      //............if the Trigger In voltage switches from low to high
    InputPulsePredictor.InputPulse();
    DividerMultiplierMain.InputPulse();
  }
    clockInPrevState = clockInState;


  //update knob control values
  //we repeat the reading twice, because if we take the first reading, it will still have some residual influence from the previous reading because the capacitor hasn't had time to charge/discharge. 
  ControlValue_Length = analogRead(CtrPin_Length);
  ControlValue_Length = JitterSmootherL.SmoothChanges(analogRead(CtrPin_Length));
  ControlValue_Divisions = analogRead(CtrPin_Divisions);
  ControlValue_Divisions = JitterSmootherD.SmoothChanges(analogRead(CtrPin_Divisions));
  //Need to re-introduce jitter smoothing at some point

  

  //add control voltage to knob value as appriate
  //Prevent the voltage from pushing the control value beyond the normal range of the knob. 
  if (CVcontrolCycleLength == true){
    ControlValue_Length = ControlValue_Length + CVassignerMaster.readCV();
    if(ControlValue_Length < 0){ControlValue_Length = 0;}
    if(ControlValue_Length > 4096){ControlValue_Length = 4096;}
  }
  
  if(CVcontrolDivisions == true){
    ControlValue_Divisions = ControlValue_Divisions + CVassignerMaster.readCV();
    if(ControlValue_Divisions < 0){ControlValue_Divisions = 0;}
    if(ControlValue_Divisions > 4096){ControlValue_Divisions = 4096;}
  }



  //scale control values to be within specified range
  ControlValue_Length_Scaled = map(ControlValue_Length,0,4096,Length_min,Length_max);
  ControlValue_Divisions_Scaled = map(ControlValue_Divisions,0,4096,Divisions_min,Divisions_max);
//
//  Serial.print(ControlValue_Length_Scaled);
//  Serial.print(" ");
//  Serial.println(ControlValue_Divisions_Scaled);


  //send control values to the brain
  DividerMultiplierMain.UpdateKnobValues(ControlValue_Length_Scaled, ControlValue_Divisions_Scaled, 0);

  //check if the encoder has been turned since the last cycle
  EncoderValTemp = -EncKnob.read();

  //If the encoder has been turned, update values accordingly
  if (EncoderValTemp !=  0){
    if((EncoderValTemp % EncoderCountsPerClick) == 0){  //if this is not true, the knob has not reached an indent yet and must be mid-turn - do nothing     
      if(digitalRead(SwPin_Encoder)==0){
         //if the encoder switch was *not* pushed, we update a shift paramater. This will be fed to the Shift function after any control voltage is added
         EncoderShiftInstruction = (int)EncoderValTemp/EncoderCountsPerClick;
      } else if(digitalRead(SwPin_Encoder)==1){
         //if the encoder switch *was* pushed, update a shuffle paramater 
         EncoderShuffleInstruction = (float)(-EncoderValTemp/EncoderCountsPerClick)/(float)(EncoderShuffleNoOfClicks);
      }
      EncKnob.write(0); //Now that we have read the accumulated value from the encoder, reset encoder reading to zero
    }
  }

  //Apply Shift/Shuffle to pattern, according to encoder changes AND control voltage changes as appropriate 
  DividerMultiplierMain.ShiftPositionInInputCycle(EncoderShiftInstruction + CVassignerMaster.ReturnShiftModifier());
  EncoderShiftInstruction = 0; 
  DividerMultiplierMain.UpdateFractionalShuffleTime(EncoderShuffleInstruction + CVassignerMaster.ReturnFractionalShuffleModifier());
  EncoderShuffleInstruction = 0.0;
  
  //check routing of CV signals
  CVassignerMaster.UpdateCVrouting();

  // deal with starting output pulses
  if(DividerMultiplierMain.ShouldWeOutputThruPulse()==true){
    TrigOutManager_Thru.StartPulse();
  }

  if(DividerMultiplierMain.ShouldWeOutputCyclePulse()==true){
    TrigOutManager_Cycle.StartPulse();
  }

    if(DividerMultiplierMain.ShouldWeOutputMainPulse()==true){
    TrigOutManager_Main.StartPulse();
    TrigOutManager_Thru.StartPulse();
  }
 

  //deal with actually setting voltage on the outputs
  if(TrigOutManager_Thru.ShouldWeBeOutputting()==true){
    digitalWrite(OutPin_Thru,HIGH);
  } else {
    digitalWrite(OutPin_Thru,LOW);
  }

  if(TrigOutManager_Main.ShouldWeBeOutputting()==true){
    digitalWrite(OutPin_MainOut,HIGH);
  } else {
    digitalWrite(OutPin_MainOut,LOW);
  }

  if(TrigOutManager_Cycle.ShouldWeBeOutputting()==true){
    digitalWrite(OutPin_Cycle,HIGH);
  } else {
    digitalWrite(OutPin_Cycle,LOW);
  }

  
}
