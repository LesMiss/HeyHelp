import QtQuick 2.15
import QtQuick.Controls 2.15
// custom targets
import "../"

Item {
    id: firstRegPage
    width: 580
    height: 360


    FontLoader {
        id: poppins
        source: "qrc:/fonts/Poppins/Poppins-Medium.ttf"
    }

    FontLoader {
        id: poppins_SemiBold
        source: "qrc:/fonts/Poppins/Poppins-SemiBold.ttf"
    }

    Rectangle {
        id: back
        color: "#191919"
        border.color: "#ffffff"
        border.width: 0
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Label {
            id: title
            width: 211
            height: 42
            color: "#ffffff"
            text: qsTr("Liberty Desktop")
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: poppins_SemiBold.name
            font.pointSize: 28

            anchors {
                top: parent.top
                topMargin: 140
            }
        }

        Rectangle {
            id: button
            width: 335
            height: 45
            color: "#ffffff"
            radius: 10
            border.color: "#ffffff"
            border.width: 0
            anchors.top: row.bottom
            anchors.horizontalCenterOffset: 0
            anchors.topMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea {
                id: mouseAreaBtn
                anchors.fill: parent
                enabled: true
                hoverEnabled: true
                onEntered: {
                    colorAnimation.running = true
                    colorAnimationLabel.running = true
                    radiusAnimation.running = true
                }
                onExited: {
                    colorAnimationReverse.running = true
                    colorAnimationLabelReverse.running = true
                    radiusAnimationReverse.running = true
                }

                onClicked: {
                    loadPage("second")
                }

            }

            Image {
                id: image
                y: -24
                width: 15
                height: 15
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                source: "../images/new svg/check.svg"
                anchors.leftMargin: 80
                fillMode: Image.Pad
            }

            Label {
                id: titleForBtn
                x: 100
                y: 13
                width: 151
                height: 19
                color: "#6e6e73"
                text: qsTr("Continue with Liberty")
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 80
                font.pointSize: 14
                font.family: poppins.name
            }
        }

        Row {
            id: row
            width: 227
            height: 16
            anchors.top: title.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: -4

            Label {
                id: desc
                width: 137
                height: 16
                color: "#fbfbfd"
                text: "Don't have an account?"
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                font.family: poppins.name
                //            font.styleName: "Medium"
                font.pointSize: 11
                // anchors
            }

            Label {
                id: desc1
                width: 89
                height: 16
                color: "#306fdb"
                text: "Sign up for free"
                anchors.left: desc.right
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                anchors.leftMargin: 2
                font.pointSize: 11
                font.family: poppins.name
            }
        }

        Rectangle {
            id: rectangle
            width: 200
            height: 2
            color: "#2f2f2f"
            radius: 1
            anchors.top: button.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }



    }

    PropertyAnimation {
        id: colorAnimation
        target: button
        properties: "color"
        to: "#306fdb"
        duration: 200
    }
    PropertyAnimation {
        id: colorAnimationReverse
        target: button
        properties: "color"
        to: "#ffffff"
        duration: 200
    }

    PropertyAnimation {
        id: radiusAnimation
        target: button
        properties: "radius"
        to: 14
        duration: 145
    }
    PropertyAnimation {
        id: radiusAnimationReverse
        target: button
        properties: "radius"
        to: 10
        duration: 145
    }

    PropertyAnimation {
        id: colorAnimationLabel
        target: titleForBtn
        properties: "color"
        to: "#ffffff"
        duration: 145
    }
    PropertyAnimation {
        id: colorAnimationLabelReverse
        target: titleForBtn
        properties: "color"
        to: "#6e6e73"
        duration: 145
    }
}

