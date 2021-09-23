#include "AnalogOut.h"
#include <Arduino.h>
#include "PinDefs.h"
//#include <i2c_t3.h>

// there's a more sophisticated SPI library I could have used (https://github.com/nox771/i2c_t3), but I think Adafruit_MPR121.h requires the default teensy one. 

//IMPORTANT: writing the DAC EEPROM takes time, in which you shouldn't send another command. This is why the chip has the RDY/BSY pin, so you can read whether the chip's ready for a new instruction.
//I didn't really appreciate the importance of this when I designed the schematic. 
//The fast write command has the benefit of not writing to the EEPROM. Single writes *do* save so the EEPROM. 



void AnalogOutManager::assignWire(i2c_t3 *theWire){
    _wire = theWire;
}

void AnalogOutManager::writeI2Caddress(int ldac_pin, unsigned char old_addr, unsigned char new_addr){
    // inspired by user jonr from the teensy forum
    delay(10);
    
    digitalWriteFast(ldac_pin, HIGH); // set LDAC high

    // check the wire speed
    uint32_t clockFreq = 0;
    clockFreq = _wire->getClock();

    uint32_t clockPeriod_micros = 0;
    clockPeriod_micros = 1000000/clockFreq;

    //Serial.print("clock freq = ");
    //Serial.println(clockFreq);
    //Serial.print("clock period / us = ");
    //Serial.println(clockPeriod_micros);


    _wire->beginTransmission((unsigned char)(0B01100000 | (old_addr << 0))); // 7 bit address 0xC0
    _wire->send( (unsigned char)(0B01100001 | (old_addr << 2))); // LDAC should go low at the end of this byte, 0x61
    _wire->send( (unsigned char)(0B01100010 | (new_addr << 2))); 
    _wire->send( (unsigned char)(0B01100011 | (new_addr << 2))); 

    // send it
    noInterrupts(); // timing is critical

    _wire->sendTransmission();
    // set LDAC low at exactly the right time; after teh 18th falling edge of the CLK
    // use a scope or logic analyzer to verify against clock and data lines
    // could also poll the clock pin for 18 falling edges
    delayMicroseconds(clockPeriod_micros*18.4); 
    digitalWriteFast(ldac_pin, LOW); // set LDAC low
    // it remains to be seen how reliable this really is 
    interrupts();

}



bool AnalogOutManager::pollI2Caddress(unsigned char addr){
    
    _wire->beginTransmission(addr);
    _wire->endTransmission();
    switch(_wire->status()){
        case I2C_WAITING:
            Serial.print(addr,BIN);
            Serial.println(" : target found");
            return true;
            break;
        case I2C_ADDR_NAK:
            Serial.print(addr, BIN);
            Serial.println(" : no response from target");
            return false;
            break;
        default:
            return false;
            break;
        
    }
}

void AnalogOutManager::setI2CaddressAll(){
    //This is a super janky way of making sure the addresses DAC chips are set correctly when we're not 100% sure what the chip addresses are to start 
    //it would be more smart to read the i2C addrss from each in turn, but i haven't quitegot the hand of the right I2C syntax...

    unsigned char possibleAddresses[8];
    possibleAddresses[0] = 0B00000000;
    possibleAddresses[1] = 0B00000001;
    possibleAddresses[2] = 0B00000010;
    possibleAddresses[3] = 0B00000011;
    possibleAddresses[4] = 0B00000100;
    possibleAddresses[5] = 0B00000101;
    possibleAddresses[6] = 0B00000110;
    possibleAddresses[7] = 0B00000111;

    Serial.println("test");

    for (int i=0; i<8; i++){
        Serial.println(i);
        writeI2Caddress(Dout_DAC_C_LDACpin, possibleAddresses[i], DACaddrC);
        writeI2Caddress(Dout_DAC_B_LDACpin, possibleAddresses[i], DACaddrB);
        writeI2Caddress(Dout_DAC_A_LDACpin, possibleAddresses[i], DACaddrA);
    }

    Serial.println("here10");
    //check that the addresses we tried to write are present on the bus 

    if(pollI2Caddress(0B01100000 | DACaddrA)){
        if(pollI2Caddress(0B01100000 | DACaddrB)){
            if(pollI2Caddress(0B01100000 | DACaddrC)){
                Serial.println("DACs addressed successfully");
            }
        }
    }

    Serial.println(pollI2Caddress(0B01100000 | DACaddrA));
    Serial.println(pollI2Caddress(0B01100000 | DACaddrB));
    Serial.println(pollI2Caddress(0B01100000 | DACaddrC));

}

