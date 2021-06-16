import QtQuick 2.12
import QtQuick.Window 2.12
import "MedComponents"

Window {
    visible: true
    width: 1280; height: 720
    title: qsTr("Medish Device")
    Rectangle {
        id: headerBar
        anchors {
            top: parent.top
            left: parent.left; right: parent.right
        }
        height: parent.height * 0.1
        DateTimeLabel { anchors.fill: parent }
    }
    Rectangle {
        id: mainContent
        anchors {
            top: headerBar.bottom; bottom: parent.bottom
            left: parent.left; right: parent.right
        }
        Loader {
            id: screenLoader
            anchors.fill: parent
            source: "Screens/HomeScreen.qml"
        }
        Connections {
            target: screenLoader.item
            onRequestSettings: screenLoader.source = "Screens/SettingScreen.qml"
            onRequestNew: screenLoader.source = "Screens/NewPatientScreen.qml"
            onRequestBack: screenLoader.source = "Screens/HomeScreen.qml"
            onRequestView: screenLoader.source = "Screens/DetailScreen.qml"
        }
    }
}
