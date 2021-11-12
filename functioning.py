import os
import sys

import PyQt5.QtQml
import PyQt5.QtCore
import PyQt5.QtWidgets
from PyQt5.QtWidgets import QApplication, QWidget, QInputDialog, QLineEdit, QFileDialog
from functools import partial
import random
import json

def verify_zip(zipcode):
    error_message = ""
    if len(zipcode) == 0:
            error_message = "Error: Please input a valid zipcode"
    elif len(zipcode) > 5:
        error_message = "Error: Please input a valid zipcode"
    try:
        int(zipcode)
    except:
        error_message = "Error: Please input a valid zipcode"
    return error_message    
def file_save(zip, slider):
    name, _ = QFileDialog.getSaveFileName()
    file = open(name,'w')
    text = f'{{\"slider\": \"{slider}\", \"zipcode\": \"{zip}\"}}'
    file.write(text)
    file.close()

def file_load():
    name, _ = QFileDialog.getOpenFileName()
    with open(name) as f:
        data = json.load(f)
    return data

def interact():
    #defines user interactions 
    reset_button = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "resetButton")
    save_button = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "saveButton")
    error_text = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "errorText")
    calculate_button = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "calculateButton")
    slider = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "slider")
    zipcode = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "zipcode")
    load_button = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "loadButton")

    #reset all fields when reset button is pressed
    if reset_button.property("text") == "true":
        slider.setProperty("value", 0)
        zipcode.setProperty("text", "")
        error_text.setProperty("text", "")
        reset_button.setProperty("text", "Reset")

    #reset all fields when reset button is pressed
    if save_button.property("text") == "true":
        save_button.setProperty("text", "Save")
        file_save(zipcode.property("text"), slider.property("value"))
    
    if load_button.property("text") == "true":
        load_button.setProperty("text", "Load")
        data = file_load()
        slider.setProperty("value", data['slider'])
        zipcode.setProperty("text", int(data['zipcode']))
        calculate_button.setProperty("text", "true")
        


    #make sure zipcode field isn't empty, <= 5 numbers, and integers
    if calculate_button.property("text") == "true":
        error_text.setProperty("text", verify_zip(zipcode.property("text")))
        calculate_button.setProperty("text", "Calculate")
        #actually calculate stuff here

if __name__ == '__main__':
    os.environ['QT_QUICK_CONTROLS_STYLE'] = 'Default'
    app = PyQt5.QtWidgets.QApplication(sys.argv)
    engine = PyQt5.QtQml.QQmlApplicationEngine()


    engine.load('main.qml')
    if not engine.rootObjects():
        sys.exit(-1)

    #calls a timer that calls the interact function at the set interval
    timer = PyQt5.QtCore.QTimer(interval=5)
    timer.timeout.connect(partial(interact))
    timer.start()

    sys.exit(app.exec_())