import QtQuick 2.12
import "../MedComponents"

Item {
    id: root
    anchors.fill: parent
    signal requestNew()
    signal requestSettings()
    signal requestRemove(int row)
    signal requestView(int row)
    property int buttonHeight: height * 0.1
    Rectangle {
        anchors {
            left: parent.left; right: parent.right
            top: parent.top; bottom: btnSettings.top
        }
        color: "cyan"
        Button {
            id: detailButton
            anchors.centerIn: parent
            height: buttonHeight
            onClicked: requestView(0)
        }
    }
    Button {
        id:btnSettings
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
        height: buttonHeight
        text: "⚙"
        onClicked: requestSettings()
    }
    Button {
        id: btnNew
        anchors {
            bottom: parent.bottom
            left: parent.left; right: btnSettings.left
        }
        height: buttonHeight
        text: "Add Patient"
        onClicked: requestNew()
    }
}
