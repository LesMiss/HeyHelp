import QtQuick 2.0
import QtQuick.Controls 6.2

import "../../components/TextField"
import QtQuick.Dialogs
import Qt5Compat.GraphicalEffects

// my import
import userKeysStorage 1.0
import keyGenerator 1.0
import getCurrentUid 1.0
import UserModel 1.0

Item {
    id: secondRegPage
    width: 580
    height: 450

    FileDialog {
        id: fileDialog
        selectedNameFilter.index: 1
        nameFilters: ["Image files (*.jpg *.jpeg *.png *.heic)"]
        onAccepted: {
            console.log(selectedFile)
            itemForImageHidden.source = selectedFile
        }
    }

    Rectangle {
        id: nickArea
        radius: 0
        anchors.fill: parent
        color: "#1a1a1a"

        CustomTextField {
            id: nickTF
            width: 110
            height: 36
            anchors.top: devider2.bottom
            anchors.horizontalCenterOffset: -60
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            echo: TextInput.Normal
        }

        CustomTextField {
            id: avocationTF
            width: 110
            height: 36
            anchors.top: nickTF.bottom
            anchors.horizontalCenterOffset: -60
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 10
            iconSource: "../../images/new svg/graduation-cap.svg"
            placeholder: "Avocation"
            echo: TextInput.Normal

        }

        Label {
            id: signIn
            width: 67
            height: 28
            color: "#bababa"
            text: qsTr("Sign In")
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            font.styleName: "SemiBold"
            font.family: "Poppins"
            font.pointSize: 20
        }


        Rectangle {
            id: rectangle2
            width: 100
            height: 1
            color: "#262626"
            anchors.top: signIn.bottom
            anchors.topMargin: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomTextField {
            id: passwTF
            x: 427
            width: 230
            height: 36
            anchors.top: desc4.bottom
            anchors.topMargin: 4
            anchors.horizontalCenter: parent.horizontalCenter
            iconSource: "../../images/new svg/lock.svg"
            placeholder: "Password"
            echo: TextInput.Password
        }

        Label {
            id: desc4
            y: 246
            width: 49
            height: 13
            color: "#ffffff"
            text: qsTr("Passsword")
            anchors.top: avocationTF.bottom
            horizontalAlignment: Text.AlignLeft
            wrapMode: Text.Wrap
            anchors.horizontalCenterOffset: -90
            anchors.horizontalCenter: parent.horizontalCenter
            font.styleName: "Medium"
            font.family: "Poppins"
            font.pointSize: 9
            anchors.topMargin: 12
        }

        Rectangle {
            id: signInBtn
            x: 130
            width: 230
            height: 36
            radius: 8
            color: "#1a1a1a"
            border.width: 1
            anchors.horizontalCenterOffset: 0
            border.color: "#50ad5d"
            anchors {
                top: passwTF.bottom
                horizontalCenter: parent.horizontalCenter
                topMargin: 20
            }

            Label {
                id: titleForBtn1
                width: 41
                height: 18
                color: "#ffffff"
                text: qsTr("Sign In")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
                font.family: "Poppins"
                font.styleName: "Medium"
            }

            UserKeys { id: userKeys }
            GetKeys { id: key }
            CurrentUid { id: currentUid }
            UserModeList { id: modelUser }
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onClicked: {
                    // We write current user id in QSettings
                    currentUid.writeSettings(nickTF.text)
                    console.log(nickTF.text)

                    // We write current user id in QSettings
                    key.writePublicKeyInLocalUserFile()
                    key.writePrivateKeyInLocalUserFile()

                    // We write json private/public keys
                    userKeys.saveKeysIntoJson()

                    // Here we write in database
                    console.log("appendModel")
                    modelUser.appendModel(nickTF.text, avocationTF.text, nameTF.text, timeTF.text, passwTF.text, fileDialog.selectedFile)

                    var component = Qt.createComponent("../mainWindow/MainWindow.qml")
                    var win = component.createObject()
                    win.show()
                    regWindow.visible = false
                }
                hoverEnabled: true
                enabled: true
                onEntered: {
                    colorAnimation.running = true
                }
                onExited: {
                    colorAnimationReverse.running = true
                }
            }

            Rectangle {
                id: rectangle1
                x: -118
                y: -146
                width: 25
                height: 25
                color: "#1a5422"
                radius: 6
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 6
                anchors.leftMargin: 6

                Image {
                    id: image
                    x: 8
                    y: 13
                    anchors.fill: parent
                    source: "../../images/new svg/user-check-green.svg"
                    sourceSize.height: 15
                    sourceSize.width: 15
                    fillMode: Image.Pad
                }
            }
        }

        Rectangle {
            id: devider2
            width: 100
            height: 1
            color: "#262626"
            anchors.top: regBtn.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            clip: true
        }

        Rectangle {
            id: regBtn
            x: 130
            y: 118
            width: 180
            height: 36
            color: "#438df7"
            radius: 8
            border.color: "#22232a"
            border.width: 1
            anchors.top: rectangle2.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -25
            Label {
                id: titleForBtn2
                width: 111
                height: 16
                color: "#ffffff"
                text: qsTr("Register with Liberty")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.styleName: "Medium"
                font.family: "Poppins"
                font.pointSize: 11
            }

            MouseArea {
                id: mouseArea1
                anchors.fill: parent
                enabled: true
                hoverEnabled: true
                onExited: colorAnimationReverse2.running = true
                onEntered: colorAnimation2.running = true

            }
            anchors.topMargin: 10
        }

        Rectangle {
            id: devider1
            y: 161
            width: 100
            height: 1
            color: "#262626"
            anchors.top: signIn.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 12
        }

        Label {
            id: desc6
            y: 272
            width: 80
            height: 14
            color: "#2b65cf"
            text: qsTr("Forgot Password?")
            anchors.top: timeTF.bottom
            horizontalAlignment: Text.AlignLeft
            wrapMode: Text.Wrap
            anchors.horizontalCenterOffset: 70
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Poppins"
            font.styleName: "Medium"
            font.pointSize: 9
            anchors.topMargin: 10
        }

        CustomTextField {
            id: nameTF
            y: 201
            width: 110
            height: 36
            anchors.top: devider2.bottom
            echo: TextInput.Normal
            iconSource: "../../images/new svg/user-circle.svg"
            placeholder: "Name"
            anchors.topMargin: 10
            anchors.horizontalCenterOffset: 60
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomTextField {
            id: timeTF
            y: 201
            width: 110
            height: 36
            anchors.top: nameTF.bottom
            echo: TextInput.Normal
            iconSource:  "../../images/new svg/atom.svg"
            placeholder: "Time"
            anchors.topMargin: 10
            anchors.horizontalCenterOffset: 60
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: chooseImgObj
            width: 36
            height: 36
            color: "#1a1a1a"
            radius: 8
            border.color: "#50ad5d"
            border.width: 1
            anchors.top: devider1.bottom
            anchors.topMargin: 10
            anchors.horizontalCenterOffset: 97

            MouseArea {
                id: mouseArea2
                anchors.fill: parent
                onExited: {
                    colorAnimationReverse1.running = true
                }
                enabled: true
                onEntered: {
                    colorAnimation1.running = true
                }
                hoverEnabled: true
                onClicked: {
                    fileDialog.open()
                }
            }

            Rectangle {
                id: rectangle3
                x: -118
                y: -146
                width: 25
                height: 25
                color: "#1a5422"
                radius: 6
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 6
                anchors.topMargin: 6
                Image {
                    id: itemForImage
                    x: 8
                    width: 23
                    height: 25
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../../images/new svg/image-shield.svg"
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    sourceSize.width: 16
                    fillMode: Image.Pad
                    sourceSize.height: 16
                }
            }

            Image {
                id: itemForImageHidden
                x: 8
                y: 6
                anchors.fill: parent
                source: ""
                fillMode: Image.PreserveAspectCrop


                visible: true

                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: parent
                }
            }
            anchors.horizontalCenter: devider1.horizontalCenter
        }
    }

    PropertyAnimation {
        id: colorAnimation
        target: signInBtn
        properties: "color"
        to: "#50ad5d"
        duration: 200
    }
    PropertyAnimation {
        id: colorAnimationReverse
        target: signInBtn
        properties: "color"
        to: "#1a1a1a"
        duration: 200
    }

    PropertyAnimation {
        id: colorAnimation1
        target: chooseImgObj
        properties: "color"
        to: "#50ad5d"
        duration: 200
    }
    PropertyAnimation {
        id: colorAnimationReverse1
        target: chooseImgObj
        properties: "color"
        to: "#1a1a1a"
        duration: 200
    }

    PropertyAnimation {
        id: colorAnimation2
        target: regBtn
        properties: "radius"
        to: 12
        duration: 200
    }
    PropertyAnimation {
        id: colorAnimationReverse2
        target: regBtn
        properties: "radius"
        to: 8
        duration: 200
    }


}


