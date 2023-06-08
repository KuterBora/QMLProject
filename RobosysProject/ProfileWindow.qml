import QtQuick 2.15
import QtQuick.Window 2.15

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

    // buttons and text
    Rectangle {
        color: "white"
        x: parent.width/2 - height/4
        y: parent.height/4
        width: height/2
        height: parent.height - parent.height / 4 - parent.height / 8
        border.width: width / 24
        border.color: "red"
        // edit button
        Rectangle {
            id: outer_edit_button
            x: parent.width / 2 - parent.width / 4
            y: parent.height * 5 / 8
            width: parent.width / 2
            height: width / 2
            color: edit_button.containsPress ? "grey" : "red"
            Text {
                anchors.centerIn: parent
                text: "Edit"
                font.pixelSize: parent.height / 3.5
                font.family: "Times New Roman"
                color: "white"
            }

            MouseArea {
                id: edit_button
                anchors.fill: parent
                onPressed: pop_up.visible = true
            }
        }

        // return button
        Rectangle {
            x: outer_edit_button.x
            y: outer_edit_button.y + edit_button.height + edit_button.height / 8
            width: edit_button.width
            height: edit_button.height
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

        // text
        Rectangle {
            x: parent.width / 16
            y: parent.height / 8
            width: parent.width - parent.width / 8
            height: parent.height - parent.height / 2
            color: "white"
            Text {
                id: username_box
                width: parent.width
                height: parent.height / 5
                text: "Username: " + username_
                font.family: "Times New Roman"
                font.pixelSize: height / 3
            }
            Text {
                id: password_box
                y: username_box.height
                width: parent.width
                height: parent.height / 5
                text: "Password: " + password_
                font.family: "Times New Roman"
                font.pixelSize: height / 3
            }
        }
    }

    // pop up
    Window {
        id: pop_up
        visible: false
        width: 500
        height: 500
    }}
