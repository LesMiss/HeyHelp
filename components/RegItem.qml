import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: regItem
    height: 24
    width: 24

    property string outCircleStateColor: "#6251e9"
    property string insideCircleStateColor: "#ffffff"

    // For Animation -->
    property string outCircleColorChange: "#6251e9"
    property string insideCircleColorChange: "#BFBAD9"

    // For border -->
    property string colorWidth: "#6251e9"

    Rectangle {
        id: outCircle
        width: 20
        height: 20
        color: outCircleStateColor
        radius: width / 2
        border.color: colorWidth
        border.width: 1
        anchors.centerIn: parent
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            enabled: true
            hoverEnabled: true
            onEntered: {
                colorAnimation.running = true
                insideCirclenimation.running = true

            }

            onExited: {
                colorAnimationReverse.running = true
                insideCirclenimationReverse.running = true

            }
        }
        Rectangle {
            id: insideCircle
            width: 6
            height: 6
            color: insideCircleStateColor
            radius: width / 2
            anchors.centerIn: parent
        }
    }

    PropertyAnimation {
        id: insideCirclenimation
        target: insideCircle
        properties: "color"
        to: insideCircleColorChange
        duration: 145
    }
    PropertyAnimation {
        id: insideCirclenimationReverse
        target: insideCircle
        properties: "color"
        to: insideCircleStateColor
        duration: 145
    }

    PropertyAnimation {
        id: colorAnimation
        target: outCircle
        properties: "color"
        to: outCircleColorChange
        duration: 145
    }
    PropertyAnimation {
        id: colorAnimationReverse
        target: outCircle
        properties: "color"
        to: outCircleStateColor
        duration: 145
    }



}
