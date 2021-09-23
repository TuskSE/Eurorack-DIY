#include "DigitalIO.h"
#include <Arduino.h>
#include <SPI.h>
#include "PinDefs.h"

// TO DO: push speed limits
// TO DO: check SPIconfigIN mode
// TO DO: extract individual states. see https://playground.arduino.cc/Code/BitMath/

//Inputs are on SPI bus 0
//Outputs are on SPI bus 1


SPISettings SPIConfigOut(4000000, MSBFIRST, SPI_MODE0);
SPISettings SPIConfigIN(4000000, LSBFIRST, SPI_MODE2);


void DigiIOManager::SetupDout(int SERpin, int LATCHpin, int CLKpin){
    //assume outputs are on SPI bus 1
    Out_SERpin = SERpin;
    Out_LATCHpin = LATCHpin; // latch high -> 595 updates output values
    Out_CLKpin = CLKpin;
    pinMode (Out_LATCHpin, OUTPUT);
	digitalWrite(Out_LATCHpin,LOW);
    //SPI1.setMOSI(Out_SERpin);
   //SPI1.setSCK(Out_CLKpin);
    SPI1.begin();
    SPI1.beginTransaction(SPIConfigOut);

}

void DigiIOManager::SetupDin(int SERpin, int LATCHpin, int CLKpin){
    //assume outputs are on SPI bus 1
    In_SERpin = SERpin;
    In_LATCHpin = LATCHpin; // latch high -> 595 updates output values
    In_CLKpin = CLKpin;
    pinMode (In_LATCHpin, OUTPUT);
	digitalWrite(In_LATCHpin,LOW);
    //SPI1.setMOSI(Out_SERpin);
   //SPI1.setSCK(Out_CLKpin);
    SPI.begin();
    SPI.beginTransaction(SPIConfigIN);
    DebounceThreshold = 20;
    SwitchDebounceCounter = 0;
}


void DigiIOManager::DigitalOutput(char Data){
  digitalWrite(Out_LATCHpin,HIGH);
  SPI1.transfer(Data);
  digitalWrite(Out_LATCHpin,LOW);
}

void DigiIOManager::TestDigitalOut(){
    char OutputA = B11110000;
    char OutputB = B00001111;
    char OutputC = B10000000; //corresponds to CycleOutAll
    DigitalOutput(OutputA);
	delay(200);
	DigitalOutput(OutputB);
	delay(200);
    DigitalOutput(OutputC);
	delay(200);
}

void DigiIOManager::ReadClocks(){
    digitalWrite(In_LATCHpin, HIGH);
    clocks = ~SPI.transfer(0x00000000);
    digitalWrite(In_LATCHpin, LOW);

    clocksOld = clocks;
    if(clocksOld != clocks){
        ClockInAll = bitRead(clocks, 3);
        ClockInA = bitRead(clocks, 2);
        ClockInB = bitRead(clocks, 1);
        ClockInC = bitRead(clocks, 0);
        ResetInAll = bitRead(clocks, 7);
        ResetInA = bitRead(clocks, 6);
        ResetInB = bitRead(clocks, 5);
        ResetInC = bitRead(clocks, 4); 
    }
}

void DigiIOManager::ReadAllDigitalIn(){
    Sw1StatesOld = Sw1States;
    Sw2StatesOld = Sw2States;
    NormalizationProbesOld = NormalizationProbes;
    clocksOld = clocks;

    digitalWrite(In_LATCHpin, HIGH);
    clocks = ~SPI.transfer(0x00000000);
    NormalizationProbes = SPI.transfer(0x00000000);
    Sw1States = ~SPI.transfer(0x00000000);
    Sw2States = ~SPI.transfer(0x00000000);
    //temp = SPI.transfer(0x00000000);
    digitalWrite(In_LATCHpin, LOW);

    // save old clock values
    ClockInAll_old = ClockInAll;
    ClockInA_old = ClockInA;
    ClockInB_old = ClockInB;
    ClockInC_old = ClockInC;
    ResetInAll_old = ResetInAll;
    ResetInA_old = ResetInA;
    ResetInB_old = ResetInB;
    ResetInC_old = ResetInC;

    // read in all clock values
    ClockInAll = bitRead(clocks, 3);
    ClockInA = bitRead(clocks, 2);
    ClockInB = bitRead(clocks, 1);
    ClockInC = bitRead(clocks, 0);
    ResetInAll = bitRead(clocks, 7);
    ResetInA = bitRead(clocks, 6);
    ResetInB = bitRead(clocks, 5);
    ResetInC = bitRead(clocks, 4); 

    // look for changes in clock inputs
    ClockInA_new = 0;
    ClockInB_new = 0;
    ClockInC_new = 0;
    ResetInA_new = 0;
    ResetInB_new = 0;
    ResetInC_new = 0;

    if(ClockInAll & !ClockInAll_old){
        ClockInA_new = 1;
        ClockInB_new = 1;
        ClockInC_new = 1;
        Serial.println("ClockInAllInput");
    }

    if(ResetInAll & !ResetInAll_old){
        ResetInA_new = 1;
        ResetInB_new = 1;
        ResetInC_new = 1;
    }

    if(ClockInA & !ClockInA_old){
        ClockInA_new = 1;
    }
    if(ClockInB & !ClockInB_old){
        ClockInB_new = 1;
    }
    if(ClockInC & !ClockInC_old){
        ClockInC_new = 1;
    }

    if(ResetInA & !ResetInA_old){
        ResetInA_new = 1;
    }
    if(ResetInB & !ResetInB_old){
        ResetInB_new = 1;
    }
    if(ResetInC & !ResetInC_old){
        ResetInC_new = 1;
    }



}

