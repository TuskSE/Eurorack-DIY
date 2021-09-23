#ifndef TrigOutManager_H_
#define TrigOutManager_H_

class TrigOutManager {
  unsigned long TrigLengthMicros, CurrentPulseEndtimeMicros; //Length of trigger pulse in microseconds
  const unsigned long GateModeTimeoutLengthMicros = 20000; //this is the time after initiation that a pulse can be killed by an external function.
  //^ this is neccessary because otherwise, in clock divider mode, through pulses and main pulses which ought to be exactly coincident are actually staggered a little, and if the through pulse comes slightly later - we don't want it to kill the main pulse in that case.
  bool OutputPulseOccuring; //if True, we are in the middle of outputting a pulse
  bool RolloverFlag; //if True, we are in the middle of a pulse which will straddle the point when micros() rolls over
  bool GateMode; //Currently unused

  public:
  TrigOutManager (int TrigLengthInMicroSeconds); //initializes trigger length. Currently this is hardwired into the function.
  void StartPulse();
  void EndPulse();
  bool ShouldWeBeOutputting();
};

#endif //TrigOutManager