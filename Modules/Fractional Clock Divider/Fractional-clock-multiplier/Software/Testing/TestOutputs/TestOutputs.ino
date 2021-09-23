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
const int InPin_Trig = 18;
const int InPin_CV = 17;
const int LEDPin_Shuffle = 16;
const int LEDPin_internal = 13;


double temp = 0.0;


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



  Serial.begin(9600);




}

void loop() {
  // put your main code here, to run repeatedly:

//test switches
//if(digitalRead(SwPin_Encoder)==HIGH){
//  digitalWrite(LEDPin_internal, HIGH);
//}else
//{
// digitalWrite(LEDPin_internal, LOW);
//
//}



//test output
digitalWrite(OutPin_Thru, HIGH);
delay(2000);
digitalWrite(OutPin_Thru, LOW);
delay(2000);

//test input
//temp = digitalRead(InPin_Trig);
//Serial.println(temp);
//delay(200);
}
