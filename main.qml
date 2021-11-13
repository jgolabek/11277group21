import QtQuick 2.11
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtCharts 2.3


ApplicationWindow {
    visible: true
    width: 2000
    height: 1080
    color: "#b9f9e1"
    property var image_size: 250
    property var background_color: "#b9f9e1"
    Text {
        x: 50
        y: 60

        id: calcugator
        width: 369
        height: 90
        text: qsTr("CalcuGator")
        font.pointSize: 30
    }

    Rectangle {
        x: 50
        y: 175
        width: 100
        height: 100
        color: "transparent"

        Label {
            id: personalCost
            x: 0
            y: 0
            width: 100
            height: 50
            text: qsTr("Monthly Bill: " + "$0.0")
            font.pixelSize: 20
        }
        Label {
            id: stateCost
            x: 0
            y: 25
            width: 100
            height: 50
            text: qsTr("State Avg Monthly Bill: " + "$0.0")
            font.pixelSize: 20
        }
        Connections {
            target: bridge
            onCalculate: {
                var costs = bridge.getCosts()
                personalCost.text = qsTr("Monthly Bill: $" + costs[0])
                stateCost.text = qsTr("State Avg Monthly Bill: $" + costs[1])
            }
        }
    }

    //Top Graph
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
                axisX: BarCategoryAxis { categories: ["Gasoline", "Solar", "Nuclear", "Coal", "Hydro", "Wind", "Natural Gas" ] }
                axisY: ValueAxis {
                    id: valueAxisScore
                    max: 1000
                }
                BarSet {
                    values: [0, 0, 0, 0, 0, 0, 0]
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

        //Left Bottom Graph
        Rectangle{
            x:0
            y:425
            color: "transparent"

            ComboBox {
                id: leftChoice
                x: 13
                y: 0
                width: 225
                height: 45
                font.pointSize: 20
                model: ["Nuclear", "Coal", "Natural Gas"]

                Connections {
                    target: leftChoice
                    onActivated: {
                        leftHBar.clear()
                        var impact = bridge.getIndImpact(leftChoice.currentText)
                        leftHBar.append("Environmental Impacts", impact)
                    }
                }
            }

            ChartView {
                id: leftChartView
                x: 0
                y: 40
                width: 475
                height: 300
                HorizontalBarSeries {
                    id: leftHBar
                    axisX: ValueAxis {
                        id: valueAxisLeft
                        max: 500
                    }
                    axisY: BarCategoryAxis {
                        categories: ["CO2", "H20" , "S20", "Acres"]
                    }
                    BarSet {
                        values: [0, 0, 0, 0]
                        label: "Environmental Impacts"
                    }
                }
            }

            Connections {
                target: bridge
                onUpdateScore: {
                    leftHBar.clear()
                    var impact = bridge.getIndImpact(leftChoice.currentText)
                    leftHBar.append("Environmental Impacts", impact)
                }
            }
        }

        //Center Bottom Graph
        Rectangle{
            x:525
            y:425
            color: "transparent"

            ComboBox {
                id: centChoice
                x: 13
                y: 0
                width: 225
                height: 45
                font.pointSize: 20
                model: ["Wind", "Hydroelectric"]

                Connections {
                    target: centChoice
                    onActivated: {
                        centHBar.clear()
                        var impact = bridge.getIndImpact(centChoice.currentText)
                        centHBar.append("Environmental Impacts", impact)
                    }
                }
            }

            ChartView {
                id: centChartView
                x: 0
                y: 40
                width: 475
                height: 300
                HorizontalBarSeries {
                    id: centHBar
                    axisX: ValueAxis {
                        id: valueAxisCent
                        max: 500
                    }
                    axisY: BarCategoryAxis {
                        categories: ["CO2", "H20" , "S20", "Acres"]
                    }
                    BarSet {
                        values: [0, 0, 0, 0]
                        label: "Environmental Impacts"
                    }
                }
            }

            Connections {
                target: bridge
                onUpdateScore: {
                    centHBar.clear()
                    var impact = bridge.getIndImpact(centChoice.currentText)
                    centHBar.append("Environmental Impacts", impact)
                }
            }
        }

        //Right Bottom Graph
        Rectangle{
            x:1050
            y:425
            color: "transparent"

            ComboBox {
                id: rightChoice
                x: 13
                y: 0
                width: 225
                height: 45
                font.pointSize: 20
                model: ["Solar", "Gasoline"]

                Connections {
                    target: rightChoice
                    onActivated: {
                        rightHBar.clear()
                        var impact = bridge.getIndImpact(rightChoice.currentText)
                        rightHBar.append("Environmental Impacts", impact)
                    }
                }
            }

            ChartView {
                id: rightChartView
                x: 0
                y: 40
                width: 475
                height: 300
                HorizontalBarSeries {
                    id: rightHBar
                    axisX: ValueAxis {
                        id: valueAxisRight
                        max: 500
                    }
                    axisY: BarCategoryAxis {
                        categories: ["CO2", "H20" , "S20", "Acres"]
                    }
                    BarSet {
                        values: [0, 0, 0, 0]
                        label: "Environmental Impacts"
                    }
                }
            }

            Connections {
                target: bridge
                onUpdateScore: {
                    rightHBar.clear()
                    var impact = bridge.getIndImpact(rightChoice.currentText)
                    rightHBar.append("Environmental Impacts", impact)
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
            value: 1000
            objectName: "slider"
            Connections {
                target: slider
                onMoved: bridge.callUpdate(slider.value)
            }
            to: 2000
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

        Button {
            objectName: "teamButton"
            id: teamButton
            x: 0
            y: 0
            width: 300
            height: 50
            text: "Team"
            font.pixelSize: 35
            onClicked: teamButton.text = "true"
            palette  {
                button: "darkorange"
            }
        }

        Button {
            objectName: "aboutCalcugatorButton"
            id: aboutCalcugatorButton
            x: 0
            y: 60
            width: 300
            height: 50
            font.pixelSize: 35
             text: "About CalcuGator"
            onClicked: aboutCalcugatorButton.text = "true"
            palette  {
                button: "darkorange"
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
        objectName: "teamDialog"
        visible: false
        x: 400
        y: 25
        width: parent.width - 400 - 50
        height: parent.height - 25 - 50 - 50
        color: background_color

        Rectangle{
            y:0
            id: joesRectangle
            Image{
                x: 25
                y:25

                source: "images/joe_scaled.jpg"
            }
            Text{
                x: image_size + 50
                y: 50
                text: "Joe is a cool guy"
            }
        }

        Rectangle{
            y:500
            id: thomasRectangle
            Image{
                x: 25
                y:  25

                source: "images/thomas_scaled.jpg"
            }
            Text{
                x: image_size + 50
                y: 50
                text: "Thomas is a cool guy"
            }
        }

        Rectangle{
            x:750
            y:0
            id: kevinRectangle
            Image{
                x: 25
                y:  25

                source: "images/kevin_scaled.jpg"
            }
            Text{
                x: image_size + 50
                y: 50
                text: "Kevin is a cool guy"
            }
        }

        Rectangle{
            x:750
            y:500
            id: justinRectangle
            Image{
                x: 25
                y:  25

                source: "images/justin_scaled.jpg"
            }
            Text{
                x: image_size + 50
                y: 50
                text: "Justin is a cool guy"
            }
        }

    }

    Rectangle{
        objectName: "aboutCalcugatorDialog"
        visible: false
        x: 400
        y: 25
        width: parent.width - 400 - 50
        height: parent.height - 25 - 50 - 50
        color: background_color
        Text{
            x:25
            y:25
            text: "Something something powerful computational engine"
        }
    }


}
