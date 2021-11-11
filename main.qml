import QtQuick 2.11
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtCharts 2.3


ApplicationWindow {    
    visible: true
    width: 1920
    height: 1080
    color: "#b9f9e1"
    Text {
        x:1
        y:1
        id: calcugator
        width: 369
        height: 90
        text: qsTr("CalcuGator")
        font.pointSize: 49
        anchors.verticalCenterOffset: -262
        anchors.horizontalCenterOffset: -425
        anchors.centerIn: parent
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
            axisX: BarCategoryAxis { categories: ["Gasoline", "Solar", "Nuclear", "Coal", "Hydro", "Wind", "Natural Gas" ] }
            BarSet {
                values: [0.145675*slider.value.toFixed(), slider.value.toFixed()*0.3475,
                    slider.value.toFixed()*0.206, 0.95991*slider.value.toFixed(), slider.value.toFixed()*0.2365,
                slider.value.toFixed()*0.008, slider.value.toFixed()*0.35443645]
                label: "Environmental Impact Score"
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
            axisY: BarCategoryAxis { categories: ["CO2", "H20" ] }
            BarSet {
                values: [0.012*slider.value.toFixed(), 0.4*slider.value.toFixed()]
                label: "Environmental Impacts"
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
            axisY: BarCategoryAxis { categories: ["CO2", "H20" ] }
            BarSet {
                values: [0.011*slider.value.toFixed(), 0.005*slider.value.toFixed()]
                label: "Environmental Impacts"
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
            axisY: BarCategoryAxis { categories: ["CO2", "H20" ] }
            name: "HorizontalBarSeries"
            BarSet {
                values: [0.045*slider.value.toFixed(), 0.65*slider.value.toFixed()]
                label: "Environmental Impacts"
            }
        }
    }

    Slider {
        id: slider
        x: 39
        y: 232
        width: 303
        height: 22
        stepSize: 0.02
        value: 0.5
        objectName: "slider"
        Connections {
            target: slider
            onMoved: console.log("clicked")
        }
        to: 5
        from: 0
    }

    Text {
        id: textInput
        x: 45
        y: 175
        width: 295
        height: 62
        text: qsTr("Enter Power Usage ")
        font.pixelSize: 25
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

        Button {
            objectName: "resetButton"
           id: reset
            x: 0
            y: 155
            width: 303
            height: 64
            text: "Reset"
            font.pixelSize: 35
            onClicked: reset.text = "true"
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
        x: 99
        y: 268
        width: 33
        height: 57
        text: slider.value.toFixed()
        font.pixelSize: 20
    }

    Text {
        id: text4
        x: 45
        y: 268
        width: 33
        height: 57
        text: "kWh:"
        font.pixelSize: 20
    }

    Rectangle {
        id: rectangle12
        x: 187
        y: 92
        width: r_manager.width
        height: r_manager.height
        color: "blue"
        objectName: "foo_object"

    }

}
