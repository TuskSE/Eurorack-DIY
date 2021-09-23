#ifndef DigitalIO_H_
#define DigitalIO_H_

class DigiIOManager{
    private: 
    int Out_SERpin, Out_LATCHpin, Out_CLKpin, In_SERpin, In_LATCHpin, In_CLKpin;
    int SwitchDebounceCounter, DebounceThreshold;
    void OutBeginTransaction();
    char clocks, clocksOld, NormalizationProbes, NormalizationProbesOld, Sw1States, Sw2States, temp, Sw1StatesOld, Sw2StatesOld, OutputInstructions;
    
    // these two rows note the current and previous switch states
    bool ClockInAll, ClockInA, ClockInB, ClockInC, ResetInAll, ResetInA, ResetInB, ResetInC;
    bool ClockInAll_old, ClockInA_old, ClockInB_old, ClockInC_old, ResetInAll_old, ResetInA_old, ResetInB_old, ResetInC_old;

    void DigitalOutput(char Data); //Data is in the binary form Bxxxxxxxx


    public:
    // the clock bools here are true if there has been an 0 -> 1 transition, otherwise false
    bool ClockInA_new, ClockInB_new, ClockInC_new, ResetInA_new, ResetInB_new, ResetInC_new;
    void SetupDout(int SERpin, int LATCHpin, int CLKpin);
    void SetupDin(int SERpin, int LATCHpin, int CLKpin);
    void ReadClocks();
    void ReadAllDigitalIn();
    char ReportSwStates1(); 
    char ReportSwStates2();
    char ReportNormProbes();
    bool SwitchStateChanged();
    bool TrigInStateChanged();
    bool NormalizationStateChanged();
    void UpdateTriggerOutputs(bool ResetA, bool ResetB, bool ResetC, bool TriggerA, bool TriggerB, bool TriggerC);
    
    //for testing:
    void TestNormProbeReads();
    void TestTrigInReads();
    void TestTrigOut(int index);
    void TestSwReads();
    void TestDigitalOut(); 
    void PrintBuffers();
    void PrintTriggerInBools();
};



#endif // DigitalIO_H_