import QtQuick 2.12
import QtQuick.Window 2.12
import Helpers 1.0

Rectangle {
    id: headerBar
    anchors {
    }
    height: parent.height * 0.08
    Rectangle {
        id: dateTimeLabel
        anchors.fill: parent
        color: "green"
        Text {
            id: txt_currentDate
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left; leftMargin: 3
            }
            text: DateTime.currentDate
            color: "purple"
            font.pixelSize: parent.height * 0.6
        }
        Text {
            id: txt_currentTime
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right; rightMargin: 3
            }
            text: DateTime.currentTime
            color: "purple"
            font.pixelSize: parent.height * 0.6
        }
    }
}
