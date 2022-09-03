import QtQuick 2.0
import Qt5Compat.GraphicalEffects

Item {
    width: 70
    height: 75

    property int circleHeight: 60
    property int circleWidth: 60
    property string sourceImg: "qrc:/images/png/IMG_5462.HEIC"

    Rectangle {
        id: circle
        width: circleWidth
        height: circleHeight
        color: "#37385a"
        radius: width / 2
        anchors.centerIn: parent

        Image {
            id: avatarImg
            anchors.fill: parent
            anchors.margins: 2
            source: sourceImg
            fillMode: Image.PreserveAspectCrop


            visible: true

            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: parent
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                enabled: true
                hoverEnabled: true

                onEntered: {
                    avatarEntered.running = true
                }

                onExited: {
                    avatarExited.running = true
                }
            }
        }
    }

    PropertyAnimation {
        id: avatarEntered
        target: circle
        property: "radius"
        to: 21
        duration: 145
    }

    PropertyAnimation {
        id: avatarExited
        target: circle
        property: "radius"
        to: circle.width / 2
        duration: 145
    }
}
