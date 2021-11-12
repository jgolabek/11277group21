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
        x: 50
        y: 60

        id: calcugator
        width: 369
        height: 90
        text: qsTr("CalcuGator")
        font.pointSize: 30
    }

    Rectangle{
        x: 400
        y: 50
        color: "transparent"
        
        ChartView {
            objectName: "scoreChart"
            id: bar
            x: 0
            y: 0
            width: 1525
            height: 400
            layer.samples: 2
            z: 0
            BarSeries {
                id: scoreBars
                objectName: "scoreBars"
                axisX: BarCategoryAxis { categories: ["Gasoline", "Solar", "Nuclear", "Coal", "Hydro", "Wind", "Natural Gas" ] }
                BarSet {
                    //values: [0.145675*slider.value.toFixed(), slider.value.toFixed()*0.3475,
                        //slider.value.toFixed()*0.206, 0.95991*slider.value.toFixed(), slider.value.toFixed()*0.2365,
                    //slider.value.toFixed()*0.008, slider.value.toFixed()*0.35443645]
                    values: [0, 1, 2, 3, 4, 5, 6]
                    label: "Environmental Impact Score"
                }

                Connections {
                target: bridge
                onUpdateScore: {
                    scoreBars.clear()
                    var scores = bridge.getScores()
                    scoreBars.append("Environmental Impact Score", scores)
                }
                }
            }
        }

        Rectangle{
            x:0
            y:425
            color: "transparent"

            ComboBox {
                x: 13
                y: 0
                width: 225
                height: 45
                font.pointSize: 20
                displayText: "Nuclear"
            }

            ChartView {
                id: hBar
                x: 0
                y: 40
                width: 475
                height: 300
                HorizontalBarSeries {
                    name: "HorizontalBarSeries"
                    axisY: BarCategoryAxis { categories: ["CO2", "H20" ] }
                    BarSet {
                        values: [0.012*slider.value.toFixed(), 0.4*slider.value.toFixed()]
                        label: "Environmental Impacts"
                    }
                }
            }
        }

        Rectangle{
            x:525
            y:425
            color: "transparent"

            ComboBox {
                x: 13
                y: 0
                width: 225
                height: 45
                font.pointSize: 20
                displayText: "Wind"
            }

            ChartView {
                id: hBar1
                x: 0
                y: 40
                width: 475
                height: 300
                HorizontalBarSeries {
                    name: "HorizontalBarSeries"
                    axisY: BarCategoryAxis { categories: ["CO2", "H20" ] }
                    BarSet {
                        values: [0.011*slider.value.toFixed(), 0.005*slider.value.toFixed()]
                        label: "Environmental Impacts"
                    }

                }
            }
        }
        
        Rectangle{
            x:1050
            y:425
            color: "transparent"

            ComboBox {
                x: 13
                y: 0
                width: 225
                height: 45
                font.pointSize: 20
                displayText: "Solar"
            }

            ChartView {
                id: hBar2
                x: 0
                y: 40
                width: 475
                height: 300
                HorizontalBarSeries {
                    axisY: BarCategoryAxis { categories: ["CO2", "H20" ] }
                    name: "HorizontalBarSeries"
                    BarSet {
                        values: [0.045*slider.value.toFixed(), 0.65*slider.value.toFixed()]
                        label: "Environmental Impacts"
                    }
                }
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


    Rectangle {
        id: rectangle12
        x: 187
        y: 92
        width: r_manager.width
        height: r_manager.height
        color: "blue"
        objectName: "foo_object"
    }

    Rectangle{
        objectName: "aboutTeamDialog"
        visible: false
        x: 400
        y: 25
        width: 1000
        height: 750
        color: "crimson"	
    }
}