void AnalogOutManager::writeSingleChannel(unsigned char addr, MCP4728_channel_t channel, 
    uint16_t new_value, MCP4728_vref_t new_vref, MCP4728_gain_t new_gain){
        
        // single write command: FIg 5-10 from the datasheet
        uint8_t output_buffer[3];


        // build the address
        // 1100xxx0
        //uint8_t addrbyte = ( 0B1100000 | (addr) << 1);
        uint8_t addrbyte = ( 0B1100000 | addr );   // im pretty sure this is correct
        output_buffer[0] = ( 0B01011000 | (channel << 1));
        //output_buffer[0] = ( 0B01011000 );
        uint16_t finalbytes = ( new_value | (new_vref << 15) | (new_gain << 12) );
        output_buffer[1] = finalbytes >> 8;
        output_buffer[2] = finalbytes;

        Serial.println(output_buffer[0],BIN);
        Serial.print("transmission status: ");
        _wire->beginTransmission(addrbyte); 
        Serial.println(_wire->write(output_buffer,3)); 
        Serial.println(_wire->endTransmission());
        delay(100);

        
}

void AnalogOutManager::zeroAllOutputs(){
    writeSingleChannel(DACaddrA, MCP4728_CHANNEL_A, 0, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrA, MCP4728_CHANNEL_B, 0, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrA, MCP4728_CHANNEL_C, 0, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrA, MCP4728_CHANNEL_D, 0, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrB, MCP4728_CHANNEL_A, 0, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrB, MCP4728_CHANNEL_B, 0, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrB, MCP4728_CHANNEL_C, 0, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrB, MCP4728_CHANNEL_D, 0, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrC, MCP4728_CHANNEL_A, 0, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrC, MCP4728_CHANNEL_B, 0, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrC, MCP4728_CHANNEL_C, 0, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrC, MCP4728_CHANNEL_D, 0, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);

}

