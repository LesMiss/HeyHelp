import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.4
import QtQml.Models 2.3
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    TextField{
          id: searchField
          width: parent.width
          visible: false

          onTextChanged: {
              timer.restart();
              if(text.length > 0 ) {
                  model.applyFilter(text);
              } else {
                  model.reload();
              }
          }

          onVisibleChanged: {
              if( visible) focus = true
          }

          Behavior on visible {
              NumberAnimation{ duration: 200 }
          }
      }

    ListView {
        id:listView
        clip: true
        width: parent.width
        height: parent.height
        y: searchField.visible ? searchField.height : 0

        Behavior on y {
            NumberAnimation{ duration: 200 }
        }

        model: ListModel {
            id: model
            Component.onCompleted: {
                reload();
            }

            function reload() {
                var bookList = DB.getAllBooks();
                model.clear();
                for( var i=0; i < bookList.length ; ++i ) {
                    model.append(bookList[i]);
                }
            }

            function applyFilter(bookName) {
                var bookList = DB.getBooksByName(bookName);
                model.clear();
                for( var i=0; i < bookList.length ; ++i ) {
                    model.append(bookList[i]);
                }
            }
        }

        delegate: listDelegate

        onContentYChanged: {
            if( contentY < -100 ) {
                searchField.visible = true;
                timer.running = true;
            }
        }
    }
    Timer{
        id: timer; running: false; interval: 7000; repeat: false
        onTriggered: {
            searchField.visible = false;
        }
    }
//    ListView {
//        id: view

//        property int remainder: 0
//        property bool sortLexically: true

//        anchors {
//            left: parent.left
//            right: parent.right
//            top: parent.top
//            bottom: controls.top
//        }

//        model: delegateModel
//        onRemainderChanged: delegateModel.update()
//        onSortLexicallyChanged: delegateModel.update()
//    }

//    RowLayout {
//        id: controls

//        anchors.left: parent.left
//        anchors.right: parent.right
//        anchors.bottom: parent.bottom

//        Button {
//            text: qsTr("Toggle odd/even")
//            onClicked: view.remainder = (view.remainder + 1) % 2;
//        }

//        Button {
//            text: qsTr("Toggle sort")
//            onClicked: view.sortLexically = !view.sortLexically
//        }

//        Slider {
//            id: numberOfItems
//            from: 10
//            to: 1000
//            value: 100
//            Layout.fillWidth: true
//        }
//    }
}
