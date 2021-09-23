#ifndef AnalogOut_H_
#define AnalogOut_H_
#include <i2c_t3.h>
// I've used some code snippets here from the Adapfruit MCP4728 library https://github.com/adafruit/Adafruit_MCP4728

// I wanted to run the DACs at 2x gain with the internal voltage reference. So the maximum Vout would be 4.096V
// however, it turns out that because my supply is only 3.3V, if I set 2x gain then the internal reference doesn't work properly
// even if im only trying to write voltages below 3.3V. It's like the effective internal reference gets scaled from 4.096V to (3.3/4.096)*4.096V
// so, for now i'll use the Vcc reference and see how it goes... 
// actually, there seems to be atleast +-10-20mV variation between different outputs when using Vdd reference. that's like 20 cents...
// when using the internal reference, that's only +-3mV. Still more than I'd like, but I can live with it! 
// so I will work for now with the internal reference, which correponds to 0.5mV per DAC count

//note to self: the way these enums work is that each enum value links implicitly 
//to a binary value. this binary value will will be part of the chain of binary
//values we send to the DAC chip. The ordering of the enum values has been chosen
//with reference to the chip datasheet so that the parseable description corresponds
//with what the chip will understand


const unsigned char DACaddrA = 0B01;
const unsigned char DACaddrB = 0B10;
const unsigned char DACaddrC = 0B11;

typedef enum pd_mode {
  MCP4728_PD_MODE_NORMAL, ///< Normal; the channel outputs the given value as
                          ///< normal.
  MCP4728_PD_MODE_GND_1K, ///< VOUT is loaded with 1 kΩ resistor to ground. Most
                          ///< of the channel circuits are powered off.
  MCP4728_PD_MODE_GND_100K, ///< VOUT is loaded with 100 kΩ resistor to ground.
                            ///< Most of the channel circuits are powered off.
  MCP4728_PD_MODE_GND_500K, ///< VOUT is loaded with 500 kΩ resistor to ground.
                            ///< Most of the channel circuits are powered off.
} MCP4728_pd_mode_t;

typedef enum gain {
  MCP4728_GAIN_1X,
  MCP4728_GAIN_2X,
} MCP4728_gain_t;

typedef enum vref {
  MCP4728_VREF_VDD,
  MCP4728_VREF_INTERNAL,
} MCP4728_vref_t;

typedef enum channel {
  MCP4728_CHANNEL_A,
  MCP4728_CHANNEL_B,
  MCP4728_CHANNEL_C,
  MCP4728_CHANNEL_D,
} MCP4728_channel_t;


// AnalogOutManager managed the hardware side of analog output
// i.e. talking to the DACs etc
class AnalogOutManager{

    private:
    i2c_t3 *_wire; //points to the wire object associated with the i2c line that the ADCs are on

    public:
    unsigned char DACaddrA = 0B01;
    unsigned char DACaddrB = 0B10;
    unsigned char DACaddrC = 0B11;
    void assignWire(i2c_t3 *theWire = &Wire);
    void writeI2Caddress(int ldac_pin, unsigned char old_addr, unsigned char new_addr);
    void setI2CaddressAll();
    void writeSingleChannel(unsigned char addr, MCP4728_channel_t channel, uint16_t new_value, MCP4728_vref_t new_vref, MCP4728_gain_t new_gain);
    void FastWrite(unsigned char addr, uint16_t Avalue, uint16_t Bvalue, uint16_t Cvalue, uint16_t Dvalue);
    void setVoltageReferenceAllInternal(bool yn);
    void setGainAll2x(bool yn);
    void setGain(unsigned char addr, MCP4728_gain_t gainA, MCP4728_gain_t gainB, MCP4728_gain_t gainC, MCP4728_gain_t gainD);
    void setVoltageReference(unsigned char addr, MCP4728_vref_t VrefA, MCP4728_vref_t VrefB, MCP4728_vref_t VrefC, MCP4728_vref_t VrefD);

    //used mostly for prototyping 
    bool pollI2Caddress(unsigned char addr); 
    void softUpdate();
    void FastWriteAllLow();
    void FastWriteAllHigh();    
    void ReadStatus(unsigned char addr);
    void setalloutputs(uint16_t value);
    void zeroAllOutputs();
    void maxAllOutputs();    

};

// The channel manager keeps track of e.g.:
// which stages are currently firing
// what output jacks are plugged
// Summing the channel voltages as required
// voltage quantization
class stageManager{
    private:
    bool OutputJackPlugged[8]; // used for normalization

    // for quantization: the 12 bits correspond to C, C#, D, D#, etc
    // a "true" value means we quantize to that bit
    bool quantizationA[12] = {0,0,0,0,0,0,0,0,0,0,0,0};  
    bool quantizationB[12] = {0,0,0,0,0,0,0,0,0,0,0,0};
    bool quantizationC[12] = {0,0,0,0,0,0,0,0,0,0,0,0};

    
    //bool quantizationTemp[12];  //only used temporarily 

    // voltages are stored as integrers, on a scale of 1 unit = 0.5mV
    uint16_t stageVoltages[8] = {0, 0, 0, 0, 0, 0, 0, 0};  
    uint16_t stageVoltagesCascaded[8] = {0, 0, 0, 0, 0, 0, 0, 0};
    const uint16_t maxStageVoltage = 3000; //this is the maximum value of a V slider, when the scale slider is at its maximum value
    const uint16_t maxDACvoltage = 4095; //the physical maximum the DAC can output on any given channel. If we tell it to output more than this, it goes all funny. 
    const uint16_t quantizeVoltageValues[12] = {0, 167, 333, 500, 667, 833, 1000, 1167, 1333, 1500, 1667, 1833}; // DAC values corresponding to C, C#, D, D#, E, etc
    const uint16_t DACcountsPerVolt = 2000;
    const int semitoneRange = 24; //the maximum range of semitones we can output from the DAC

    float VoltageMultiplier = 0.0; //value will be calculated during initialization
    
    bool stageActiveAny[8] = {false,false,false,false,false,false,false,false};  // only "active" stages produce non-zero voltages
    bool stageActiveA[8] = {false,false,false,false,false,false,false,false};
    bool stageActiveB[8] = {false,false,false,false,false,false,false,false};
    bool stageActiveC[8] = {false,false,false,false,false,false,false,false};

    public:


    // initial setup
    void initialize();
    
    // regular use
    uint16_t stageDACvalues[9]; //9th value is the "scale" slider
    void UpdateNormalizationStates(char NormalizationProbeStates); 
    void SliderToStageVoltages(); // also takes account of which stages are active
    void quantizeVoltages();
    void CascadeVoltages();
    void WriteStageVoltagesToDACs(AnalogOutManager AO);
    void UpdateQuantization(bool quantA[12], bool quantB[12], bool quantC[12]);
    void SetActiveStages(bool stagesA[8], bool stagesB[8], bool stagesC[8]);

    //testing and development
    void PrintNormalizationStates();
    void PrintVoltageOutputs();
    void ManualSetStageVoltageValues();
    void UpdateStageVoltageValues(); // reads voltages from stageDACvalues, deals with cascading
};

#endif //AnalogOut_H_


// to do:
// finish quantizeVoltages
// test slider to voltages,  cascade thing

