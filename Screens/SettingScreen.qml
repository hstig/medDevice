import QtQuick 2.12
import Helpers 1.0
import "../MedComponents"

Item {
    id: root
    signal requestBack()
    Rectangle {
        anchors.fill: parent
        color: "lightgrey"
        Text {
            id: timeZoneLabel
            anchors {
                top: parent.top;
                left: parent.left
                margins: parent.height * 0.03
            }
            text: "Time Offset from UTC"
            font.pixelSize: parent.height * 0.08
        }
        SpinBox {
            id: timeZoneSelector
            anchors {
                top: timeZoneLabel.top
                left: timeZoneLabel.right
                leftMargin: 12
            }
            currentValue: DateTime.utcOffset
            minValue: -12
            maxValue: 12
            onCurrentValueChanged: DateTime.utcOffset = currentValue
        }
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
