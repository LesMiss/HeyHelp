import QtQuick 2.15
import QtQuick.Controls 2.15
import "./allPages/regWindow"
import "./components"

Window {
    id: regWindow
    width: 580
    height: 420
    visible: true
    color: "#1a1a1a"

    title: qsTr("HeyHelp")

    function loadPage(page) {
        switch (page) {
        case 'second':
            stackView.push(second, StackView.Transition)
            break;
        case 'third':
            stackView.push(third, StackView.Transition)
            break;
            //        case '3':
            //            stackView.push(second)
            //            break;
        }
    }

    Component {
        id: first
        FirsPage {}
    }
    Component {
        id: second
        SecondPage {}
    }

    Component {
        id: third
        ThirdPage {}
    }


    StackView {
        id: stackView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 60
        anchors.rightMargin: 0
        initialItem: first

        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
    }

    FontLoader {
        id: poppins_SemiBold
        source: "qrc:/fonts/Poppins/Poppins-SemiBold.ttf"
    }

    Rectangle {
        id: rectangle4
        y: 324
        width: 34
        height: 34
        color: "#1a1a1a"
        radius: 8
        border.color: "#545454"
        border.width: 1
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        Image {
            id: image2
            anchors.fill: parent
            source: "images/new svg/angle-left.svg"
            fillMode: Image.Pad

            MouseArea {
                id: mouseAreaBack
                anchors.fill: parent

                onClicked: {
                    console.log("back")
                    stackView.pop()
                }
            }
        }
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
    }

}
