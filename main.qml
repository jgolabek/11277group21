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



    Rectangle {
        x: 50
        y: 250
        width: 300
        height: 250
        color: "transparent"

        Text {
            x: 0
            y: 0
            width: 300
            height: 50
            text: qsTr("Enter Power Usage ")
            font.pixelSize: 25
        }
           
        Slider {
            id: slider
            x: 0
            y: 55
            width: 300
            height: 25
            stepSize: 0.02
            value: 0.5
            objectName: "slider"
            Connections {
                target: slider
            }
            to: 5
            from: 0
        }

        Text {
            id: text4
            x: 0
            y: 85
            width: 50
            height: 50
            text: "kWh: " + slider.value.toFixed()
            font.pixelSize: 20
        }
            
        TextField {
            objectName: "zipcode"
            x: 0
            y: 120
            width: 300
            height: 50
            placeholderText: qsTr("Enter Zipcode")
        }

        Text {
            objectName: "errorText"
            x: 0
            y: 170
            width: 300
            height: 20
            text: ""
            font.pixelSize: 18
        }

        Button {
            objectName: "calculateButton"
            id: calculate
            x: 0
            y: 200
            width: 300
            height: 50
            text: "Calculate"
            font.pixelSize: 35
            onClicked: calculate.text = "true"
            }

            
        Button {
            objectName: "resetButton"
            id: reset
            x: 0
            y: 260
            width: 300
            height: 50
            text: "Reset"
            font.pixelSize: 35
            onClicked: reset.text = "true"
        }

        Button {
            objectName: "saveButton"
            id: saveButton
            x: 0
            y: 320
            width: 300
            height: 50
            text: "Save"
            font.pixelSize: 35
            onClicked: saveButton.text = "true"
        }

        Button {
            objectName: "loadButton"
            id: loadButton
            x: 0
            y: 380
            width: 300
            height: 50
            text: "Load"
            font.pixelSize: 35
            onClicked: loadButton.text = "true"
        }

        
    }

    

    Rectangle {
        x: 50
        y: 700
        width: 300
        height: 250
        color: "transparent"

        Rectangle {
            x: 0
            y: 0
            width: 300
            height: 50
            color: "darkorange"
            Text {
                anchors.centerIn: parent
                x: 0
                y: 0
                width: 85
                text: qsTr("Team")
                font.pixelSize: 35
            }           
        }

        Rectangle {
            x: 0
            y: 60
            width: 300
            height: 50
            color: "darkorange"
            Text {
                x: 15
                y: 0
                width: 85
                text: qsTr("About CalcuGator")
                font.pixelSize: 35
            }           
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
