import QtQuick 2.0
import QtQuick.Controls 2.0

import CustomChangeColor 1.0

Item {
    id: customTextField
    width: 240
    height: 40

    // custom needed properties
    property int widthSize: 50
    property string iconSource: "../../images/new svg/user-check.svg"
    property string placeholder: "Nickname"
    property var echo: TextInput.Normal
    property string text: textField.text

    TFOnActiveChangeColor {
        id: tfOnActiveChangeColor
    }

    TextField {
        id: textField
        width: customTextField.width
        height: customTextField.height
        font.pointSize: 11
        placeholderText: placeholder
        placeholderTextColor: "#a7a7a7"
        echoMode: echo
        topPadding: 11
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
            border.color: tfOnActiveChangeColor.changeColor(textField.focus)
            anchors.fill: parent
            Behavior on border.color { ColorAnimation { duration: 400 }}
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
    D{i:0;height:36;width:230}D{i:1}D{i:2}
}
##^##*/
