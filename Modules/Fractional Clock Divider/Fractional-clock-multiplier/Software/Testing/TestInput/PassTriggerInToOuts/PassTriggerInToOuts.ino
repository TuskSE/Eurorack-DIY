#include <Metro.h> // Include the Metro library

//Define all the pins
const int SwPin_DivEuc = 0;
const int SwPin_OutModes = 1;
const int SwPin_CVup = 2;
const int SwPin_CVdown = 3;
const int SwPin_Encoder = 6;
const int CtrPin_CVamt = 21;
const int CtrPin_Divisions = 20;
const int CtrPin_Length = 19;
const int EncPinA = 4;
const int EncPinB = 5;
const int OutPin_Cycle = 7;
const int OutPin_MainOut = 8;
const int OutPin_Thru = 9;
const int InPin_Trig = 18; //Low input voltage = HIGH reading on pin.
const int InPin_CV = 17;
const int LEDPin_Shuffle = 16;
const int LEDPin_internal = 13;

//recentPresses[] stores the times of the 6 most recent switch presses
//[0] = most recent, [5] = most distant
// every time we write to this, shuffle the array around
double recentClockTimes[6] = {0,0,0,0,0,0}; 
const int recentClockTimesArraySize = 6;

const double ButtonPressTimeout = 5000000; //in microseconds. if the time between two button presses is greater than this, do not use it to set the output clock. 

double pressTimeTemp = 0; //temporarily stores the time, when the button is pressed
int clockInPrevState = 0; // this will remember if the clock input was "on" in the previous cycle 

//multiplication/division factors. These will eventually be controlled by pots.
//float ClicksPerCycle = 8;
float MultDivFactor2 = 1;
float MultDivFactor3 = 1;

void setup() {
  // put your setup code here, to run once:
  
  //Configure pins
  pinMode(SwPin_DivEuc,INPUT_PULLUP);
  pinMode(SwPin_OutModes,INPUT_PULLUP);
  pinMode(SwPin_CVup,INPUT_PULLUP);
  pinMode(SwPin_CVdown,INPUT_PULLUP);
  pinMode(SwPin_Encoder,INPUT);

  pinMode(EncPinA,INPUT_PULLUP);
  pinMode(EncPinB,INPUT_PULLUP);
  
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
}

void loop() {
  // put your main code here, to run repeatedly:

  // deal with input
  if(digitalRead(InPin_Trig) == 0){      //............if the switch turns from off to on
    digitalWrite(OutPin_Thru,HIGH);
    digitalWrite(OutPin_MainOut,HIGH);
    digitalWrite(OutPin_Cycle,HIGH);
  }
  else{
    digitalWrite(OutPin_Thru,LOW);
    digitalWrite(OutPin_MainOut,LOW);
    digitalWrite(OutPin_Cycle,LOW);
  }
  




}