void AnalogOutManager::maxAllOutputs(){
    writeSingleChannel(DACaddrA, MCP4728_CHANNEL_A, 2000, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrA, MCP4728_CHANNEL_B, 2000, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrA, MCP4728_CHANNEL_C, 2000, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrA, MCP4728_CHANNEL_D, 2000, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrB, MCP4728_CHANNEL_A, 2000, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrB, MCP4728_CHANNEL_B, 2000, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrB, MCP4728_CHANNEL_C, 2000, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrB, MCP4728_CHANNEL_D, 2000, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrC, MCP4728_CHANNEL_A, 2000, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrC, MCP4728_CHANNEL_B, 2000, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrC, MCP4728_CHANNEL_C, 2000, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    writeSingleChannel(DACaddrC, MCP4728_CHANNEL_D, 2000, MCP4728_VREF_INTERNAL, MCP4728_GAIN_1X);
    digitalWriteFast(Dout_DAC_A_LDACpin, HIGH); // set LDAC high
    digitalWriteFast(Dout_DAC_B_LDACpin, HIGH); // set LDAC high
    digitalWriteFast(Dout_DAC_C_LDACpin, HIGH); // set LDAC high
    digitalWriteFast(Dout_DAC_A_LDACpin, LOW); // set LDAC high
    digitalWriteFast(Dout_DAC_B_LDACpin, LOW); // set LDAC high
    digitalWriteFast(Dout_DAC_C_LDACpin, LOW); // set LDAC high
}

void AnalogOutManager::setalloutputs(uint16_t value){
    FastWrite(DACaddrA, value, value, value, value);
    FastWrite(DACaddrB, value, value, value, value);
    FastWrite(DACaddrC, value, value, value, value);
}

void AnalogOutManager::FastWrite(unsigned char addr, uint16_t Avalue, uint16_t Bvalue, uint16_t Cvalue, uint16_t Dvalue){
        
    // single write command: FIg 5-7 from the datasheet
    uint8_t output_buffer[8];

    //uint8_t addrbyte = ( 0B1100000 | addr );   // im pretty sure this is correct
    uint8_t addrbyte = ( 0B1100000 | addr ); 
    uint16_t Abytes = ( 0B0000000000000000 | Avalue  );
    uint16_t Bbytes = ( 0B0100000000000000 | Bvalue  );
    uint16_t Cbytes = ( 0B0100000000000000 | Cvalue  );
    uint16_t Dbytes = ( 0B0100000000000000 | Dvalue  );
    output_buffer[0] = Abytes >> 8;
    output_buffer[1] = Abytes;
    output_buffer[2] = Bbytes >> 8;
    output_buffer[3] = Bbytes;
    output_buffer[4] = Cbytes >> 8;
    output_buffer[5] = Cbytes;
    output_buffer[6] = Dbytes >> 8;
    output_buffer[7] = Dbytes;

    _wire->beginTransmission(addrbyte); 
    _wire->write(output_buffer,8);
    _wire->endTransmission();

    //Serial.println(_wire->write(output_buffer,8));
    //Serial.println(_wire->endTransmission());

    // debug: try wake-up
    //_wire->beginTransmission(0B0000000);
    //_wire->write(0B000001001);
    //Serial.println(_wire->endTransmission());

    // debug: try software update
    //_wire->beginTransmission(0B0000000);
    //_wire->write(0B00001000);
    //Serial.println(_wire->endTransmission());
    //Serial.println("end");
}

void AnalogOutManager::FastWriteAllHigh(){
    FastWrite(DACaddrC, 4000,4000,4000,4000);
    FastWrite(DACaddrB, 4000,4000,4000,4000);
    FastWrite(DACaddrA, 4000,4000,4000,4000);
}

void AnalogOutManager::FastWriteAllLow(){
    FastWrite(DACaddrA, 0,0,0,0);
    FastWrite(DACaddrB, 0,0,0,0);
    FastWrite(DACaddrC, 0,0,0,0);
}


void AnalogOutManager::softUpdate(){
    // debug: try software update
    _wire->beginTransmission(0B0000000);
    _wire->write(0B00001000);
    Serial.println(_wire->endTransmission());
}

void AnalogOutManager::ReadStatus(unsigned char addr){
    Serial.println("begin read:");
    uint8_t addrbyte = ( 0B1100000 | addr ); 
    Serial.print(_wire->requestFrom(addrbyte, 12));
    Serial.print(" ");
    //Serial.print( _wire->status());
    for(int i=0; i<10; i++){
        Serial.print(_wire->readByte(),BIN);
        Serial.print(" ");
    }
    Serial.println("read finish");

}

void AnalogOutManager::setVoltageReference(unsigned char addr, MCP4728_vref_t VrefA, MCP4728_vref_t VrefB, MCP4728_vref_t VrefC, MCP4728_vref_t VrefD){
    uint8_t addrbyte = ( 0B1100000 | addr ); 
    uint8_t databyte = ( 0B10000000 | VrefA << 3 | VrefB << 2 | VrefC << 1 | VrefD );
    _wire->beginTransmission(addrbyte);
    _wire->write(databyte);
    _wire->endTransmission();
}

void AnalogOutManager::setVoltageReferenceAllInternal(bool yn){
    MCP4728_vref_t Vref = MCP4728_VREF_VDD;
    if (yn == true){
        Vref = MCP4728_VREF_INTERNAL;
    }
    setVoltageReference(DACaddrA, Vref, Vref, Vref, Vref);
    setVoltageReference(DACaddrB, Vref, Vref, Vref, Vref);
    setVoltageReference(DACaddrC, Vref, Vref, Vref, Vref);
}

void AnalogOutManager::setGain(unsigned char addr, MCP4728_gain_t gainA, MCP4728_gain_t gainB, MCP4728_gain_t gainC, MCP4728_gain_t gainD){
    uint8_t addrbyte = ( 0B1100000 | addr ); 
    uint8_t databyte = ( 0B11000000 | gainA << 3 | gainB << 2 | gainC << 1 | gainD );
    _wire->beginTransmission(addrbyte);
    _wire->write(databyte);
    _wire->endTransmission();
}

void AnalogOutManager::setGainAll2x(bool yn){
    MCP4728_gain_t gain = MCP4728_GAIN_1X;
    if (yn == true){
        gain = MCP4728_GAIN_2X;
    }
    setGain(DACaddrA, gain, gain, gain, gain);
    setGain(DACaddrB, gain, gain, gain, gain);
    setGain(DACaddrC, gain, gain, gain, gain);
}






void stageManager::initialize(){
    VoltageMultiplier = (float)maxStageVoltage/(16293332.0);
}

void stageManager::UpdateNormalizationStates(char NormalizationProbeStates){
    OutputJackPlugged[0] = bitRead(NormalizationProbeStates,0);
    OutputJackPlugged[1] = bitRead(NormalizationProbeStates,1);
    OutputJackPlugged[2] = bitRead(NormalizationProbeStates,3);
    OutputJackPlugged[3] = bitRead(NormalizationProbeStates,2);
    OutputJackPlugged[4] = bitRead(NormalizationProbeStates,7);
    OutputJackPlugged[5] = bitRead(NormalizationProbeStates,6);
    OutputJackPlugged[6] = bitRead(NormalizationProbeStates,5);
    OutputJackPlugged[7] = bitRead(NormalizationProbeStates,4);
}

void stageManager::PrintNormalizationStates(){

    for(int i=0; i<8; i++){
        Serial.print(OutputJackPlugged[i]);
        Serial.print(" ");
    }

    Serial.println("    Norm Probes");
}

void stageManager::UpdateStageVoltageValues(){
    // this is going to convert the ADC values from the voltage sliders into actual voltages
    // incorporates the scaling due to the "scale" V slider
    // also calculates the cascaded summing of outputs

    // this assumes that DAC values from the sliders have already been pased to stageDACvalues

    //counts from the sliders don't reach the full 12-bit; more like 4038

    // do the first voltage conversion
    int i=0;

    if(stageActiveAny[i]){    // only "active" stages produce a voltage
        stageVoltages[i] = VoltageMultiplier*stageDACvalues[i]*stageDACvalues[8];
    }else{
        stageVoltages[i] = 0;
        }
    //stageVoltagesCascaded[i] = stageVoltages[i];


    //voltage conversion for the other stages
    for(i=1; i<8; i++){
        if(stageActiveAny[i]){
            stageVoltages[i] = VoltageMultiplier*stageDACvalues[i]*stageDACvalues[8];
        }else{
            stageVoltages[i] = 0;
        }        
        
        // cascade voltage from the previous stage if the output jack isn't plugged
        //if(OutputJackPlugged[i-1]){
        //    stageVoltagesCascaded[i] = stageVoltages[i];
        //}else{
        //    stageVoltagesCascaded[i] = stageVoltages[i] + stageVoltagesCascaded[i-1];
        //}
    }


    // quantize
    quantizeVoltages();
    CascadeVoltages();

}

void stageManager::SliderToStageVoltages(){
    // this is going to convert the ADC values from the voltage sliders into actual voltages
    // incorporates the scaling due to the "scale" V slider
    // also incorporates knowledge of whether the stages are active or not 

    // this assumes that DAC values from the sliders have already been pased to stageDACvalues
    
    //first: work out which stages are active
    for(int i=0; i<8; i++){
        if(stageActiveA[i] || stageActiveB[i] || stageActiveC[i]){
            stageActiveAny[i] = true;
        }else{
            stageActiveAny[i] = false;
        }
    }
    
    //for all active stages, set voltages according to the sliders
    for(int i=0; i<8; i++){
        if(stageActiveAny[i]){
            stageVoltages[i] = VoltageMultiplier*stageDACvalues[i]*stageDACvalues[8];
        }else{
            stageVoltages[i] = 0;
        }  
    }
}

void stageManager::UpdateQuantization(bool quantA[12], bool quantB[12], bool quantC[12]){
    //reads in quantization settings from an external source
    for(int i=0; i<12; i++){
        quantizationA[i]=quantA[i];
        quantizationB[i]=quantB[i];
        quantizationC[i]=quantC[i];
    }
}

void stageManager::SetActiveStages(bool stagesA[8], bool stagesB[8], bool stagesC[8]){
    for(int i=0;i<8;i++){
        stageActiveA[i] = stagesA[i];
        stageActiveB[i] = stagesB[i];
        stageActiveC[i] = stagesC[i];

        if(stagesA[i] || stagesB[i] || stagesC[i]){
            stageActiveAny[i] = true;
        }else{
            stageActiveAny[i] = false;
        }
    }
}

void stageManager::quantizeVoltages(){
    //for each stage
    for(int i=0; i<8; i++){
    bool quantizationTemp[12] = {false,false,false,false,false,false,false,false,false,false,false,false};
    //quantizationTemp[12] will keep track of which notes are "on" and which are "off"
    //if there are multiple active channels and some are quantized and others are not, then "unquantized" should win and we don't quantize anything


        // if neither channels A B or C are active on this stage then we dont need to do anything 
        if( !stageActiveA[i] && !stageActiveB[i] && !stageActiveC[i]){
            continue; // skip to the next stage
        }

        // for each channel active in this stage, look at the corresponding quantization settings
        // add them together 
        bool unquantizedStageMarkerTemp = false; 
        bool unquantizedStageMarkerAll = false; //flags whether we have an active channel on this stage with no active quantization
        
        if(stageActiveA[i]){
            unquantizedStageMarkerTemp = true;
            for(int j=0; j<12; j++){
                // copy A quantization values to quantizationTemp
                if(quantizationA[j]){
                    quantizationTemp[j] = true;
                    unquantizedStageMarkerTemp = false;
                }   
            }
            //if none of the note quantizations were active, then the stage has no quantization active
            if(unquantizedStageMarkerTemp){ 
                unquantizedStageMarkerAll = true; 
                break; 
            } 
        } else if (stageActiveB[i]){
            unquantizedStageMarkerTemp = true;
            for(int j=0; j<12; j++){
                // copy B quantization values to quantizationTemp
                if(quantizationB[j]){
                    quantizationTemp[j] = true;
                    unquantizedStageMarkerTemp = false;
                }   
            }
            //if none of the note quantizations were active, then the stage has no quantization active
            if(unquantizedStageMarkerTemp){ 
                unquantizedStageMarkerAll = true; 
                break; 
            }      
        } else if (stageActiveC[i]){
            unquantizedStageMarkerTemp = true;
            for(int j=0; j<12; j++){
                // copy C quantization values to quantizationTemp
                if(quantizationC[j]){
                    quantizationTemp[j] = true;
                    unquantizedStageMarkerTemp = false;
                }   
            }
            //if none of the note quantizations were active, then the stage has no quantization active
            if(unquantizedStageMarkerTemp){ 
                unquantizedStageMarkerAll = true; 
            }             
        }

        // if one of the active channels for this stage was unquantized, we don't need to do anything else with this stage
        if(unquantizedStageMarkerAll){
            continue;
        }

        // if we have reached this point, we need to quantize the current 
        // voltage value to the closest quantized value

        // first, find the quantized voltages either side of the unquantized value
        int octave = 0;
        int semitone = 0;
        int qvaluebelow = 0;
        int qvalueabove = 0;
        int tempqvalue = 0;
        for(int s=0; s<=semitoneRange; s++){ // cycle through the semitones
            semitone = s%12;
            if(quantizationTemp[semitone]){
                octave = (int)s/12;
                tempqvalue = octave*DACcountsPerVolt + quantizeVoltageValues[semitone];
                if(tempqvalue>stageVoltages[i]){
                    qvalueabove = tempqvalue;
                    break;
                }else{
                    qvaluebelow = tempqvalue;
                }
            }
        }

        if(qvalueabove == 0){
            //we never found a quantization point, within the range of the DAC, which was higher than the unquantized voltage
            //so we are forced to quantize to the value below
            stageVoltages[i]=qvaluebelow;
        }else if( (stageVoltages[i]-qvaluebelow) <= (qvalueabove - stageVoltages[i]) ){
            //we are closer to the lower quantization value
            stageVoltages[i] = qvaluebelow;            
        }else{
            //we are closer to the higher quantization value
            stageVoltages[i] = qvalueabove;
        }
 
    }
}

void stageManager::CascadeVoltages(){
    //calculates cascaded summing of output voltages
    int i=0;
    stageVoltagesCascaded[i] = stageVoltages[i];
    for(i=1; i<8; i++){
        // cascade voltage from the previous stage if the output jack isn't plugged
        if(OutputJackPlugged[i-1]){
            stageVoltagesCascaded[i] = stageVoltages[i];
        }else{
            stageVoltagesCascaded[i] = stageVoltages[i] + stageVoltagesCascaded[i-1];
        }
    }
}


void stageManager::PrintVoltageOutputs(){
    Serial.print("voltage outputs: ");
    for(int i=0; i<8; i++){
        Serial.print(stageVoltagesCascaded[i]);
        Serial.print(" ");
    }
    Serial.println();
}

void stageManager::WriteStageVoltagesToDACs(AnalogOutManager AO){
    // V outs:
    // 1 = DAC A - D
    // 2 = DAC A - C
    // 3 = DAC A - B
    // 4 = DAC A - A
    // 5 = DAC B - D
    // 6 = DAC B - C
    // 7 = DAC B - B
    // 8 = DAC B - A

    // correct any over-voltage readings
    for(int i=0; i<8; i++){
        stageVoltagesCascaded[i] = min(stageVoltagesCascaded[i], maxDACvoltage);
    }

    AO.FastWrite(AO.DACaddrA, stageVoltagesCascaded[3], stageVoltagesCascaded[2], stageVoltagesCascaded[1], stageVoltagesCascaded[0]);
    AO.FastWrite(AO.DACaddrB, stageVoltagesCascaded[7], stageVoltagesCascaded[6], stageVoltagesCascaded[5], stageVoltagesCascaded[4]);
}