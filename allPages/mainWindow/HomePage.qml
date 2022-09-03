import QtQuick 2.0

Item {
    id: homePage
    width: 1100
    height: 800

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#edf2f8"
    }

    Rectangle {
        id: searchBack
        height: 55
        width: 55
        radius: 15
        color: "#ffffff"
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.top: parent.top
        anchors.topMargin: 12


        Image {
            id: searchIcn
            anchors.fill: parent
            source: "qrc:/images/svg/search.svg"
            fillMode: Image.Pad
        }
    }

    FontLoader {
        id: mont
        source: "qrc:/fonts/Mont/Mont-Bold.ttf"
    }

    Text {
        id: titleGreeting
        color: "#000000"
        text: qsTr("Good Morning, Migel!")
        font.family: "Mont"
        font.styleName: "Bold"
        anchors.top: searchBack.bottom
        anchors.topMargin: 22
        anchors.left: parent.left
        anchors.leftMargin: 15
        font.pixelSize: 32
    }

}
