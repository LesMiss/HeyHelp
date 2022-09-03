import QtQuick 2.0

Item {
    width: 50
    height: 50

    property int itemSize: 40
    property string sourceIcon: "qrc:/images/new svg/volume-up.svg"

    Rectangle {
        id: donateBack
        width: 50
        height: 50
        visible: true
        color: "#16191C"
        radius: 12
        anchors.centerIn: parent

        Image {
            id: donateImage
            anchors.fill: parent
            source: sourceIcon
            fillMode: Image.PreserveAspectFit
            anchors.margins: 12
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                enabled: true
                hoverEnabled: true

                onEntered: {
                    isEnteredRadius.running = true
                    colorAnimation.running = true
                }

                onExited: {
                    isExitedRadius.running = true
                    colorAnimationReverse.running = true
                }

//                onClicked: {
//                    console.log("was tap")
//                    colorAnimation.running = true
//                }
            }
        }
    }

    // Properties: radius and color
    PropertyAnimation {
        id: colorAnimation
        target: donateBack
        properties: "color"
        to: "#37385a"
        duration: 145
    }

    PropertyAnimation {
        id: colorAnimationReverse
        target: donateBack
        properties: "color"
        to: "#16191C"
        duration: 145
    }

    PropertyAnimation {
        id: isEnteredRadius
        target: donateBack
        property: "radius"
        to: 16
        duration: 120
    }

    PropertyAnimation {
        id: isExitedRadius
        target: donateBack
        property: "radius"
        to: 12
        duration: 120
    }

}

/*##^##
Designer {
    D{i:0;height:50;width:50}D{i:3}D{i:2}D{i:1}D{i:4}D{i:5}D{i:6}D{i:7}
}
##^##*/
