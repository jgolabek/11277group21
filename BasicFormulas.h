//Conversion of basic-formula-py to C++
//Returns float pointers to arrays of size 7 at each functions
//kWhtoBill returns a float directly

#ifndef TESTFRAMEPROJ_BASICFORMULAS_H
#define TESTFRAMEPROJ_BASICFORMULAS_H

#include <iostream>

class BasicFormulas{
private:
    std::string energy_sources[7] = {"Gasoline", "Solar", "Nuclear", "Coal", "Hydroelectric", "Wind", "Natural Gas"};
    float toUnit[7] = {.0299, 1, 1, 1.13, 1, 1, 7.43};
    float toCO2[7] = {8.5, .045, .012, .914, .024, .011, .05503};
    float toWater[7] = {.0372, .650, .400, .887, .449, .005, .300};
    float toSO2[7] = {.005079, 0, 0, .006077, 0, 0, .000003175};
    float toAcres[7] = {.016, .035, .002, .0224, .00000667, .15, .036};
    float toBill = .1127;

public:
    float kWhtoBill(float kWh_consumption);
    float* kWhtoCO2(float kWh_consumption);
    float* kWhtoWater(float kWh_consumption);
    float* kWhtoSO2(float kWh_consumption);
    float* kWhtoAcres(float kWh_consumption);
    float* kWhtoScore(float kWh_consumption);
};

#endif //TESTFRAMEPROJ_BASICFORMULAS_H
