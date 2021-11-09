//
// Created by Windows 10 on 11/8/2021.
//

#include "BasicFormulas.h"

float BasicFormulas::kWhtoBill(float kWh_consumption){
    return toBill * kWh_consumption;
}

float* BasicFormulas::kWhtoCO2(float kWh_consumption){
    float *CO2_env_array = new float[7];
    for(int i = 0; i < 7; ++i){
        CO2_env_array[i] = kWh_consumption * toUnit[i] * toCO2[i];
    }

    return CO2_env_array;
}

float* BasicFormulas::kWhtoWater(float kWh_consumption){
    float *Wat_env_array = new float[7];
    for(int i = 0; i < 7; ++i){
        Wat_env_array[i] = kWh_consumption * toWater[i];
    }

    return Wat_env_array;
}

float* BasicFormulas::kWhtoSO2(float kWh_consumption){
    float *SO2_env_array = new float[7];
    for(int i = 0; i < 7; ++i){
        SO2_env_array[i] = kWh_consumption * toSO2[i];
    }

    return SO2_env_array;
}

float* BasicFormulas::kWhtoAcres(float kWh_consumption){
    float *Acre_env_array = new float[7];
    for(int i = 0; i < 7; ++i){
        Acre_env_array[i] = kWh_consumption * toAcres[i];
    }

    return Acre_env_array;
}

float* BasicFormulas::kWhtoScore(float kWh_consumption){
    float *CO2 = kWhtoCO2(kWh_consumption);
    float *Wat = kWhtoWater(kWh_consumption);
    float *SO2 = kWhtoSO2(kWh_consumption);
    float *Acre = kWhtoAcres(kWh_consumption);
    float *Avg_env_array = new float[7];

    for(int i = 0; i < 7; ++i){
        Avg_env_array[i] = (CO2[i] + Wat[i] + SO2[i] + Acre[i]) / 4;
    }

    return Avg_env_array;
}
