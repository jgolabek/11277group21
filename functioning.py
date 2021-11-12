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
    try:
        name, _ = QFileDialog.getSaveFileName()
        file = open(name,'w')
        text = f'{{\"slider\": \"{slider}\", \"zipcode\": \"{zip}\"}}'
        file.write(text)
        file.close()
        return 1
    except:
            return 0

def display_dialog(dialog):
    if dialog.property("visible") == False:
        dialog.setProperty("visible", "true")
    else:
        dialog.setProperty("visible", "false")


def file_load():
    try:
        name, _ = QFileDialog.getOpenFileName()
        with open(name) as f:
            data = json.load(f)
        return data
    except:
        return
import PyQt5.QtChart
import PyQt5.QtQuick
from functools import partial
import random
import importlib
convs = importlib.import_module("basic-formula-func")

#This class provides bridge functions - mainly the signals/slots sending data between Python and QML
class Bridge(PyQt5.QtCore.QObject):
    #Stored kWh value
    _kWh = 0
    _zip = 0
    updateScore = PyQt5.QtCore.pyqtSignal(int, arguments="scores")

    @PyQt5.QtCore.pyqtSlot(result=list)
    def getScores(self):
        return convs.kWhtoScore(self._kWh)

def interact():
    #defines user interactions
    reset_button = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "resetButton")
    save_button = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "saveButton")
    error_text = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "errorText")
    calculate_button = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "calculateButton")
    slider = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "slider")
    zipcode = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "zipcode")
    load_button = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "loadButton")
    scores = engine.rootObjects()[0].findChild(PyQt5.QtQuick.QQuickItem, "scoreChart")
    team_button = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "teamButton")
    team_dialog = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "teamDialog")
    about_calcugator_button = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "aboutCalcugatorButton")
    about_calcugator_dialog = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "aboutCalcugatorDialog")

    #reset all fields when reset button is pressed
    if reset_button.property("text") == "true":
        slider.setProperty("value", 0)
        zipcode.setProperty("text", "")
        error_text.setProperty("text", "")
        reset_button.setProperty("text", "Reset")
        
    #reset all fields when reset button is pressed
    if save_button.property("text") == "true":
        save_button.setProperty("text", "Save")
        error_message = verify_zip(zipcode.property("text"))
        if error_message == "":
            file_save(zipcode.property("text"), slider.property("value"))
        error_text.setProperty("text", error_message)
    
    if load_button.property("text") == "true":
        load_button.setProperty("text", "Load")
        data = file_load()
        try:
            slider.setProperty("value", data['slider'])
            zipcode.setProperty("text", int(data['zipcode']))
        except:
            print()
        calculate_button.setProperty("text", "true")
        

    if team_button.property("text") == "true":
        about_calcugator_dialog.setProperty("visible", "false")
        display_dialog(team_dialog)
        team_button.setProperty("text", "Team")
    
    if about_calcugator_button.property("text") == "true":
        team_dialog.setProperty("visible", "false")
        display_dialog(about_calcugator_dialog)
        about_calcugator_button.setProperty("text", "About CalcuGator")

    #make sure zipcode field isn't empty, <= 5 numbers, and integers
    if calculate_button.property("text") == "true":
        error_text.setProperty("text", verify_zip(zipcode.property("text")))
        if verify_zip(zipcode.property("text")) == "":
        #actually calculate stuff here
            print()

        calculate_button.setProperty("text", "Calculate")

        #Update the KwH value and emit signals to update graphs
        bridge._kWh = round(slider.property("value"))
        bridge.updateScore.emit(12)
        #TODO: add signals for other graphs, add zip code values, add dropdown options
        #For every graph, a Connections "object" must be created to react to this signals
        #and call the corresponding slot to update the chart data

if __name__ == '__main__':
    os.environ['QT_QUICK_CONTROLS_STYLE'] = 'Default'
    app = PyQt5.QtWidgets.QApplication(sys.argv)
    engine = PyQt5.QtQml.QQmlApplicationEngine()
    bridge = Bridge()

    engine.load('main.qml')
    context = engine.rootContext()
    context.setContextProperty("bridge", bridge)

    if not engine.rootObjects():
        sys.exit(-1)

    #calls a timer that calls the interact function at the set interval
    timer = PyQt5.QtCore.QTimer(interval=5)
    timer.timeout.connect(partial(interact))
    timer.start()

    sys.exit(app.exec_())
