import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12

Window {
    id: mainWindow
    property string username_: nameInput.text
    property string password_: passInput.text
    property string pop_up: " "
    title: qsTr("Login to Robosys")

    width: 1500
    height: 1000
    visible: true

    QtObject {
        id: internal
        function checkLogin(u, p) {
            if (controller.userExists(u, p)) {
                pop_up = "logging in"
                loginWindow.visible = false;
                mainWindow.title = "Robosys Mechatronics Systems"
                appWindow.visible = true;
            } else {
                pop_up = "User not found";
            }
        }

        function doSignin(u, p) {
            if (!controller.nameTaken(u, p)) {
                controller.addUser(u, p);
                pop_up = "Signed up";
            } else {
                pop_up = "Name already taken";
            }
        }
    }

    // app window
    Item {
        id: appWindow
        anchors.fill: parent
        visible: false
        App {}
    }

    // login window
    Item {
        id: loginWindow
        width: 1000
        height: 1000
        visible: true
        anchors.fill: parent

        // outer logo
        Image {
            x: parent.width/2 - width/2
            y: parent.height/10
            width: height
            height: parent.height - parent.height/5
            source: "../images/logo.png"
        }

        // outer frame
        Rectangle {
            opacity: 0.5
            x: parent.width/2 - height/4
            y: parent.height/10
            width: height/2
            height: parent.height - parent.height/5;
            color: "red"
        }

        // inner frame
        Rectangle {
            id: frame
            opacity: 0.9
            x: parent.width/2 - height/4
            y: parent.height/10 + parent.height/50
            width: height/2
            height: parent.height - parent.height/5 - parent.height/25
            color: "white"

            Rectangle {
                x: 0
                y: 0
                width: frame.width
                height: frame.height / 6
                color: "red"

                // label
                Text {
                    id: _text
                    x: 0
                    y: frame.height * 0.02
                    width: frame.width * 0.75
                    height: frame.height / 6
                    font.pixelSize: height/2
                    font.family: "Times New Roman"
                    color: "white"
                    text: "Robosys"
                }
                // small logo
                Rectangle {
                    x: _text.width
                    y: 0
                    width: frame.width - x
                    height: frame.height / 6
                    color: "white"
                    Image {
                        anchors.fill: parent
                        source: "../images/logo.png"
                    }
                }

                // pop-up text
                Rectangle {
                    x: frame.width / 12
                    y: frame.height * 5 / 8
                    width: frame.width - frame.width / 6
                    height: frame.height / 12
                    color: "red"
                    opacity: 0.7
                    Text {
                        anchors.centerIn: parent
                        text: pop_up
                        font.pixelSize: parent.height / 3
                    }
                }
            }

            // input box
            Rectangle {
                id: input_box
                x: frame.width / 12
                y: frame.height / 3
                width: (5* frame.width) / 6
                height: frame.height / 6
                color: "red"
                border.width: width / 100
                border.color: "white"

                // username
                Rectangle {
                    width: 0
                    height: parent.height / 2
                    color: "red"
                    border.width: parent.width / 100
                    border.color: "white"
                    Text {
                        id: username
                        x: input_box.width / 50
                        y: (input_box.width / 100) * 2.5
                        width: input_box.width - input_box.width / 50
                        height: input_box.height / 2 - input_box.width / 50
                        font.pixelSize: height / 3
                        font.family: "Times New Roman"
                        text: "Username:"
                        color: "white"
                    }
                    TextInput {
                        id: nameInput
                        x: username.width / 3
                        y: username.y
                        width: 2 * username.width / 3
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
                        width: input_box.width - input_box.width / 50
                        height: input_box.height / 2 - input_box.width / 50
                        font.pixelSize: height / 3
                        font.family: "Times New Roman"
                        text: "Password:"
                        color: "white"
                    }
                    TextInput {
                        id: passInput
                        x: password.width / 3
                        y: password.y
                        width: 2 * password.width / 3
                        height: password.height / 2
                        font.pixelSize: password.height / 3
                        echoMode: TextInput.Password
                        color: "white"
                    }
                }
            }

            //submit buttons
            Rectangle {
                id: submit_buttons
                x: frame.width / 5
                y: frame.height / 2
                width: (3* frame.width) / 5
                height: frame.height / 12
                color: "red"
                // login button
                Rectangle {
                    id: login
                    x: submit_buttons.width / 50
                    y: submit_buttons.height / 25
                    width: submit_buttons.width / 2 - submit_buttons.width / 50 - submit_buttons.width / 100
                    height: submit_buttons.height - 2 * submit_buttons.height / 25
                    color: "grey"
                    Text {
                        anchors.centerIn: parent
                        text: "Login"
                        font.pixelSize: parent.height / 2
                        font.family: "Times New Roman"
                        MouseArea {
                            anchors.fill: parent
                            onPressed: login.color = "white", internal.checkLogin(username_, password_)
                            onReleased: login.color = "grey"

                        }
                    }
                }
                // sign up button
                Rectangle {
                    id: sign_up
                    x: submit_buttons.width / 2 + submit_buttons.width / 100
                    y: submit_buttons.height / 25
                    width: submit_buttons.width / 2 - submit_buttons.width / 50 - submit_buttons.width / 100
                    height: submit_buttons.height - 2 * submit_buttons.height / 25
                    color: "grey"
                    Text {
                        anchors.centerIn: parent
                        text: "Sign up"
                        font.pixelSize: parent.height / 2
                        font.family: "Times New Roman"
                        MouseArea {
                            anchors.fill: parent
                            onPressed: sign_up.color = "white", internal.doSignin(username_, password_)
                            onReleased: sign_up.color = "grey"
                        }
                    }
                }
            }
        }
    }
}
