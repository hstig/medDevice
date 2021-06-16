import QtQuick 2.12
import "../MedComponents"
Item {
    id: root
    signal requestBack()
    Rectangle {
        anchors.fill: parent
        color: "lightgrey"
        Button {
            anchors {
                bottom: parent.bottom
                left: parent.left; right: parent.right
            }
            height: parent.height * 0.1
            text: "Back to List"
            onClicked: root.requestBack()
        }
        Button {
            id: btnEdit
            anchors {
                bottom: parent.bottom
                right: parent.right
            }
            height: parent.height * 0.1
            text: "Edit"
            onClicked: console.log("Edit button clicked")
        }
    }
}
