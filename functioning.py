import os
import sys

import PyQt5.QtQml
import PyQt5.QtCore
import PyQt5.QtWidgets
from functools import partial
import random

def interact():
    #defines user interactions 
    reset_button = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "resetButton")
    error_text = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "errorText")
    calculate_button = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "calculateButton")
    slider = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "slider")
    zipcode = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "zipcode")

    #reset all fields when reset button is pressed
    if reset_button.property("text") == "true":
        slider.setProperty("value", 0)
        zipcode.setProperty("text", "")
        error_text.setProperty("text", "")
        reset_button.setProperty("text", "Reset")

    #make sure zipcode field isn't empty, <= 5 numbers, and integers
    if calculate_button.property("text") == "true":
        error_message = ""
        inputZipcode = zipcode.property("text")
        if len(inputZipcode) == 0:
            error_message = "Error: Please input a valid zipcode"
        elif len(inputZipcode) > 5:
           error_message = "Error: Please input a valid zipcode"
        try:
            int(inputZipcode)
        except:
            error_message = "Error: Please input a valid zipcode"
        error_text.setProperty("text", error_message)
        calculate_button.setProperty("text", "Calculate")

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