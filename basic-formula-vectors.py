### This is a very very preliminary script for our
### environmental impact outputs. It converts a kWh consumption
### input to environmental outputs.

import sys
import numpy as np

kWh_consumption = float(sys.argv[1])

# FIXME Would it be better to store coefficients linearly in a matrix? Save for later...
energy_sources = ['Gasoline','Solar','Nuclear','Coal','Hydroelectric','Wind','Natural Gas']
#env_impacts = ['CO2 Emissions']
#conversion_matrix =

## Conversion Coefficients
# kWh -> specified unit
toUnit = [.0299, 1, 1, 1.13, 1, 1, 7.43]

# unit -> CO2
toCO2 = [8.5, .045, .012, .914, .024, .011, .05503]

# kWh -> dollars
toBill = .1127

## Env Impact Determination (just CO2 for now)
powerBill = kWh_consumption * toBill
CO2_env_array = [1] * 7
for i in range(len(CO2_env_array)):
    CO2_env_array[i] = kWh_consumption * toUnit[i] * toCO2[i]

## Display results
print("Average Power Bill (FL): $" + str(round(powerBill, 2)))
print("############# CO2 Emissions (in kg) by Energy Source #############")
for ind in range(len(CO2_env_array)):
    print(energy_sources[ind] + ": " + str(round(CO2_env_array[ind],3)) + " kg")
