import QtQuick 2.15
import QtQuick.Controls 2.15
import calcugatorv2 1.0
import QtCharts 2.3

Rectangle {
    width: Constants.width
    height: Constants.height
    color: "#b9f9e1"

    Text {
        id: calcugator
        width: 369
        height: 90
        text: qsTr("CalcuGator")
        font.pointSize: 49
        anchors.verticalCenterOffset: -262
        anchors.horizontalCenterOffset: -425
        anchors.centerIn: parent
        font.family: Constants.font.family
    }

    ChartView {
        id: bar
        x: 376
        y: 34
        width: 889
        height: 335
        layer.samples: 2
        z: 0
        BarSeries {
            name: "BarSeries"
            BarSet {
                values: [slider.value.toFixed(), slider.value.toFixed()*0.5, slider.value.toFixed()*0.75]
                label: "Set1"
            }

            BarSet {
                values: [slider.value.toFixed()*0.3, slider.value.toFixed()*0.44, slider.value.toFixed()*0.32]
                label: "Set2"
            }

            BarSet {
                values: [slider.value.toFixed()*0.28, slider.value.toFixed()*0.3, slider.value.toFixed()*0.1]
                label: "Set3"
            }
        }
    }

    ChartView {
        id: hBar
        x: 376
        y: 437
        width: 300
        height: 242
        HorizontalBarSeries {
            name: "HorizontalBarSeries"
            BarSet {
                values: [2, 2, 3]
                label: "Set1"
            }

            BarSet {
                values: [5, 1, 2]
                label: "Set2"
            }

            BarSet {
                values: [3, 5, 8]
                label: "Set3"
            }
        }
    }

    ChartView {
        id: hBar1
        x: 671
        y: 437
        width: 300
        height: 242
        HorizontalBarSeries {
            name: "HorizontalBarSeries"
            BarSet {
                values: [2, 2, 3]
                label: "Set1"
            }

            BarSet {
                values: [5, 1, 2]
                label: "Set2"
            }

            BarSet {
                values: [3, 5, 8]
                label: "Set3"
            }
        }
    }

    ChartView {
        id: hBar2
        x: 965
        y: 437
        width: 300
        height: 242
        HorizontalBarSeries {
            name: "HorizontalBarSeries"
            BarSet {
                values: [2, 2, 3]
                label: "Set1"
            }

            BarSet {
                values: [5, 1, 2]
                label: "Set2"
            }

            BarSet {
                values: [3, 5, 8]
                label: "Set3"
            }
        }
    }

    Slider {
        id: slider
        x: 39
        y: 232
        width: 303
        height: 22
        stepSize: 0.1
        value: 0.5

        Connections {
            target: slider
            onClicked: console.log("clicked")
        }
        to: 3
        from: none.none
    }

    TextInput {
        id: textInput
        x: 47
        y: 173
        width: 295
        height: 62
        text: qsTr("Enter Power Usage")
        font.pixelSize: 30
    }

    Rectangle {
        id: rectangle1
        x: 39
        y: 409
        width: 303
        height: 64
        color: "#f9d185"
    }

    Rectangle {
        id: rectangle
        x: 39
        y: 331
        width: 303
        height: 64
        color: "#f9d185"

        Text {
            id: text2
            x: 109
            y: 88
            width: 85
            text: qsTr("Team")
            font.pixelSize: 35
        }

        Text {
            id: text1
            x: 17
            y: 11
            text: qsTr("About CalcuGator")
            font.pixelSize: 35
        }

    }

    ComboBox {
        id: comboBox
        x: 386
        y: 386
        width: 225
        height: 45
        wheelEnabled: false
        focusPolicy: Qt.WheelFocus
        font.pointSize: 20
        displayText: "Nuclear"
    }

    ComboBox {
        id: comboBox1
        x: 683
        y: 386
        width: 225
        height: 45
        font.pointSize: 20
        displayText: "Wind"
    }

    ComboBox {
        id: comboBox2
        x: 976
        y: 386
        width: 225
        height: 45
        font.pointSize: 20
        displayText: "Solar"
        currentIndex: 1
    }

    Text {
        id: text3
        x: 47
        y: 268
        width: 140
        height: 57
        text: slider.value.toFixed()
        font.pixelSize: 20
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
