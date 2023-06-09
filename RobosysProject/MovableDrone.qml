import QtQuick 2.15

Rectangle {
    property int a: 0
    property int b: 0
    x: 0
    y: 0
    width: 100
    height: 100
    color: "transparent"
    MouseArea {
        id: mouse
        anchors.fill: parent
        drag.target: parent
        onPressed: parent.x += a, parent.y += b
        onReleased: parent.x -= a, parent.y -= b
        Image {
            anchors.fill: parent
            source: "images/drone_1.png"
        }
    }

}
