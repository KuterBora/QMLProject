import QtQuick 2.15

Item {
    id: out
    anchors.fill: parent
    property string username_
    property string password_

    // logo
    Image {
        x: parent.width / 6
        y: 0
        width: parent.width * 2 / 3
        height: parent.height / 5
        source: "images/wideLogo.png"
    }

    // return button
    Rectangle {
        x: 250
        y: 250
        width: 500
        height: 100
        color: return_button.containsPress ? "grey" : "red"
        Text {
            anchors.centerIn: parent
            text: "Return to Menu"
            font.pixelSize: parent.height / 3.5
            font.family: "Times New Roman"
            color: "white"
        }

        MouseArea {
            id: return_button
            anchors.fill: parent
            onPressed: out.visible = false
        }
    }
}
