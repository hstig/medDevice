import QtQuick 2.12

Item {
    id: root
    property int currentValue: 0
    property int minValue: -99
    property int maxValue: 99
    width: height * 3.55
    height: parent.height * 0.1
    Rectangle {
        id: background
        anchors.fill: parent
        color: "white"
    }
    Button {
        id: btnMinus
        anchors {
            top: display.top; bottom: display.bottom
            right: display.left
        }
        height: parent.height
        width: height
        text: "-"
        onClicked: currentValue -= 1
    }
    Text{
        id: display
        anchors.centerIn: parent
        width: height * 1.55
        height: parent.height
        text: currentValue
        font.pixelSize: height * 0.75
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    Button {
        id: btnPlus
        anchors {
            top: display.top; bottom: display.bottom
            left: display.right
        }
        height: parent.height
        width: height
        text: "+"
        onClicked: currentValue += 1
    }
    onCurrentValueChanged: {
        if(currentValue > maxValue)
            currentValue = maxValue
        else if(currentValue < minValue)
            currentValue = minValue
    }
}
