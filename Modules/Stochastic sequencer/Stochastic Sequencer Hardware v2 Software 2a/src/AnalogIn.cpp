#include "AnalogIn.h"
#include <Arduino.h>
#include "PinDefs.h"
#include <ResponsiveAnalogRead.h>

//int integer_power(int a,int b){
//    int r; //result
//}


void AnalogInManager::initialize(){
    //init analog read pins
    analogReadResolution(12); // (0-4095)

    for(int i=0; i<8; i++){
        VsliderValues[i].setAnalogResolution(4096);
        VsliderValues[i].setSnapMultiplier(SnapMultiplierSlider);
        VsliderValues[i].setActivityThreshold(activityThresholdSlider);
        VsliderValues[i].enableSleep();
        VsliderValues[i].enableEdgeSnap();

        PsliderValues[i].setAnalogResolution(4096);
        PsliderValues[i].setSnapMultiplier(SnapMultiplierSlider);
        PsliderValues[i].setActivityThreshold(activityThresholdSlider);
        PsliderValues[i].enableSleep();
        PsliderValues[i].enableEdgeSnap();
    }
    for(int i=0; i<4; i++){
        CVknobValues[i].setAnalogResolution(4096);
        CVknobValues[i].setSnapMultiplier(SnapMultiplierCV);
        CVknobValues[i].setActivityThreshold(activityThresholdCV);
        CVknobValues[i].enableEdgeSnap();
    }
    VscaleSlider.setAnalogResolution(4096); 
    VscaleSlider.setSnapMultiplier(SnapMultiplierSlider);
    VscaleSlider.setActivityThreshold(activityThresholdSlider);
    VscaleSlider.enableSleep();
    VscaleSlider.enableEdgeSnap();

    PscaleSlider.setAnalogResolution(4096);
    PscaleSlider.setSnapMultiplier(SnapMultiplierSlider);
    PscaleSlider.setActivityThreshold(activityThresholdSlider);
    PscaleSlider.enableSleep();
    PscaleSlider.enableEdgeSnap();

    //init mux control pins
    pinMode (AreadMuxControlPin1, OUTPUT);
    pinMode (AreadMuxControlPin2, OUTPUT);
    pinMode (AreadMuxControlPin3, OUTPUT);
	digitalWrite(AreadMuxControlPin1,LOW);
    digitalWrite(AreadMuxControlPin2,LOW);
    digitalWrite(AreadMuxControlPin3,LOW);
};

void AnalogInManager::setMuxPins(bool pin1value, bool pin2value, bool pin3value){
    digitalWrite(AreadMuxControlPin1,pin1value);
    digitalWrite(AreadMuxControlPin2,pin2value);
    digitalWrite(AreadMuxControlPin3,pin3value);
};

void AnalogInManager::readAllAnalogInputs(){
    setMuxPins(0,0,0);
    VsliderValues[2].update(analogRead(A0));
    PsliderValues[2].update(4038-analogRead(A1));
    VscaleSlider.update(analogRead(A2));

    setMuxPins(0,0,1);
    VsliderValues[7].update(analogRead(A0));
    PsliderValues[4].update(4038-analogRead(A1));
    CVknobValues[0].update(analogRead(A2));

    setMuxPins(0,1,0);
    delayMicroseconds(delaytime);
    VsliderValues[0].update(analogRead(A0));
    delayMicroseconds(delaytime);
    PsliderValues[0].update(4038-analogRead(A1));
    delayMicroseconds(delaytime);

    setMuxPins(0,1,1);
    VsliderValues[6].update(analogRead(A0));
    PsliderValues[5].update(4038-analogRead(A1));
    CVknobValues[2].update(analogRead(A2));

    setMuxPins(1,0,0);
    VsliderValues[1].update(analogRead(A0));
    PsliderValues[1].update(4038-analogRead(A1));
    PscaleSlider.update(4038-analogRead(A2));

    setMuxPins(1,0,1);
    VsliderValues[4].update(analogRead(A0));
    PsliderValues[7].update(4038-analogRead(A1));
    CVknobValues[1].update(analogRead(A2));

    setMuxPins(1,1,0);
    VsliderValues[3].update(analogRead(A0));
    PsliderValues[3].update(4038-analogRead(A1));

    setMuxPins(1,1,1);
    VsliderValues[5].update(analogRead(A0));
    PsliderValues[6].update(4038-analogRead(A1));
    CVknobValues[3].update(analogRead(A2));
};

void AnalogInManager::readCVknobInputs(){

    setMuxPins(1,0,0);
    delayMicroseconds(delaytime);
    CVknobValues[0].update(analogRead(A2));

    setMuxPins(1,0,1);
    delayMicroseconds(delaytime);
    CVknobValues[1].update(analogRead(A2));

    setMuxPins(1,1,0);
    delayMicroseconds(delaytime);
    CVknobValues[2].update(analogRead(A2));

    setMuxPins(1,1,1);
    delayMicroseconds(delaytime);
    CVknobValues[3].update(analogRead(A2));
};


void AnalogInManager::convertCVknobValues(){
    // convert deja vu knob
    // knob seems to output integer values between 140 - 4032
    // we want to put a bit of dead zone at the extreme ends of the knob range
    DejaVuValue = (CVknobValues[0].getValue() - 160)*1000/3800;

    if(DejaVuValue>1000){
        DejaVuValue=1000;
    }
    if(DejaVuValue<0){
        DejaVuValue=0;
    }   
};

