import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../components"
//import "pages"
import userKeysStorage 1.0

Window {
    id: mainWindow
    width: 1720
    height: 1080
    visible: true
    color: "#454851"
    title: qsTr("HeyHelp")

    property int agario: 1

    Rectangle {
        id: customolumn
        width: 96
        color: "#16191c"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Rectangle {
            id: column
            width: 70
            height: 420
            color: "#00ffffff"
            anchors.centerIn: parent

            MenuButton {
                id: left_home
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    console.log("left_home")
                    isActive = true
                    left_message.isActive = false
                    left_privateMsg.isActive = false
                    left_qrcode.isActive = false
                    left_shield.isActive = false
                    left_settings.isActive = false

                    // Set source Page
                    loader.setSource("HomePage.qml")
                }
            }

            MenuButton {
                id: left_message
                anchors.top: left_home.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 7
                iconSource: "qrc:/images/svg/comments-alt.svg"
                pressedIconSource: "qrc:/images/new svg/comments-alt.svg"
                isActive: true
                onClicked: {
                    console.log("left_message")
                    isActive = true
                    left_home.isActive = false
                    left_privateMsg.isActive = false
                    left_qrcode.isActive = false
                    left_shield.isActive = false
                    left_settings.isActive = false
                    left_find_users.isActive = false
                    loader.setSource("MessagePage.qml")
                }
            }

            MenuButton {
                id: left_find_users
                anchors.top: left_message.bottom
                anchors.topMargin: 7
                anchors.horizontalCenter: parent.horizontalCenter
                iconSource: "qrc:/images/svg/comment-alt-search.svg"
                pressedIconSource: "qrc:/images/svg/comment-alt-search-pur.svg"

                onClicked: {
                    console.log("left_find_users")
                    isActive = true
                    left_home.isActive = false
                    left_message.isActive = false
                    left_qrcode.isActive = false
                    left_shield.isActive = false
                    left_settings.isActive = false
                    loader.setSource("SearchUsersPage.qml")
                }
            }

            MenuButton {
                id: left_privateMsg
                anchors.top: left_find_users.bottom
                anchors.topMargin: 7
                anchors.horizontalCenter: parent.horizontalCenter
                iconSource: "qrc:/images/svg/comment-alt-shield.svg"
                pressedIconSource: "qrc:/images/new svg/comment-alt-shield.svg"

                onClicked: {
                    console.log("left_privateMsg")
                    isActive = true
                    left_home.isActive = false
                    left_message.isActive = false
                    left_qrcode.isActive = false
                    left_shield.isActive = false
                    left_settings.isActive = false
                    left_find_users.isActive = false
                }
            }

            MenuButton {
                id: left_qrcode
                anchors.top: left_privateMsg.bottom
                anchors.topMargin: 7
                anchors.horizontalCenter: parent.horizontalCenter
                pressedIconSource: "qrc:/images/new svg/qrcode-scan.svg"
                iconSource: "qrc:/images/svg/qrcode-scan.svg"

                onClicked: {
                    console.log("left_qrcode")
                    isActive = true
                    left_home.isActive = false
                    left_message.isActive = false
                    left_privateMsg.isActive = false
                    left_shield.isActive = false
                    left_settings.isActive = false
                    left_find_users.isActive = false
                }
            }

            MenuButton {
                id: left_shield
                anchors.top: left_qrcode.bottom
                anchors.topMargin: 7
                anchors.horizontalCenter: parent.horizontalCenter
                iconSource: "qrc:/images/svg/shield-check.svg"
                pressedIconSource: "qrc:/images/new svg/shield-check.svg"

                onClicked: {
                    console.log("left_shield")
                    isActive = true
                    left_home.isActive = false
                    left_message.isActive = false
                    left_privateMsg.isActive = false
                    left_qrcode.isActive = false
                    left_settings.isActive = false
                    left_find_users.isActive = false
                    loader.setSource("../regWindow/SecondPage.qml")
                }
            }

            MenuButton {
                id: left_settings
                anchors.top: left_shield.bottom
                anchors.topMargin: 7
                anchors.horizontalCenter: parent.horizontalCenter
                iconSource: "qrc:/images/svg/setting.svg"
                pressedIconSource: "qrc:/images/new svg/setting.svg"

                onClicked: {
                    console.log("left_settings")
                    isActive = true
                    left_home.isActive = false
                    left_message.isActive = false
                    left_privateMsg.isActive = false
                    left_qrcode.isActive = false
                    left_shield.isActive = false
                    left_find_users.isActive = false
                }
            }
        }

        Text {
            id: sign_out
            color: "#83a0ef"
            text: qsTr("Log out")
            anchors.top: avatarItem.bottom
            font.pixelSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 7
            font.family: "YouTube Sans"
            font.styleName: "Medium"

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                enabled: true
                hoverEnabled: true

                onEntered: {
                    sign_out.color = "#83a0ef"
                }
                onExited: {
                    sign_out.color = "#5180ff"
                }

                UserKeys {
                    id: userKeys
                }

                onClicked: {
                    userKeys.deleteUserKeys()
                    var component = Qt.createComponent("../../main.qml")
                    var win = component.createObject()
                    win.show()
                    mainWindow.visible = false
                    console.log("sign out")
                }

            }
        }

        AvatarItem {
            id: avatarItem
            x: 13
            y: 0
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 13
        }
    }

    Rectangle {
        id: rectangle2
        color: "#ff000000"
        anchors.left: customolumn.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0

        Loader {
            id: loader
            anchors.fill: parent
            active: true
            source: Qt.resolvedUrl("MessagePage.qml")
        }
    }
}


