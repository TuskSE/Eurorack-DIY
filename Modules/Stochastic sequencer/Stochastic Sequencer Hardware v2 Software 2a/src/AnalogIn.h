#ifndef AnalogIn_H_
#define AnalogIn_H_
#include <ResponsiveAnalogRead.h>

#endif //AnalogIn_H_


class AnalogInManager{
    private: 

  
    // Pslidervalue_converted = Pslidervalue_12bit * Psliderconversion
    // PsliderConversion = 511 gives a maximum absolute pslider value of 8
    const float PsliderConversion = 0.002;
    float PsliderValueMax = 4060.0*PsliderConversion;
    float PsliderValuesConverted[8];
    
    
    //ResponsiveAnalogRead settings
    float SnapMultiplierCV = 0.01;   // higher settings -> less smoothed
    float activityThresholdCV = 20;
    float SnapMultiplierSlider = 0.01;
    float activityThresholdSlider = 8;

    //delay between measurements to allow measurement cap to charge
    int delaytime = 0;

    public: 
    //keep track of read voltages using these ResponsiveAnalogRead objects
    //This will, I hope, deal with smoothing out measurement noise
    ResponsiveAnalogRead VsliderValues[8];
    ResponsiveAnalogRead PsliderValues[8];
    ResponsiveAnalogRead VscaleSlider, PscaleSlider;
    ResponsiveAnalogRead CVknobValues[4];


    // P slider values following scale adjustment according to the second CV knob
    // the number are actual probabilities. ie P=1.0 is 100% probability.
    float PsliderValuesAdjusted[8] = {0,0,0,0,0,0,0,0}; 

    // on the int scale, P=1000 is 100% probability
    int PsliderValuesAdjustedInt[8] = {0,0,0,0,0,0,0,0}; 
    
    // 0 = never re-roll dice
    // 1000 = always re-roll dice
    int DejaVuValue = {0};  

    void initialize();
    void setMuxPins(bool pin1value, bool pin2value, bool pin3value);
    void readAllAnalogInputs();
    void readCVknobInputs();
    void convertCVknobValues();
    void reportVsliderDACValues(uint16_t * valuesArray);

    //void applyCVknobScalingToPsliders();
    void applyCVknobScalingToPsliderValues();
    // subroutines


    //for debugging/development
    void printCVknobValues();
    void printVsliderValues();
    void printPsliderValues();
    void printPsliderValuesAdjusted();
    void printPsliderValuesAdjustedInt();
    int reportAdjustedPSliderValue(int i);
};



// to do: 
// get the smoothing working with the responsive read functions - DONE
// set the zero limits for the cv inputs - DONE for sliders, for CV inputs: will do in hardware
// check cv inputs - DONE, hardware fixes needed
// write code to convert slider value to voltage. i guess we want ~3V at maximum range
// write code to add upp voltages. 