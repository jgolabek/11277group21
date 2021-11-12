import os
import sys

import PyQt5.QtQml
import PyQt5.QtCore
import PyQt5.QtWidgets
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
    error_text = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "errorText")
    calculate_button = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "calculateButton")
    slider = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "slider")
    zipcode = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "zipcode")
    scores = engine.rootObjects()[0].findChild(PyQt5.QtQuick.QQuickItem, "scoreChart")

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
