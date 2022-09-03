import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: moderButton
    width: 60
    height: 60

    property string iconSource: "qrc:/images/svg/estate.svg"
    property string pressedIconSource: "qrc:/images/new svg/estate.svg"
    property bool isActive: false
    property string setPage: ""

    Rectangle {
        id: rectangle1
        width: 55
        height: 55
        color: "#1e2126"
        radius: 12
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Image {
            id: image
            width: 24
            height: 24
            anchors.verticalCenter: parent.verticalCenter
            source: iconSource
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.Pad
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            drag.smoothed: true
            enabled: true
            hoverEnabled: true

            onEntered: {
                y_animation.running = true
                image.source = pressedIconSource
            }
            onExited: {
                y_animation_reverse.running = true
                image.source = iconSource

                // isActive property
                isActivate()
                isActive = false
            }

            onClicked: {
                isActive = true
                loader.setSource(Qt.resolvedUrl(setPage))

            }
        }
    }

    function isActivate() {
        if(isActive) {
            y_animation_reverse.running = false
            image.source = pressedIconSource
            rectangle1.color = "#37385a"
            isActive = false
        } else {
            rectangle1.color = "#2E2E48"
        }
    }

    PropertyAnimation {
        id: y_animation
        target: rectangle1
        properties: "color"
        to: "#37385a"
        duration: 145
    }

    PropertyAnimation {
        id: y_animation_reverse
        target: rectangle1
        properties: "color"
        to: "#1E2126"
        duration: 145
    }
}


