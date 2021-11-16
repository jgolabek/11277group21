### This is a very very preliminary script for our
### environmental impact outputs. It converts a kWh consumption
### input to environmental outputs.

import sys
import numpy as np

## Conversion Coefficients
# Order of energy sources
energy_sources = ['Gasoline','Solar','Nuclear','Coal','Hydroelectric','Wind','Natural Gas']

# kWh -> specified unit
toUnit = [.0299, 1, 1, 1.13, 1, 1, 7.43]

# unit -> kg. CO2
toCO2 = [8.5, .045, .012, .914, .024, .011, .05503]

# kWh -> gal. water
toWater = [.0372, .650, .400, .887, .449, .005, .300]

# kWh -> kg. SO2
toSO2 = [.005079, 0, 0, .006077, 0, 0, .000003175]

# kWh -> acres needed
toAcres = [.016, .035, .002, .0224, .00000667, .15, .036]

# kWh -> dollars
toBill = .1127

def kWhtoBill(kWh_consumption):
    return toBill * kWh_consumption

def kWhtoCO2(kWh_consumption):
    CO2_env_array = [1] * 7
    for i in range(len(CO2_env_array)):
        CO2_env_array[i] = kWh_consumption * toUnit[i] * toCO2[i]

    return CO2_env_array

def kWhtoWater(kWh_consumption):
    Wat_env_array = [1] * 7
    for i in range(len(Wat_env_array)):
        Wat_env_array[i] = kWh_consumption * toWater[i]

    return Wat_env_array

def kWhtoSO2(kWh_consumption):
    SO2_env_array = [1] * 7
    for i in range(len(SO2_env_array)):
        SO2_env_array[i] = kWh_consumption * toSO2[i]

    return SO2_env_array

def kWhtoAcres(kWh_consumption):
    Acre_env_array = [1] * 7
    for i in range(len(Acre_env_array)):
        Acre_env_array[i] = kWh_consumption * toAcres[i]

    return Acre_env_array

def kWhtoScore(kWh_consumption):
    CO2 = kWhtoCO2(kWh_consumption)
    Wat = kWhtoWater(kWh_consumption)
    SO2 = kWhtoSO2(kWh_consumption)
    Acre = kWhtoAcres(kWh_consumption)

    Avg_env_array = [1] * 7
    for i in range(len(Avg_env_array)):
        Avg_env_array[i] = (CO2[i] + Wat[i] + SO2[i] + Acre[i]) / 4

    return Avg_env_array