void DigiIOManager::PrintBuffers(){
    Serial.print(clocks, HEX);
    Serial.print(" ");
    Serial.print(NormalizationProbes, HEX);
    Serial.print(" ");
    Serial.print(Sw1States, HEX);
    Serial.print(" ");
    Serial.println(Sw2States, HEX);
    //NB when you display as binary, it seems to trim off MSBs. 

}

char DigiIOManager::ReportSwStates1(){
    return Sw1States;
}

char DigiIOManager::ReportSwStates2(){
    return Sw2States;
}

char DigiIOManager::ReportNormProbes(){
    return NormalizationProbes;
}

bool DigiIOManager::SwitchStateChanged(){
    
    if( (Sw1StatesOld==Sw1States) && (Sw2StatesOld==Sw2States) ){
        SwitchDebounceCounter++;
        if (SwitchDebounceCounter == DebounceThreshold){
            return true;
        } else {
            return false; 
        }
    } else {
        SwitchDebounceCounter = 0;
        return false;
    }
}

bool DigiIOManager::NormalizationStateChanged(){
    if(NormalizationProbesOld==NormalizationProbes){
        return false;
    } else {
        return true;
    }
}

bool DigiIOManager::TrigInStateChanged(){
    if(clocksOld==clocks){
        return false;
    } else {
        return true;
    }
}

void DigiIOManager::UpdateTriggerOutputs(bool ResetA, bool ResetB, bool ResetC, bool TriggerA, bool TriggerB, bool TriggerC){

    bitWrite(OutputInstructions, 0, TriggerC);
    bitWrite(OutputInstructions, 1, TriggerB);
    bitWrite(OutputInstructions, 2, TriggerA);
    bitWrite(OutputInstructions, 3, (TriggerA || (TriggerB || TriggerC)));   //TriggerAll output - fires is any of the other 3 is active
    bitWrite(OutputInstructions, 4, ResetC);
    bitWrite(OutputInstructions, 5, ResetB);
    bitWrite(OutputInstructions, 6, ResetA);
    bitWrite(OutputInstructions, 7, (ResetA || (ResetB || ResetC)));   ////ResetAll output - fires is any of the other 3 is active
    DigitalOutput(OutputInstructions);
}



// ======== TESTING ONLY ======== //
void DigiIOManager::TestSwReads(){
    //for testing only
    bool temp;
    for(int i=0; i<8; i++){
        temp = bitRead(Sw1States, i);
        Serial.print(temp);
        Serial.print(" ");
    }
    Serial.print(" Sw1states       ");

    for(int i=0; i<8; i++){
        temp = bitRead(Sw2States, i);
        Serial.print(temp);
        Serial.print(" ");
    }
    Serial.println(" Sw2states");
}

void DigiIOManager::TestNormProbeReads(){
    bool temp;
    for(int i=0; i<8; i++){
        temp = bitRead(NormalizationProbes, i);
        Serial.print(temp);
        Serial.print(" ");
    }
    Serial.println("  Norm Probe States");
}

void DigiIOManager::TestTrigInReads(){
    bool temp;
    for(int i=0; i<8; i++){
        temp = bitRead(clocks, i);
        Serial.print(temp);
        Serial.print(" ");
    }
    Serial.println("  Trig In States");
}

void DigiIOManager::TestTrigOut(int index){
    for(int i=0; i<8; i++){
        bitWrite(OutputInstructions, i, (i==index));
    }
    DigitalOutput(OutputInstructions);
    bool temp;
    for(int i=0; i<8; i++){
        temp = bitRead(OutputInstructions, i);
        Serial.print(temp);
        Serial.print(" ");
    }
    Serial.println(" Output States    ");

}

void DigiIOManager::PrintTriggerInBools(){
    Serial.print(ClockInA_new);
    Serial.print(ClockInB_new);
    Serial.print(ClockInC_new);
    Serial.print(ResetInA_new);
    Serial.print(ResetInB_new);
    Serial.println(ResetInC_new);
}
