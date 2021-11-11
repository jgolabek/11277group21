import os
import sys

import PyQt5.QtQml
import PyQt5.QtCore
import PyQt5.QtWidgets
from functools import partial
import random

def reset(reset_button):
    slider = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "slider")
    if reset_button.property("text") == "true":
        slider.setProperty("value", 0)
        reset_button.setProperty("text", "Reset")

if __name__ == '__main__':
    os.environ['QT_QUICK_CONTROLS_STYLE'] = 'Default'
    app = PyQt5.QtWidgets.QApplication(sys.argv)
    engine = PyQt5.QtQml.QQmlApplicationEngine()


    engine.load('main.qml')
    if not engine.rootObjects():
        sys.exit(-1)

    reset_button = engine.rootObjects()[0].findChild(PyQt5.QtCore.QObject, "resetButton")
    timer = PyQt5.QtCore.QTimer(interval=5)
    timer.timeout.connect(partial(reset, reset_button))
    timer.start()

    sys.exit(app.exec_())