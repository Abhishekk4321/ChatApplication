import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: loginRect
    width: mainWindow.width
    height: mainWindow.height
    radius: 20
    gradient: Gradient {
        GradientStop { position: 10.11; color: "#34495e" }
        GradientStop { position: 11.0; color: "#2c3e50" }
    }

    // Background layer: decorative gradient circles
    Repeater {
        model: 10
        delegate: Rectangle {
            width: Math.random() * 120 + 50
            height: width
            radius: width / 2
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 0.1)
            anchors.centerIn: parent
            x: Math.random() * parent.width
            y: Math.random() * parent.height
        }
    }

    // Foreground colorful circles
    Repeater {
        model: [
            { color: "#d5f5e3", margin: 0, align: "left" },
            { color: "#ebdef0", margin: 50, align: "left" },
            { color: "#fadbd8", margin: 100, align: "left" },
            { color: "#a9dfbf", margin: 150, align: "left" },
            { color: "#e6b0aa", margin: 0, align: "right" },
            { color: "#d2b4de", margin: 50, align: "right" },
            { color: "#aed6f1", margin: 100, align: "right" },
            { color: "#fcf3cf", margin: 150, align: "right" },
            { color: "#b3b6b7", margin: 0, align: "bottom" },
            { color: "#ba4a00", margin: 50, align: "bottom" },
            { color: "#af7ac5", margin: 100, align: "bottom" },
            { color: "#922b21", margin: 150, align: "bottom" }
        ]

        delegate: Rectangle {
            width: 80
            height: 80
            radius: 40
            color: modelData.color
            opacity: 0.8

            anchors {
                left: (modelData.align === "left" || modelData.align === "bottom") ? loginRect.left : undefined
                leftMargin: (modelData.align === "left" || modelData.align === "bottom") ? modelData.margin : 0

                right: modelData.align === "right" ? loginRect.right : undefined
                rightMargin: modelData.align === "right" ? modelData.margin : 0

                bottom: modelData.align === "bottom" ? loginRect.bottom : undefined
            }

            // Add slight pulsing animation for a dynamic feel
            SequentialAnimation {
                loops: Animation.Infinite
                NumberAnimation { target: parent; property: "scale"; from: 1; to: 1.2; duration: 2000; easing.type: Easing.InOutQuad }
                NumberAnimation { target: parent; property: "scale"; from: 1.2; to: 1; duration: 2000; easing.type: Easing.InOutQuad }
            }
        }
    }

    // Title
    Text {
        text: "Unique Background Design"
        font.pixelSize: 24
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        color: "#ecf0f1"
        font.bold: true
    }
}
