import QtQuick 2.5

Rectangle {
    width: 480; height: 240
    color: 'grey'

    GenieEffect {
        source: Image { source: 'assets/lighthouse.jpg' }
        MouseArea {
            anchors.fill: parent
            onClicked: parent.minimized = !parent.minimized
        }
    }
}
