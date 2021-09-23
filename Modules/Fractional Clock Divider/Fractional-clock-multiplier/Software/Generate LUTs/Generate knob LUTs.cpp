#include <iostream>
#include <fstream>
#include <string>
using namespace std;


int main(){
	
int MidPointsL[] = {26, 143, 377, 650, 911, 1177, 1468, 1790, 2118, 2438, 2731, 3006, 3283, 3560, 3846, 4037};
int MidPointsD[] = {25, 136, 362, 637, 917, 1205, 1507, 1819, 2142, 2471, 2775, 3056, 3333, 3610, 3850, 4002};
int TempCurrentMap;
int LUT_L[4096];
int LUT_D[4096];
int i;	
		
//populate lookup tables
TempCurrentMap = 0;
for(i=0; i<4096; i++){
  LUT_L[i] = 120 + (TempCurrentMap*241);
	if(i == MidPointsL[TempCurrentMap]){
	 TempCurrentMap++;
    }
 }
 
 TempCurrentMap = 0;
 for(i=0; i<4096; i++){
  LUT_D[i] = 120 + (TempCurrentMap*241);
	if(i == MidPointsD[TempCurrentMap]){
	 TempCurrentMap++;
    }
 }
	
//write to file
ofstream OutputFile("LUT.txt");
if (OutputFile.is_open()){
	OutputFile << "//Copy + paste this into Main.ino \n";
	
	OutputFile << "const int LUT_L[] = {";
	for(i=0; i<4095; i++){
		OutputFile << LUT_L[i];	
		OutputFile << ",";
	}   
	OutputFile << LUT_L[4095];
	OutputFile << "};\n\n\n";
	
	OutputFile << "const int LUT_D[] = {";
	for(i=0; i<4095; i++){
		OutputFile << LUT_D[i];	
		OutputFile << ",";
	}   
	OutputFile << LUT_L[4095];
	OutputFile << "};\n";	
	
	} else {
	cout << "Unable to open file";
	return 0;
}
	
}




