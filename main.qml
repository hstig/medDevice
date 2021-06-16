import QtQuick 2.13
import QtQuick.Window 2.12
import Helpers 1.0
import "MedComponents" as MedComp
import MyKeys 1.0

Window {
    visible: true
    width: 1280; height: 720
    title: qsTr("Medish Device")
    MedComp.DateTimeLabel {
        id: headerBar
        anchors {
            left: parent.left;
            top: parent.top;
            right: parent.right;
        }
    }
    Rectangle {
        id: mainContent
        color: "cyan"
        anchors {
            top: headerBar.bottom; bottom: parent.bottom
            left: parent.left; right: parent.right
        }
        Grid {
            x: 5; y: 5
            rows: 5; spacing: 10

            Repeater{
                //model: 10
                model: MyKey

                delegate: Rectangle{
                    height: 10
                    width: 10
                    MedComp.Button{
                        id: rptBtn
                        radius: 10
                        text: "model"
                        backgroundColor: "lightblue"
                        textColor: "green"
                        width: parent.width
                        height: parent.height
                    }
               }
            }
        }
    }
}
