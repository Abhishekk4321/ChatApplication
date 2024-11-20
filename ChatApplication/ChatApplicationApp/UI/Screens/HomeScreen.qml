import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle
{
    height: mainWindow.height
    width: mainWindow.width

    Rectangle
    {
        id:header
        height: 50
        width: parent.width
        color: "#bdc3c7"
        Text {
            id: headerIconText
            text: qsTr("Chat")
            font.bold: true
            anchors{
                verticalCenter: headerIcon.verticalCenter
                left: headerIcon.right
                leftMargin: 10
            }
        }
        Image {
            id: headerIcon
            height: 50
            width: 50
            anchors.centerIn: parent
            source: "qrc:/../Images/chat-svgrepo-com.svg"
        }
        Button
        {
            id:menuButton
            text: "☰"
            height: 50
            width: 50
            anchors.left: parent.left
            background: Rectangle{
                color: "transparent"
            }
            onClicked: {
                drawer.open()
            }
        }

        Drawer
        {
            id:drawer
            width: 250
            edge: Qt.LeftEdge
            modal: true
            Rectangle
            {
                id:drawerRect
                height: mainWindow.height
                width: 250

                Rectangle
                {
                    id: userProfileRect
                    height: parent.height/10
                    width: parent.width/3
                    radius: parent.height/6
                    border.color: "grey"

                    anchors{
                        top: drawerRect.top
                        topMargin: 20
                        left: drawerRect.left
                        leftMargin: 20
                    }

                }
                Text {
                    id: userNameRect
                    text: qsTr("Abhi")
                    anchors{
                        verticalCenter: userProfileRect.verticalCenter
                        left: userProfileRect.right
                        leftMargin: 10
                    }
                }
            }
        }
    }

    Rectangle{
       height: parent.height - header.height
       width: parent.width
       anchors{
           top: header.bottom
       }

       color: "red"
    }
}
