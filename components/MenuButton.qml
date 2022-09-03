import QtQuick 2.0
import QtQuick.Controls 2.15

Button {
    id: leftMenu
    width: 60
    height: 60

    // Custom Properties
    property string pressedIconSource: "qrc:/images/new svg/estate.svg"
    property string iconSource: "qrc:/images/svg/estate.svg"

    // Animation hovered button
    QtObject {
        id: internal
        property var dynamicColor: {
            if(leftMenu.hovered) {
                icon.source = pressedIconSource
                colorAnimation.running = true
                radiusAnimation.running = true
                return "#1E2126"
            } else {
                isActivate()
            }
        }
    }

    // Menu Background
    background: Rectangle {
        id: back
        width: 55
        height: 55
        radius: 12
        clip: true
        color: internal.dynamicColor
        anchors.centerIn: parent

        Image {
            id: icon
            width: 24
            height: 24
            source: iconSource
            fillMode: Image.Pad
            anchors.centerIn: parent
        }
    }


    // Properties: radius and color
    PropertyAnimation {
        id: colorAnimation
        target: back
        properties: "color"
        to: "#37385a"
        duration: 145
    }

    PropertyAnimation {
        id: colorAnimationReverse
        target: back
        properties: "color"
        to: "#1E2126"
        duration: 145
    }

    PropertyAnimation {
        id: radiusAnimation
        target: back
        properties: "radius"
        to: 18
        duration: 120
    }

    PropertyAnimation {
        id: radiusAnimationReverse
        target: back
        properties: "radius"
        to: 12
        duration: 120
    }

    // Action on clicked
    property bool isActive: false

    function isActivate() {
        if(isActive) {
            icon.source = pressedIconSource
            colorAnimation.running = true
            radiusAnimation.running = true
            return "#37385a"
        } else {
            icon.source = iconSource
            colorAnimationReverse.running = true
            radiusAnimationReverse.running = true
            return "#37385a"
        }
    }

}
