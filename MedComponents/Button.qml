import QtQuick 2.0

Item {
    id: root
    property alias text: textLabel.text
    property color textColor: "black"
    property color backgroundColor: "grey"
    property alias radius: btnComp.radius

    signal clicked(bool checked)
    property bool checked: false

    Rectangle{
        id: btnComp
        width: textLabel.implicitWidth * 2
        height: textLabel.implicitHeight * 1.1

        color: enabled ? mouseArea.pressed ? Qt.lighter(backgroundColor) : backgroundColor : Qt.darker(backgroundColor)
        MouseArea {
            id: mouseArea
            anchors.fill: parent
        }
        Text {
            id: textLabel
            text: qsTr("ButtonText")
            font.pixelSize: parent * 0.6
            anchors.centerIn: parent
            color: textColor
        }
    }
}
