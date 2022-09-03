import QtQuick 2.0

Item {
    id: item1
    width: 60
    height: 60
    Rectangle {
        id: circle
        y: 116
        width: 48
        height: 48
        color: "#ffffff"
        radius: circle.width / 2
        anchors.top: top_item.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 3

        MouseArea {
            anchors.fill: parent
            enabled: true
            hoverEnabled: true

            // animation
            onEntered: {
                borderEntered.running = true
            }
            onExited: {
                borderExited.running = true
            }

            PropertyAnimation {
                id: borderEntered
                target: circle
                to: 15
                properties: "radius"
                duration: 145
            }

            PropertyAnimation {
                id: borderExited
                target: circle
                to: circle.width / 2
                properties: "radius"
                duration: 145
            }
        }
    }

    Rectangle {
        id: top_item
        x: 28
        width: 18
        height: 8
        color: "#ffffff"
        radius: 4
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: -4
    }

}


