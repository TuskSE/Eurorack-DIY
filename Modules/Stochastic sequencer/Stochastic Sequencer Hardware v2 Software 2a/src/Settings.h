//This is my library of defined colors

//I want to represent colors fundamentally on a 0-255 integer scale, eg int red[3]    = { 0, 255, 0 };
//Whenever we need to e.g. overlay colors by adding them together, we will use this scale

// These are the colours assigned to the 3 channels
unsigned int Clr_ChA[3]    = { 255, 0,  0 };
unsigned int Clr_ChB[3]  = { 0, 255, 0 };
unsigned int Clr_ChC[3]   = { 0, 0, 255 };

unsigned int Clr_black[3]  = { 0, 0, 0 };
unsigned int Clr_white[3]  = { 255, 255, 255 };
unsigned int Clr_red[3]    = { 255, 0,  0 };
unsigned int Clr_green[3]  = { 0, 255, 0 };
unsigned int Clr_blue[3]   = { 0, 0, 255 };



//other constants
int MasterBrightness = 20;  //The overall brightness by which everything else is to be scaled. Scale of 0 - 100.
int MaxBrightness  = 150; //Sets a ceiling on maximum allowed LED brightness. Scale from 0-255
const bool LEDstartupSequence = true;
const int TriggerLengthInMicroseconds = 1500; 