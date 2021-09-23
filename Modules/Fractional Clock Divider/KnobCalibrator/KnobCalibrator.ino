#include <Metro.h> // Include the Metro library
#include <Encoder.h>
const int CalibrateMode = 1;

//Define all the pins
const int SwPin_DivEuc = 0;  // Low input = switch in upper position
const int SwPin_DivEuc2 = 1;   // Low input = switch in lower position
const int SwPin_OutModes = 2;   // Low input = switch in upper position
const int SwPin_OutModes2 = 3;  // Low input = switch in lower position
const int SwPin_CVassign = 4;   //Low input = switch pressed
const int SwPin_Encoder = 7;
const int CtrPin_CVamt = 15;
const int CtrPin_Divisions = 19;
const int CtrPin_Length = 18;
const int OutPin_Cycle = 8;
const int OutPin_MainOut = 9;
const int OutPin_Thru = 10;
const int InPin_Trig = 11; //Low input voltage = HIGH reading on pin.
const int InPin_CV = 14;
const int InPin_Reset = 21;
const int LEDPin_Shuffle = 16;
const int LEDPin_CV_ind_Length = 23;
const int LEDPin_CV_ind_Divs = 22;
const int LEDPin_CV_ind_Shift = 17;
const int LEDPin_CV_ind_Shuffle = 20;
//const int LEDPin_internal = 13;
const int EncPinA = 5;
const int EncPinB = 6;

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

bool EuclideanMode_temp = true; //if 0, runs as clock divider. If 1, runs as euclidean pattern generator. 

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
} JitterSmootherL, JitterSmootherD, JitterSmootherCV, JitterSmootherAttenuverter;


