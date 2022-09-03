import QtQuick 2.0
import QtQuick.Controls 6.2

Item {
    id: thirdRegPage
    width: 854
    height: 540


    Rectangle {
        id: back
        color: "#ffffff"
        anchors.fill: parent

        Label {
            id: title
            width: 297
            height: 42
            color: "#000000"
            text: qsTr("Sign In Liber")
            horizontalAlignment: Text.AlignHCenter
            font.family: "Poppins"
            font.styleName: "SemiBold"
            font.pointSize: 28

            anchors {
                top: parent.top
                topMargin: 175
                horizontalCenter: parent.horizontalCenter
            }
        }

        Label {
            id: desc
            width: 70
            height: 15
            color: "#6e6e73"
            text: qsTr("Walk of life")
            anchors.top: title.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 5
            font.family: "Poppins"
            font.styleName: "Medium"
            font.pointSize: 12

//            anchors {
//                top: title.bottom
//                horizontalCenter: parent.horizontalCenter
//                topMargin: 5
//            }
        }

        TextField {
            id: nickTf
            width: 228
            height: 35
            topPadding: 10
            font.pointSize: 11
            leftPadding: 15
            placeholderTextColor: "#a7a7a7"
            placeholderText: qsTr("Password")
            background: Rectangle {
                height: 2
                color: "#306fdb"
                anchors.bottom: parent.bottom
            }

            anchors {
                top: desc.bottom
                horizontalCenter: parent.horizontalCenter
                topMargin: 25
            }
        }

        TextField {
            id: passwTf
            width: 228
            height: 35
            topPadding: 10
            font.pointSize: 11
            leftPadding: 15
            placeholderTextColor: "#a7a7a7"
            placeholderText: qsTr("Password")
            background: Rectangle {
                height: 1
                color: "#E0E0E0"
                anchors.bottom: parent.bottom
            }

            anchors {
                top: nickTf.bottom
                horizontalCenter: parent.horizontalCenter
                topMargin: 10
            }
        }



        Rectangle {
            id: button
            width: 180
            height: 45
            border.color: "#306fdb"
            border.width: 2
            anchors.top: passwTf.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 40


            Label {
                id: titleForBtn
                width: 55
                height: 23
                color: "#6e6e73"
                text: qsTr("Sign In")
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0
                font.pointSize: 16
                font.family: "Poppins"
                font.styleName: "SemiBold"
                // anchors
                anchors.centerIn: parent
            }

            // area actions
            MouseArea {
                id: mouseAreaBtn
                anchors.fill: parent
                enabled: true
                onEntered: {
                    colorAnimation.running = true
                }
                onExited: {
                    colorAnimationReverse.running = true
                }

            }
        }
    }


    PropertyAnimation {
        id: colorAnimation
        target: button
        properties: "color"
        to: "#306fdb"
        duration: 145
    }
    PropertyAnimation {
        id: colorAnimationReverse
        target: button
        properties: "color"
        to: "#ffffff"
        duration: 145
    }
}
