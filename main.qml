import QtQuick 2.11
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtCharts 2.3


ApplicationWindow {
    visible: true
    width: 1830
    height: 875
    color: "#151515"
    property var image_size: 250
    property var background_color: "#151515"

    Rectangle {
        id: rectangle2
        x: 15
        y: 30
        width: 382
        height: 180
        color: "#3f3a3a"
        radius: 10

        Image {
            id: image
            x: 175
            y: -50
            width: 220
            height: 197
            source: "images/logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            x: 20
            y: 25

            id: energyText
            width: 369
            height: 90
            color: "#ffffff"
            font.family: "LEMON MILK"
            text: qsTr("Energy\nCalcuGator")
            font.pointSize: 30
        }
    }




    //Bills Text
    Rectangle {
        x: 50
        y: 385
        width: 100
        height: 100
        color: "transparent"

        Rectangle{
            x:0
            y:0
            width:300
            height:60
            color:"#3f3a3a"
            radius: 10

            Label {
                id: personalCost
                x: 15
                y: 10
                width: 100
                height: 50
                font.family: "LEMON MILK"
                color: "#ffffff"
                text: qsTr("Monthly Bill: " + "$0.00")
                font.pixelSize: 15
            }
        }
        Label {
            id: stateCost
            x: 15
            y: 30
            width: 100
            height: 50
            font.family: "LEMON MILK"
            color: "#ffffff"
            text: qsTr("State Avg Monthly Bill: " + "$0.00")
            font.pixelSize: 15
        }

        Button {
            objectName: "calculateButton"
            id: calculate
            x: 0
            y: 70
            width: 300
            height: 50
            font.family: "LEMON MILK"
            text: "Calculate Bill"
            font.pixelSize: 25
            onClicked: calculate.text = "true"
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
        x: 410
        y: 18
        color: "transparent"

        ChartView {
            objectName: "scoreChart"
            id: bar
            x: 0
            y: 0
            backgroundColor: '#3f3a3a'
            theme: ChartView.ChartThemeBlueCerulean
            width: 1375
            height: 400
            layer.samples: 2
            z: 0
            BarSeries {
                id: scoreBars
                axisX: BarCategoryAxis {
                    categories: ["Gasoline", "Solar", "Nuclear", "Coal", "Hydro", "Wind", "Natural Gas" ] }
                axisY: ValueAxis {
                    visible: false
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
            y:450
            color: "transparent"

            ComboBox {
                id: leftChoice
                x: 13
                y: 0
                width: 225
                height: 45
                font.family: "LEMON MILK"
                font.pointSize: 10
                model: ["Gasoline", "Solar", "Nuclear", "Coal", "Hydroelectric", "Wind", "Natural Gas"]
                currentIndex: 2 //Default: nuclear

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
                backgroundColor: '#3f3a3a'
                theme: ChartView.ChartThemeBlueCerulean
                width: 425
                height: 345
                HorizontalBarSeries {
                    id: leftHBar
                    axisX: ValueAxis {
                        visible: false
                        id: valueAxisLeft
                        max: 1000
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
            x:475
            y:450
            color: "transparent"

            ComboBox {
                id: centChoice
                x: 13
                y: 0
                width: 225
                height: 45
                font.family: "LEMON MILK"
                font.pointSize: 10
                model: ["Gasoline", "Solar", "Nuclear", "Coal", "Hydroelectric", "Wind", "Natural Gas"]
                currentIndex: 5 //Default: wind

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
                backgroundColor: '#3f3a3a'
                theme: ChartView.ChartThemeBlueCerulean
                width: 425
                height: 345
                HorizontalBarSeries {
                    id: centHBar
                    axisX: ValueAxis {
                        visible: false
                        id: valueAxisCent
                        max: 750
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
            x:950
            y:450
            color: "transparent"

            ComboBox {
                id: rightChoice
                x: 13
                y: 0
                width: 225
                height: 45
                font.family: "LEMON MILK"
                font.pointSize: 10
                model: ["Gasoline", "Solar", "Nuclear", "Coal", "Hydroelectric", "Wind", "Natural Gas"]
                currentIndex: 1 //Default: solar

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
                backgroundColor: '#3f3a3a'
                theme: ChartView.ChartThemeBlueCerulean
                width: 425
                height: 345
                HorizontalBarSeries {
                    id: rightHBar
                    axisX: ValueAxis {
                        visible: false
                        id: valueAxisRight
                        max: 1000
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
        y: 190
        width: 300
        height: 250
        color: "transparent"

        Text {
            x: 0
            y: 25
            width: 300
            height: 50
            color: '#ffffff'
            font.family: "LEMON MILK"
            text: qsTr("Enter Power Usage ")
            font.pixelSize: 20
        }

        Slider {
            id: slider
            x: 0
            y: 60
            width: 300
            height: 25
            stepSize: 1
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
            color: '#ffffff'
            font.family: "LEMON MILK"
            text: "kWh: " + slider.value.toFixed()
            font.pixelSize: 20
        }

        TextField {
            objectName: "zipcode"
            x: 0
            y: 120
            width: 300
            height: 50
            font.family: "LEMON MILK"
            placeholderText: qsTr("Enter Zipcode")
        }

        Text {
            objectName: "errorText"
            x: 0
            y: 173
            width: 300
            height: 20
            text: ""
            font.family: "LEMON MILK"
            color: "#ffffff"
            font.pixelSize: 15
        }
    }

    //White Buttons
    Rectangle {
        x: 50
        y: 530
        width: 300
        height: 250
        color: "transparent"

        Button {
            objectName: "resetButton"
            id: reset
            x: 0
            y: 0
            width: 300
            height: 50
            font.family: "LEMON MILK"
            text: "Reset"
            font.pixelSize: 25
            onClicked: reset.text = "true"
        }

        Button {
            objectName: "saveButton"
            id: saveButton
            x: 0
            y: 60
            width: 300
            height: 50
            font.family: "LEMON MILK"
            text: "Save"
            font.pixelSize: 25
            onClicked: saveButton.text = "true"
        }

        Button {
            objectName: "loadButton"
            id: loadButton
            x: 0
            y: 120
            width: 300
            height: 50
            font.family: "LEMON MILK"
            text: "Load"
            font.pixelSize: 25
            onClicked: loadButton.text = "true"
        }

        Button {
            objectName: "teamButton"
            id: teamButton
            x: 0
            y: 200
            width: 300
            height: 50
            font.family: "LEMON MILK"
            text: "The Team"
            font.pixelSize: 25
            onClicked: teamButton.text = "true"
            palette  {
                button: "greenyellow"
            }
        }

        Button {
            objectName: "aboutCalcugatorButton"
            id: aboutCalcugatorButton
            x: 0
            y: 260
            width: 300
            height: 50
            font.pixelSize: 25
            font.family: "LEMON MILK"
            text: "About CalcuGator"
            onClicked: aboutCalcugatorButton.text = "true"
            palette  {
                button: "greenyellow"
            }

        }
    }

    //Orange Buttons
    Rectangle {
        x: 50
        y: 700
        width: 300
        height: 250
        color: "transparent"


    }

    Rectangle{
        objectName: "teamDialog"
        visible: false
        x: 400
        y: 25
        width: parent.width - 400 - 50
        height: parent.height - 25
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
                color: "white"
                x: image_size + 50
                y: 50
                font.family: "LEMON MILK"
                font.pointSize: 12
                text: "Joe is a florida native, born and raised \nin Tampa, Florida. His passion for\nfront-end development and climate\nchange led to his participation in this\nproject as project manager."
            }
        }

        Rectangle{
            y:400
            id: thomasRectangle
            Image{
                x: 25
                y: 25
                source: "images/thomas_scaled.jpg"
            }
            Text{
                color: "white"
                x: image_size + 50
                y: 50
                font.family: "LEMON MILK"
                font.pointSize: 12
                text: "Thomas is a Computer Engineer from\nTallahassee, Florida, and was a backend\ndeveloper for the Energy Calcugator.\nHe hopes that this tool will inspire\nstudents to become involved with\nfuture conservation efforts."
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
                color: "white"
                x: image_size + 50
                y: 50
                font.family: "LEMON MILK"
                font.pointSize: 12
                text:  "Kevin is a Computer Engineering \nmajor and Physics minor. He is \nfromn Medan, Indonesia. He likes \ndesigning cool interfaces and he is\none of the team's front-end \ndevelopers. He hopes that this \nsoftware tool will help inspire \nyounger generations to be more \nconscious of the environment."
            }
        }

        Rectangle{
            x:750
            y:400
            id: justinRectangle
            Image{
                x: 25
                y:  25
                source: "images/justin_scaled.jpg"
            }
            Text{
                color: "white"
                x: image_size + 50
                y: 50
                font.family: "LEMON MILK"
                font.pointSize: 12
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
        height: parent.height - 25
        color: background_color

        Text {
            x: 300
            y: 25
            id: aboutTitle

            color: "greenyellow"
            width: parent.width
            horizontalAlignment: Text.AlignCenter
            font.pointSize: 35
            font.family: "LEMON MILK"
            text: qsTr("Energy CalcuGator v1.0")
        }

        Text{
            id: aboutInfo
            color: "white"
            x:25
            y:125
            font.family: "LEMON MILK"
            font.pointSize: 15
            lineHeight: 1.0
            text: "\nWelcome to Energy Calcugator!\n
Energy Calcugator is an educational tool meant to teach users about their personal\nimpact on the environment through energy usage.
\nTo use the program, adjust the slider to input your monthly energy usage in\nkiloWatt-hours and observe how different types of energy sources would provide a\ndifferent impact on the environment.
If desired, you can also input your zip code into the textbox and press 'Calculate Bill'\nto get an estimate of your energy bill compared to others in your state.
The bottom graphs can be changed using the associated dropdowns to see the different types of\nenvironmental impacts for different energy sources."
        }

        Text{
            id: aboutSources
            color: "white"
            x:25
            y:650
            font.family: "LEMON MILK"
            font.pointSize: 8
            lineHeight: 0.5
            text:"Conversion Data Sources:\n\n
https://docs.wind-watch.org/US-footprints-Strata-2017.pdf\n
https://www.nrc.gov/reading-rm/doc-collections/nuregs/staff/sr1437/v1/tbl8-2.html\n
https://pubmed.ncbi.nlm.nih.gov/19774326/\n
https://www.ucsusa.org/resources/water-natural-gas\n
http://large.stanford.edu/courses/2017/ph241/styles2/\n
http://www.leedco.org/files/AWEA-Emissions-Comparison.pdf\n
https://www.energy.gov/eere/geothermal/geothermal-power-plants-minimizing-land-use-and-impact"

        }

        Text{
            id: aboutSources2
            color: "white"
            x: parent.width/2 + 50
            y:650
            font.family: "LEMON MILK"
            font.pointSize: 8
            lineHeight: 0.5
            text: "\n\n
https://www.eia.gov/electricity/sales_revenue_price/pdf/table5_a.pdf\n
https://www.eia.gov/tools/faqs/faq.php?id=667&t=2\n
https://www.eia.gov/tools/faqs/faq.php?id=74&t=11\n
https://www.eia.gov/environment/emissions/co2_vol_mass.php\n
https://www.un.org/esa/sustdev/sdissues/energy/op/hydro_tremblaypaper.pdf\n
https://www.ucsusa.org/resources/environmental-impacts-solar-power"
        }
    }


}
