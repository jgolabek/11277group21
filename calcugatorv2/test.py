import sys
from pathlib import Path

from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from PySide6.QtQuickControls2 import QQuickStyle

import style_rc

# To be used on the @QmlElement decorator
# (QML_IMPORT_MINOR_VERSION is optional)
QML_IMPORT_NAME = "io.qt.textproperties"
QML_IMPORT_MAJOR_VERSION = 1


@QmlElement
class Calcugator(QObject):

    @Slot(str, result=int)
    def getEnergy(self, s):
        if s.lower() == "red":
            return "#ef9a9a"
        elif s.lower() == "green":
            return "#a5d6a7"
        elif s.lower() == "blue":
            return "#90caf9"
        else:
            return "white"

 if __name__ == '__main__':
     app = QGuiApplication(sys.argv)
     QQuickStyle.setStyle("Material")
     engine = QQmlApplicationEngine()
 
     # Get the path of the current directory, and then add the name
     # of the QML file, to load it.
     qml_file = Path(__file__).parent / 'version1.ui.qml'
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)