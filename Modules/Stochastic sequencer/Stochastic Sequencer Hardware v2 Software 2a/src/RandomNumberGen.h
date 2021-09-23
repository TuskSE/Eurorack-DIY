#ifndef RandomNumberGen_H_
#define RandomNumberGen_H_

class RandomNumberGenerator{
    private: 
    int lastRandomNumber;
    
    public:
    int maxRandomNumber = 1000; // nb, this is not safe to change. the 1000 scale is hardcoded into some mode manager stuff
    void initialize();
    int randomNumber();
};

#endif //RandomNumberGen_H_