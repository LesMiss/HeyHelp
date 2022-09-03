import QtQuick 2.0
import QtQuick.Controls 2.0

import SmartChangeColor 1.0

Item {
    id: smartTextField
    width: 240
    height: 40

    // custom needed properties
    property int widthSize: 50
    property string miniTitle: "Nick name"
    property string iconSource: "../../images/new svg/user-check.svg"
    property string placeholder: "Nickname"
    property string argMiniTitle: "miniTitle"
    property string arg: ""
    property var echo: TextInput.Normal

    TFChangeColor {
        id: tfChangeColor
    }

    TextField {
        id: textField
        width: smartTextField.width
        height: smartTextField.height
        font.pointSize: 11
        placeholderText: placeholder
        placeholderTextColor: "#a7a7a7"
        echoMode: echo
        topPadding: 13
        leftPadding: 35
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }

        background: Rectangle {
            id: nickBack
            radius: 12
            color: "#1a1a1a"
            border.width: 1.5
            border.color: tfChangeColor.changeColorOnTf(textField.length, textField.focus, arg)
            anchors.fill: parent
            Behavior on border.color { ColorAnimation { duration: 400 }}

            Rectangle {
                id: pushWindow
                width: widthSize
                height: 2
                color: tfChangeColor.changeColorOnTf(textField.length, textField.focus, "miniBack")
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.top: parent.top
                anchors.topMargin: 0
                Behavior on color { ColorAnimation { duration: 400 }}

                Label {
                    id: nickLbl
                    width: 44
                    height: 12
                    color: tfChangeColor.changeColorOnTf(textField.length, textField.focus, argMiniTitle)
                    text: miniTitle
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Poppins"
                    font.styleName: "Medium"
                    font.pointSize: 8

                    anchors {
                        centerIn: parent
                    }
                    Behavior on color { ColorAnimation { duration: 150 }}
                }
            }
            Image {
                id: nickIcon
                width: 18
                height: 18
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                source: iconSource
                fillMode: Image.PreserveAspectFit
                anchors.leftMargin: 10
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}
}
##^##*/
