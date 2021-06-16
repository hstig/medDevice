import QtQuick 2.12
import "../MedComponents"

Item {
    id: root
    signal requestBack()
    Rectangle {
        anchors.fill: parent
        color: "red"
        Button {
            anchors {
                bottom: parent.bottom
                left: parent.left; right: parent.right
            }
            height: parent.height * 0.1
            text: "Back to List"
            onClicked: requestBack()
        }
    }
}
