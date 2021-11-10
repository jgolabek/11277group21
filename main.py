import sys
from PySide6.QtWidgets import QApplication
from PySide6.QtQuick import QQuickView
import PySide6.QtCharts

if __name__ == "__main__":
    app = QApplication()
    view = QQuickView()

    view.setSource("Screen.qml")
    view.show()
    sys.exit(app.exec())