JitterSmoother::JitterSmoother(){   //initalize values
 OldValue = 1;
 NewValue = 1;
 SampleInterval = 60;   //frequency with which we read the knob value
 Threshold = 2;        //if the knob reading (12-bit) changes by more than this amount between reads, we accept the new value 
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
//The knob calibrator is intended to be run one, after assembly of the module, to generate lookup tables which will ensure that knob output matches the ticks on the panel
class KnobCalibrator {
  int CalibrationMeasurements[34],CalibrationMeasurementsAvg[17], CalibrationMeasurementsAvgMidpoints[17], i, j, KnobPin, LookupTable[4096], TempCurrentMap;
  bool SwitchState, SwitchStateOld, ButtonPressed;
  int TempCVbuttonState;
  int OldCVbuttonState = 1;
  int CyclesSincePreviousButtonPress, ButtonRetrigCycles = 10, AvgTemp;
  

  public:
  void SetKnobPin(int);
  void RecordCalibrationValues();
  void TestFunction();
  bool CheckCVButton();
};



void KnobCalibrator::SetKnobPin(int KnobPinTemp){
  KnobPin = KnobPinTemp;
}


bool KnobCalibrator::CheckCVButton(){
    TempCVbuttonState = digitalRead(SwPin_CVassign);   //0 == switch depressed (closed)

    if(TempCVbuttonState == 0){
      if(OldCVbuttonState == 1){  
        //if switch went from open to closed, start counting. only register the press after we've counted a few consecutive cycles of switch depression. This avoids debouncing issues
        CyclesSincePreviousButtonPress = 1;
        OldCVbuttonState = 0;
      } else if (OldCVbuttonState == 0){
        CyclesSincePreviousButtonPress = CyclesSincePreviousButtonPress+1;
        //Serial.println(CyclesSincePreviousButtonPress);
        if(CyclesSincePreviousButtonPress == ButtonRetrigCycles){
          OldCVbuttonState = 0;
          return true;
        }
      }
    }else{
      CyclesSincePreviousButtonPress = 0;
      OldCVbuttonState = 1;
    }

    //remember button state for next time
    OldCVbuttonState = TempCVbuttonState;

    return false;
}

void KnobCalibrator::RecordCalibrationValues(){
  Serial.println("tets");
}
  //Serial.println("Knob calibration initiated");
  
//  for(i=0; i<17; i++){
//    for(j=0; j<2; j++){
//    
//       while(KnobCalibrator::CheckCVButton() == false){   
//             //wait until CV button is pressed 
//             //delay(2);
//        }
//
//        CalibrationMeasurements[j + 2*i] = analogRead(CtrPin_Length);
//        CalibrationMeasurements[j + 2*i] = JitterSmootherL.SmoothChanges(analogRead(CtrPin_Length));
//
//      //Serial.print(i);
//      //Serial.print(" ");
//      //Serial.print(j);
//      //Serial.print(" ");
//      //Serial.println(CalibrationMeasurements[j + 4*i]);
//    
//    }
//  }
//  //Serial.println("Finished!");
//
//  for(i=0; i<34; i++){
//      //Serial.print(CalibrationMeasurements[i]);
//      //Serial.print(" ");
//  }
//  //Serial.println(" ");
//
//
//  //work out the average of each pair of measurements
//  for(i=0; i<17; i++){
//    CalibrationMeasurementsAvg[i] =  round((int) ((float)CalibrationMeasurements[2*1] + (float)CalibrationMeasurements[(2*i) + 1]) / 2.0 );
//  }
//
// for(i=0; i<17; i++){
//      //Serial.print(CalibrationMeasurementsAvg[i]);
//      //Serial.print(" ");
//  }
//   // Serial.println(" ");
//
//  //work out the midpoints between these values
//  for(i=0; i<17; i++){
//    CalibrationMeasurementsAvgMidpoints[i] =  round((int) ((float)CalibrationMeasurementsAvg[i] + (float)CalibrationMeasurementsAvg[i+1]) / 2.0 );
//  }
//
//  //populate lookup table
//  TempCurrentMap = 0;
//  for(i=0; i<4096; i++){
//    LookupTable[i] = TempCurrentMap;
//    if(i == CalibrationMeasurementsAvgMidpoints[TempCurrentMap]){
//      TempCurrentMap++;
//    }
//     
//  }
//
//   for(i=0; i<4096; i++){
//      //Serial.print(LookupTable[i]);
//      //Serial.print(" ");
//  }
//   // Serial.println(" ");


class TempTestClass {
  public:
  void PrintSomething();
};

void TempTestClass::PrintSomething(){
  Serial.println("testy");
}


//----------------------------------------------------------------------------------------------------------------------

void setup() {
  // put your setup code here, to run once:
  
  //Configure pins
  pinMode(SwPin_DivEuc,INPUT_PULLUP);
  pinMode(SwPin_DivEuc2,INPUT_PULLUP);
  pinMode(SwPin_OutModes,INPUT_PULLUP);
  pinMode(SwPin_OutModes2,INPUT_PULLUP);
  pinMode(SwPin_CVassign,INPUT_PULLUP);
  pinMode(SwPin_Encoder,INPUT);
  pinMode(CtrPin_CVamt,INPUT);
  pinMode(CtrPin_Divisions,INPUT);
  pinMode(CtrPin_Length,INPUT);
  pinMode(OutPin_Cycle,OUTPUT);
  pinMode(OutPin_MainOut,OUTPUT);
  pinMode(OutPin_Thru,OUTPUT);
  pinMode(LEDPin_Shuffle,OUTPUT);
  pinMode(LEDPin_CV_ind_Length,OUTPUT);
  pinMode(LEDPin_CV_ind_Divs,OUTPUT);
  pinMode(LEDPin_CV_ind_Shift,OUTPUT);
  pinMode(LEDPin_CV_ind_Shuffle,OUTPUT);
  pinMode(InPin_Trig,INPUT_PULLUP);
  pinMode(InPin_CV,INPUT);
  
  analogReadRes(12);

  Serial.begin(9600);

  EncKnob.write(0);

  JitterSmootherCV.SetSampleIntervalandThreshold(60,200); //tunes the smoothing algorith for the control voltage

}


//----------------------------------------------------------------------------------------------------------------------

void loop() {


  //calibrate mode only
  KnobCalibrator LengthKnobCalibrator;
  LengthKnobCalibrator.SetKnobPin(CtrPin_Length);
  LengthKnobCalibrator.RecordCalibrationValues();
  //DivsKnobCalibrator.SetKnobPin(CtrPin_Divisions);
  //DivsKnobCalibrator.RecordCaliValues();

  //TempTestClass Tester;
  //Tester.PrintSomething();


}
