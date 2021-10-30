# This script contains functions to determine the average
# monthly power bill per state. The user may provide a
# zipcode as an input, which is used to address a json-map
# to obtain the $/kWh rate. A kWh input will be multiplied
# by this conversion rate to obtain monthly cost.

import sys
from types import ModuleType
import numpy as np
import json

state_data_json = "2020-State-Data.json"

def ZiptoState(zipcode):
    state = ''

    # The below logic sourced from https://stackoverflow.com/questions/28821804/how-can-i-quickly-determine-the-state-for-a-given-zipcode
    if (zipcode >= 35000 and zipcode <= 36999):
        state = 'Alabama'
    elif (zipcode >= 99500 and zipcode <= 99999):
        state = 'Alaska'
    elif (zipcode >= 85000 and zipcode <= 86999):
        state = 'Arizona'
    elif (zipcode >= 71600 and zipcode <= 72999):
        state = 'Arkansas'
    elif (zipcode >= 90000 and zipcode <= 96699):
        state = 'California'
    elif (zipcode >= 80000 and zipcode <= 81999):
        state = 'Colorado'
    elif ((zipcode >= 6000 and zipcode <= 6389) or (zipcode >= 6391 and zipcode <= 6999)):
        state = 'Connecticut'
    elif (zipcode >= 19700 and zipcode <= 19999):
        state = 'Delaware'
    elif (zipcode >= 32000 and zipcode <= 34999):
        state = 'Florida'
    elif ((zipcode >= 30000 and zipcode <= 31999) or (zipcode >= 39800 and zipcode <= 39999)):
        state = 'Georgia'
    elif (zipcode >= 96700 and zipcode <= 96999):
        state = 'Hawaii'
    elif (zipcode >= 83200 and zipcode <= 83999):
        state = 'Idaho'
    elif (zipcode >= 60000 and zipcode <= 62999):
        state = 'Illinois'
    elif (zipcode >= 46000 and zipcode <= 47999):
        state = 'Indiana'
    elif (zipcode >= 50000 and zipcode <= 52999):
        state = 'Iowa'
    elif (zipcode >= 66000 and zipcode <= 67999):
        state = 'Kansas'
    elif (zipcode >= 40000 and zipcode <= 42999):
        state = 'Kentucky'
    elif (zipcode >= 70000 and zipcode <= 71599):
        state = 'Louisiana'
    elif (zipcode >= 3900 and zipcode <= 4999):
        state = 'Maine'
    elif (zipcode >= 20600 and zipcode <= 21999):
        state = 'Maryland'
    elif ((zipcode >= 1000 and zipcode <= 2799) or (zipcode == 5501) or (zipcode == 5544 )):
        state = 'Massachusetts'
    elif (zipcode >= 48000 and zipcode <= 49999):
        state = 'Michigan'
    elif (zipcode >= 55000 and zipcode <= 56899):
        state = 'Minnesota'
    elif (zipcode >= 38600 and zipcode <= 39999):
        state = 'Mississippi'
    elif (zipcode >= 63000 and zipcode <= 65999):
        state = 'Missouri'
    elif (zipcode >= 59000 and zipcode <= 59999):
        state = 'Montana'
    elif (zipcode >= 27000 and zipcode <= 28999):
        state = 'North Carolina'
    elif (zipcode >= 58000 and zipcode <= 58999):
        state = 'North Dakota'
    elif (zipcode >= 68000 and zipcode <= 69999):
        state = 'Nebraska'
    elif (zipcode >= 88900 and zipcode <= 89999):
        state = 'Nevada'
    elif (zipcode >= 3000 and zipcode <= 3899):
        state = 'New Hampshire'
    elif (zipcode >= 7000 and zipcode <= 8999):
        state = 'New Jersey'
    elif (zipcode >= 87000 and zipcode <= 88499):
        state = 'New Mexico'
    elif ((zipcode >= 10000 and zipcode <= 14999) or (zipcode == 6390) or (zipcode == 501) or (zipcode == 544)):
        state = 'New York'
    elif (zipcode >= 43000 and zipcode <= 45999):
        state = 'Ohio'
    elif ((zipcode >= 73000 and zipcode <= 73199) or (zipcode >= 73400 and zipcode <= 74999)):
        state = 'Oklahoma'
    elif (zipcode >= 97000 and zipcode <= 97999):
        state = 'Oregon'
    elif (zipcode >= 15000 and zipcode <= 19699):
        state = 'Pennsylvania'
    elif (zipcode >= 2800 and zipcode <= 2999):
        state = 'Rhode Island'
    elif (zipcode >= 29000 and zipcode <= 29999):
        state = 'South Carolina'
    elif (zipcode >= 57000 and zipcode <= 57999):
        state = 'South Dakota'
    elif (zipcode >= 37000 and zipcode <= 38599):
        state = 'Tennessee'
    elif ((zipcode >= 75000 and zipcode <= 79999) or (zipcode >= 73301 and zipcode <= 73399) or  (zipcode >= 88500 and zipcode <= 88599)):
        state = 'Texas'
    elif (zipcode >= 84000 and zipcode <= 84999):
        state = 'Utah'
    elif (zipcode >= 5000 and zipcode <= 5999):
        state = 'Vermont'
    elif ((zipcode >= 20100 and zipcode <= 20199) or (zipcode >= 22000 and zipcode <= 24699) or (zipcode == 20598)):
        state = 'Virginia'
    elif ((zipcode >= 20000 and zipcode <= 20099) or (zipcode >= 20200 and zipcode <= 20599) or (zipcode >= 56900 and zipcode <= 56999)):
        state = 'Disctrict of Columbia'
    elif (zipcode >= 98000 and zipcode <= 99499):
        state = 'Washington'
    elif (zipcode >= 24700 and zipcode <= 26999):
        state = 'West Virginia'
    elif (zipcode >= 53000 and zipcode <= 54999):
        state = 'Wisconsin'
    elif (zipcode >= 82000 and zipcode <= 83199):
        state = 'Wyoming'
    else:
        raise KeyError

    return state

def GetMonthlyBill(zipcode, kWh):
    state = ZiptoState(zipcode)

    with open(state_data_json) as f:
        state_data = json.load(f)

    avg_consumption = state_data[state]["avg_consumption"]
    costRate = state_data[state]["avg_price"]

    # try:
    #     avg_consumption = state_data[state]["avg_consumption"]
    #     costRate = state_data[state]["avg_price"]
    # except KeyError:
    #     print("Invalid zipcode!")
    #     return 0,0

    monthly_cost = kWh * costRate / 100
    state_avg_cost = avg_consumption * costRate / 100

    return monthly_cost, state_avg_cost

# #FIXME This is a test, remove before pushing
# monthly_cost, avg_monthly_cost = GetMonthlyBill(int(sys.argv[1]), float(sys.argv[2]))
# print(monthly_cost)
# print(avg_monthly_cost)
