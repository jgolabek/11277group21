### This is a very very preliminary script for our
### environmental impact outputs. It converts a kWh consumption
### input to environmental outputs.

import sys
import numpy as np

kWh_consumption = float(sys.argv[1])

# FIXME Would it be better to store coefficients linearly in a matrix? Save for later...
energy_sources = ['Gasoline','Solar','Nuclear','Coal','Natural Gas'] # TODO add hydro and wind
#env_impacts = ['CO2 Emissions']
#conversion_matrix = 

## Conversion Coefficients
# Gasoline
gas_gallons_per_kWh = 33.41
CO2_per_gas_gallons = 8.5
# Solar
CO2_per_solar_kWh = .045
# Nuclear
CO2_per_nuclear_kWh = .012
# Coal
coal_lb_per_kWh = 1.13
CO2_per_coal_lb = .914
# Hydro
# Wind
# Natural Gas
ng_cfeet_per_kWh = 7.43
CO2_per_ng_cfeet = .05503

## Env Impact Determination (just CO2 for now)
# Gasoline
gas_CO2 = kWh_consumption * gas_gallons_per_kWh * CO2_per_gas_gallons
# Solar
solar_CO2 = kWh_consumption * CO2_per_solar_kWh
# Nuclear
nuclear_CO2 = kWh_consumption * CO2_per_nuclear_kWh
# Coal
coal_CO2 = kWh_consumption * coal_lb_per_kWh * CO2_per_coal_lb
# Hydro
# Wind
# Natural Gas
ng_CO2 = kWh_consumption * ng_cfeet_per_kWh * CO2_per_ng_cfeet

## Save and display results
CO2_env_array = [gas_CO2,solar_CO2,nuclear_CO2,coal_CO2,ng_CO2]
print("############# CO2 Emissions (in kg) by Energy Source #############")
for ind in range(len(CO2_env_array)):
    print(energy_sources[ind] + ": " + str(round(CO2_env_array[ind],3)) + " kg")