void AnalogInManager::applyCVknobScalingToPsliderValues(){
    // we expect the input value to be between 0 and 4095
    // we are also aiming for a bipolar effect, so 
    

    // IF the CV knob is a little CW (2 o clock), P slider values are unchanged
    // IF the CV knob is a little CCW (10 o clock), P slider values are inverted around the middle value
    // IF the CV knob is in the middle (12 o clock), all P slider values are at half (*before* scaling by the scale slider)
    // IF the CV knob is far CW, then large P slider values are increased, and small P slider values are decreased, so as to emphasise the differences
    // IF the CV knob is far CCW, then it behaves similar to the far CW case except inverted

    // reset the adjusted slider values to zero?
    // TO DO

    // read in the CV knob value
    // NB; we need to convert from a unipolar int to bipolar
    int inputValueBipolar = (int)CVknobValues[1].getValue()-2100;

    float fraction = (float)inputValueBipolar/682;  
    // fraction = 1 : P slider values unchanged
    // fraction = -1 : P slider values inverted

    //This non-linear scaling of "fraction" gives a nice knob response
    fraction = fraction*(pow((abs(fraction)-1),2));
    

    // convert P slider values into absolute probabilities
    float scale = (float)PscaleSlider.getValue()/4000.0;
    for(int i=0;i<8;i++){
        PsliderValuesConverted[i] = scale*(float)PsliderValues[i].getValue()*PsliderConversion;
    }

    // target = the average value of the P sliders
    float meanvalue = 0;
    for(int i=0;i<8;i++){
        meanvalue = meanvalue + PsliderValuesConverted[i];
    }
    meanvalue = meanvalue/8;  

    float distance = 0;
    float targetdistance = 0;
    for(int i=0;i<8;i++){
        distance = PsliderValuesConverted[i]-meanvalue;
        targetdistance = fraction*distance;
        PsliderValuesAdjusted[i] = meanvalue + targetdistance;
        if(PsliderValuesAdjusted[i]<0){
            PsliderValuesAdjusted[i]  =0;
        }
        if(abs(fraction)>1){
            PsliderValuesAdjusted[i] = pow(PsliderValuesAdjusted[i],abs(fraction));
        }
    }

    // try to keep the mean value of the P sliders unchanged
    float newmeanvalue = 0;
    for(int i=0;i<8;i++){
        newmeanvalue = newmeanvalue +  PsliderValuesAdjusted[i];
    }
    newmeanvalue = newmeanvalue/8;

    if(newmeanvalue>meanvalue){
        for(int i=0;i<8;i++){
            PsliderValuesAdjusted[i] = PsliderValuesAdjusted[i]*meanvalue/newmeanvalue;
        }
    }

    // if any of the adjusted P slider values exceed the physical real life range of the sliders, 
    // adjust everything downwards to bring it back to a reachable level
    float maxvalue = 0;
    for(int i=0; i<8; i++){
        if(PsliderValuesAdjusted[i]>maxvalue){
            maxvalue = PsliderValuesAdjusted[i];
        }
    }

    if(maxvalue>PsliderValueMax){
        for(int i=0;i<8;i++){
            PsliderValuesAdjusted[i] = PsliderValuesAdjusted[i]*PsliderValueMax/maxvalue;
        }
    }

    // convert to ints
    for( int i=0; i<8; i++){
        PsliderValuesAdjustedInt[i] = (int)(PsliderValuesAdjusted[i]*1000.0);
    }

}

    //for debugging/development


void AnalogInManager::printPsliderValuesAdjusted(){
    Serial.print("P knobs (adj) : ");

    for(int i=0; i<8; i++){
        Serial.print(PsliderValuesAdjusted[i]);
        Serial.print(" ");
    }

    Serial.println(" end");
};

void AnalogInManager::printPsliderValuesAdjustedInt(){
    Serial.print("P knobs (adj) : ");

    for(int i=0; i<8; i++){
        Serial.print(PsliderValuesAdjustedInt[i]);
        Serial.print(" ");
    }

    Serial.println(" end");
};

void AnalogInManager::printCVknobValues(){
    Serial.print("CV knobs : ");

    for(int i=0; i<4; i++){
        Serial.print(CVknobValues[i].getValue());
        Serial.print(" ");
    }

    Serial.println(" end");
};

void AnalogInManager::printVsliderValues(){
    Serial.print("V knobs : ");

    for(int i=0; i<8; i++){
        Serial.print(VsliderValues[i].getValue());
        Serial.print(" ");
    }

    Serial.print(VscaleSlider.getValue());

    Serial.println(" end");

};

void AnalogInManager::printPsliderValues(){
    Serial.print("P knobs : ");

    for(int i=0; i<8; i++){
        Serial.print(PsliderValues[i].getValue());
        Serial.print(" ");
    }

    Serial.print(PscaleSlider.getValue());

    Serial.println(" end");
};

void AnalogInManager::reportVsliderDACValues(uint16_t * valuesArray){
    // this copies the readings from the V sliders into a valuesArray
    
    for(int i=0; i<8; i++){
        valuesArray[i] = VsliderValues[i].getValue();
    }
    valuesArray[8] = VscaleSlider.getValue();
};

int AnalogInManager::reportAdjustedPSliderValue(int i){
    return PsliderValuesAdjusted[i];
}
