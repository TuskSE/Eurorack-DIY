#include "RandomNumberGen.h"
#include "Arduino.h"

void RandomNumberGenerator::initialize(){
    srand(micros());
}

int RandomNumberGenerator::randomNumber(){
    lastRandomNumber =rand() % maxRandomNumber;
    return lastRandomNumber;
}