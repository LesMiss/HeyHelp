import QtQuick 2.15
import QtQuick.Controls 6.2
import "../../components"
import QtQuick.Window 2.15
import Qt5Compat.GraphicalEffects
import QtQml.Models 2.2

// My libraries -->
import messagesSendingLogic 1.0
import UserModel 1.0
import MessageModel 1.0
import getCurrentUid 1.0

Item {
    id: messagePage
    width: 1100
    height: 800

    property var currentSelectedItem
    property int someSavedValue: 5
    // connection for sockets -->
    Connections {
        target: client
        function onNewMessage(message) {
            msgListModel.socketUpdateInDb(message)
        }}
    Rectangle {
        id: rectangle
        anchors.fill: parent
        Rectangle {
            id: usrBack
            width: 320
            color: "#111111"
            anchors {
                top: topUsrMenu.bottom
                left: parent.left
                bottom: parent.bottom
            }
            Label {
                id: name1
                color: "#666666"
                text: qsTr("CONVERSATIONS")
                font.pointSize: 15
                font.styleName: "Medium"
                font.family: "YouTube Sans"
                anchors {
                    top: parent.top
                    topMargin: 8
                    left: parent.right
                    leftMargin: 13
                }}
            UserModeList { id: mod }
            ListView {
                id: listView
                currentIndex: 0
                model: DelegateModel {
                    id: myDelegateModel
                    model: mod
                    delegate: nameDelegate
                }
                anchors {
                    top: name1.bottom
                    topMargin: 15
                    right: parent.right
                    left: parent.left
                    bottom: parent.bottom
                }
                onCurrentItemChanged: {
                    currentSelectedItem = myDelegateModel.items.get(listView.currentIndex).model;
                }
                Component {
                    id: nameDelegate

                    Item {
                        id: row
                        width: 320
                        height: 76
                        MouseArea {
                            id: usersMouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            enabled: true
                            onClicked: {
                                // observe current choice -->
                                listView.currentIndex = index
                                currentSelectedItem = myDelegateModel.items.get(listView.currentIndex).model;
                                // reload all data in tableView -->
                                listView1.model.removeAllMsg()
                                listView1.model.observeValue(currentSelectedItem.nickname)
                            }}
                        Rectangle {
                            id: back
                            width: 20
                            height: 20
                            color: listView.currentIndex ==  model.index ? "#1c1c1c" : "#111111"
                            Behavior on color { ColorAnimation { duration: 299 }}
                            anchors.fill: parent
                        }
                        Rectangle {
                            id: leftBar
                            height: row.height
                            width: listView.currentIndex ==  model.index ? 2 : 0
                            Behavior on width { NumberAnimation  { duration: 289 }}
                            color: "#438DF7"
                            anchors {
                                left: parent.left
                                top: parent.top
                            }}
                        Rectangle {
                            id: bottomDevider
                            height: 1
                            width: row.width - 40
                            color: "#1c1c1c"
                            anchors {
                                bottom: parent.bottom
                                horizontalCenter: parent.horizontalCenter
                            }}
                        Rectangle {
                            id: userImg
                            width: 45
                            height: 45
                            radius: width / 2
                            color: "#ffffff"
                            anchors {
                                top: parent.top
                                topMargin: 10
                                left: parent.left
                                leftMargin: 20
                            }
                            Image {
                                id: avaBack
                                width: userImg.width
                                height: userImg.width
                                source: model.avatar
                                fillMode: Image.PreserveAspectCrop
                                layer.enabled: true
                                layer.effect: OpacityMask {
                                    maskSource: parent
                                }}}
                        Label {
                            id: nameLabel
                            text: model.name
                            color: "#ffffff"
                            font.pointSize: 14
                            font.styleName: "Bold"
                            font.family: "YouTube Sans"
                            anchors {
                                top: parent.top
                                topMargin: 12
                                left: userImg.right
                                leftMargin: 10
                            }}
                        Label {
                            id: professionLabel
                            text: model.avocation
                            color: "#939395"
                            font.pointSize: 12
                            font.styleName: "SemiBold"
                            font.family: "YouTube Sans"
                            anchors {
                                top: nameLabel.bottom
                                topMargin: 0
                                left: userImg.right
                                leftMargin: 10
                            }}
                        Label {
                            id: temOut
                            color: "#939395"
                            text: "9:36 AM" // custom
                            font.pointSize: 10
                            font.styleName: "Medium"
                            font.family: "YouTube Sans"
                            anchors {
                                top: parent.top
                                topMargin: 12
                                right: parent.right
                                rightMargin: 20
                            }}
                        Label {
                            id: descriptionLabel
                            text: model.last_message // custom
                            color: "#6FD185"
                            font.pointSize: 11
                            font.styleName: "Medium"
                            font.family: "YouTube Sans"
                            wrapMode: Text.WordWrap
                            anchors {
                                top: professionLabel.top
                                topMargin: 20
                                left: userImg.right
                                leftMargin: 6
                                right: parent.right
                                rightMargin: 20
                            }}
                    }}}}
        Rectangle {
            id: mainBack
            color: "#111111"
            anchors.left: usrBack.right
            anchors.right: parent.right
            anchors.top: topUsrMenu.bottom
            anchors.bottom: parent.bottom

            Rectangle {
                id: bottomBackForMessage
                height: 103
                color: "#16191c"
                anchors {
                    right: parent.right
                    left: parent.left
                    bottom: parent.bottom
                }
                TextField {
                    id: enterMessege
                    height: 43
                    placeholderText: qsTr("Aa")
                    leftPadding: 17
                    topPadding: 12
                    background: Rectangle {
                        color: "#1E2126"
                        radius: 13
                    }
                    anchors {
                        left: parent.left
                        right: sendBtn.left
                        bottom: parent.bottom
                        leftMargin: 30
                        rightMargin: 20
                        bottomMargin: 30
                    }}
                Rectangle {
                    id: sendBtn
                    width: 43
                    height: 43
                    color: enterMessege.text == "" ? "#1e2126" : "#37385a"
                    radius: enterMessege.text == "" ? 15 : width / 2
                    anchors {
                        right: parent.right
                        bottom: parent.bottom
                        bottomMargin: 30
                        rightMargin: 30
                    }
                    Behavior on color {
                        ColorAnimation {
                            duration: 100
                        }}
                    Behavior on radius {
                        NumberAnimation {
                            duration: 200
                        }
                    }

                    MessagesLogic {
                        id: messagesLog
                    }

                    Image {
                        id: image
                        anchors.fill: parent
                        source: "qrc:/images/new svg/mouse.svg"
                        fillMode: Image.Pad
                        MouseArea {
                            id: mouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            enabled: true
                            onClicked: {
                                // sockets -->
                                client.sendMessage(enterMessege.text)
                                // send inbox & message in db -->
                                messagesLog.setMessage(enterMessege.text, currentSelectedItem.nickname)
                                messagesLog.setInbox(enterMessege.text, currentSelectedItem.nickname, currentSelectedItem.uid)
                                // cler tf -->
                                enterMessege.text = ""
                            }}
                    }}
            }
            ListView {
                id: listView1
                anchors {
                    right: parent.right
                    left: parent.left
                    top: parent.top
                    topMargin: 20
                    leftMargin: 5
                    bottom: bottomBackForMessage.top
                }
                model:  MessageModelList { id: msgListModel }
                delegate: msgDelegate
                Component.onCompleted: {
                    listView1.model.removeAllMsg()
                    listView1.model.observeValue(currentSelectedItem.nickname)
                    console.log("onCompleted msgListModel", currentSelectedItem.nickname)
                }
            }
        }

        // REDACTION -->
        Rectangle {
            id: topUsrMenu
            height: 70
            color: "#16191c"
            anchors.left: topMyMenu.right
            anchors.right: parent.right
            anchors.top: parent.top

            AvatarItem {
                id: usrIcon
                circleWidth: 50
                circleHeight: 50
                sourceImg: "qrc:/images/png/ui.jpeg"
                width: 50
                height: 50
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10

            }

            Label {
                id: name
                color: "#c3c3c3"
                text: qsTr("Misha Sirotinskiy")
                anchors.left: usrIcon.right
                anchors.top: parent.top
                font.styleName: "Bold"
                font.pointSize: 14
                font.family: "YouTube Sans"
                anchors.leftMargin: 13
                anchors.topMargin: 17
            }

            Label {
                id: profession
                text: qsTr("UI Designer Helper")
                anchors.left: usrIcon1.right
                anchors.top: name.bottom
                font.pointSize: 14
                font.styleName: "Bold"
                font.family: "YouTube Sans"
                anchors.topMargin: 3
                anchors.leftMargin: 3
            }

            AvatarItem {
                id: usrIcon1
                sourceImg: "qrc:/images/png/up-arrow.png"
                width: 20
                height: 20
                anchors.left: usrIcon.right
                anchors.top: name.bottom
                anchors.topMargin: 2
                anchors.leftMargin: 13
                circleHeight: 20
                circleWidth: 20
            }

            DonateButton {
                id: donateButton
                width: 40
                height: 40
                sourceIcon: "qrc:/images/new svg/ellipsis-v.svg"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
            }

            DonateButton {
                id: donateButton1
                width: 40
                height: 40
                sourceIcon: "qrc:/images/new svg/volume-up.svg"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: donateButton.left
            }
        }

        Rectangle {
            id: topMyMenu
            width: 320
            height: 70
            color: "#1B1B1B"
            anchors.left: parent.left
            anchors.top: parent.top

            Label {
                id: myName
                x: 20
                width: 77
                height: 30
                text: qsTr("Liberty")
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 5
                anchors.left: parent.right
                anchors.verticalCenterOffset: 0
                font.family: "YouTube Sans"
                font.pointSize: 28
                font.styleName: "Medium"
            }

            DonateButton {
                id: donateButton2
                x: 272
                width: 40
                height: 40
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 15
                anchors.rightMargin: 8
                sourceIcon: "qrc:/images/svg/search.svg"
            }
        }
    }

    FontLoader {
        id: mont
        source: "qrc:/fonts/Mont/Mont-Bold.ttf"
    }

    PropertyAnimation {
        id: colorAnimation
        target: sendBtn
        properties: "color"
        to: "#ffffff"
        duration: 200
    }
    PropertyAnimation {
        id: colorAnimationReverse
        target: sendBtn
        properties: "color"
        to: "#1e2126"
        duration: 200
    }
    PropertyAnimation {
        id: colorAnimationClick
        target: sendBtn
        properties: "color"
        to: "#000000"
        duration: 200
    }

    CurrentUid { id: currentId }
//    function getUserColor() {
//        if currentId.readCurrentUserId() {

//        }

//    }

    // ui delegate by meessage
    Component {
        id: msgDelegate

        Item {
            id: row
            width: 320
            height: 62
            Rectangle {
                id: msgRect
                width: msgText.width
                height: 38
                radius: 8
//                border.width: 2
//                border.color: "#1C1C1C"
//                color: "#00ffffff"
                color: "#35373B"


                Text {
                    id: msgText
                    text: model.message
                    color: "#E8E8F6"
                    font.pixelSize: 15
                    anchors.centerIn: parent
                    leftPadding: 10
                    rightPadding: 10
                    font.styleName: "SemiBold"
                    font.family: "YouTube Sans"
                }
            }}}
}
