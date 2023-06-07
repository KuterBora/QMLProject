import QtQuick 2.15

Item {
    id: app_page
    anchors.fill: parent

    // Background
    Image {
        x: (parent.width - width) / 2
        y: 0
        height: parent.height
        width: height * 1.5
        source: "images/background_1"
    }

    // logo
    Image {
        x: parent.width / 6
        y: 0
        width: parent.width * 2 / 3
        height: parent.height / 5
        source: "images/wideLogo.jpg"
    }

    // terrains button
    Rectangle {
        x: parent.width / 2 - width / 2
        y: parent.height / 2 - height - height / 4
        width: parent.width / 4
        height: width / 3
        color: "red"
        opacity: 0.6
        Rectangle {
            width: parent.width - parent.height / 8
            height: parent.height - parent.height / 8
            color: "white"
            anchors.centerIn: parent
            Text {
                anchors.centerIn: parent
                font.family: "Times New Roman"
                font.pixelSize: parent.height / 2
                text: "Terrains"
            }

            MouseArea {
                anchors.fill: parent
                onPressed: parent.color = "red"
                onReleased: parent.color = "white"
            }
        }
    }

    // sales button
    Rectangle {
        x: parent.width / 2 - width / 2
        y: parent.height / 2
        width: parent.width / 4
        height: width / 3
        color: "red"
        opacity: 0.6
        Rectangle {
            width: parent.width - parent.height / 8
            height: parent.height - parent.height / 8
            color: "white"
            anchors.centerIn: parent
            Text {
                anchors.centerIn: parent
                font.family: "Times New Roman"
                font.pixelSize: parent.height / 2
                text: "Sales"
            }

            MouseArea {
                anchors.fill: parent
                onPressed: parent.color = "red"
                onReleased:parent.color = "white"
            }
        }

    }

    // profile button
    Rectangle {
        x: parent.width / 2 - width / 2
        y: parent.height / 2 + height + height / 4
        width: parent.width / 4
        height: width / 3
        color: "red"
        opacity: 0.6
        Rectangle {
            width: parent.width - parent.height / 8
            height: parent.height - parent.height / 8
            color: "white"
            anchors.centerIn: parent
            Text {
                anchors.centerIn: parent
                font.family: "Times New Roman"
                font.pixelSize: parent.height / 2
                text: "Profile"
            }

            MouseArea {
                anchors.fill: parent
                onPressed: parent.color = "red"
                onReleased: parent.color = "white"
            }
        }

    }
}
