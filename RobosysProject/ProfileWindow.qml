import QtQuick 2.15
import QtQuick.Window 2.15

Item {
    id: out
    anchors.fill: parent
    property string username_
    property string password_
    property string new_username: nameInput.text
    property string new_password: passInput.text

    QtObject {
        id: internal
        function updateUser() {
            username_ = new_username
            password_ = new_password
            controller.updateUser(new_username, new_password)
        }
    }

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
        Rectangle {
            id: input_box
            x: parent.width / 6
            y: parent.height / 4
            width: parent.width * 4 / 6
            height: parent.height / 4
            color: "red"
            border.width: width / 100
            border.color: "white"

            // username
            Rectangle  {
                width: parent.width
                height: parent.height / 2
                color: "red"
                border.width: parent.width / 100
                border.color: "white"
                Text {
                    id: username
                    x: input_box.width / 50
                    y: (input_box.width / 100) * 2.5
                    height: input_box.height / 2 - input_box.width / 50
                    font.pixelSize: height / 3
                    font.family: "Times New Roman"
                    text: "New Username:"
                    color: "white"
                }
                TextInput {
                    id: nameInput
                    x: username.width * 1.2
                    y: username.y
                    width: parent.width
                    height: username.height / 2
                    font.pixelSize: username.height / 3
                    color: "white"
                }
            }

            // password box
            Rectangle {
                x: 0
                y: parent.height / 2
                width: parent.width
                height: parent.height / 2
                color: "red"
                border.width: parent.width / 100
                border.color: "white"
                Text {
                    id: password
                    x: input_box.width / 50
                    y: (input_box.width / 50) * 1.5
                    height: input_box.height / 2 - input_box.width / 50
                    font.pixelSize: height / 3
                    font.family: "Times New Roman"
                    text: "New Password:"
                    color: "white"
                }
                TextInput {
                    id: passInput
                    x: password.width * 1.2
                    y: password.y
                    width: parent.width
                    height: password.height / 2
                    font.pixelSize: password.height / 3
                    echoMode: TextInput.Password
                    color: "white"
                }
            }

            //submit button
            Rectangle {
                x: parent.width / 2 - parent.width / 6
                y: parent.height * 1.5
                width: parent.width / 3
                height: parent.height * 0.45
                color: submit.containsPress ? "grey" : "red"
                opacity: 0.75
                border.width: width / 100
                border.color: "grey"
                Text {
                    text: "Submit"
                    anchors.centerIn: parent
                    font.pixelSize: parent.height / 2
                    font.family: "Times New Roman"
                }

                MouseArea {
                    id: submit
                    anchors.fill: parent
                    onPressed: internal.updateUser()
                }
            }
        }
    }
}
