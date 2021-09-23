
class Clock {
  int counts;
  unsigned long int 
  
  public:
  void SetClock (int);
  void ResetClock ();
  void IncrementClock () {counts = counts + 1;};
  int ReportCounts () {return counts;}
};

void Clock::IncrementClock(){
  count = count + 1;
  
}

void Clock::SetClock(int x){
  counts = x;
}
void Clock::ResetClock(){
  counts = 0;
}

Clock MainClock;

void setup() {
  // put your setup code here, to run once:

MainClock.SetClock(5);
MainClock.ResetClock();

}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.begin(9600);


  delay (1000);
  MainClock.IncrementClock();
  Serial.println(MainClock.ReportCounts());
}
