import QtQuick 2.5

Item {
    id: root
    width: background.width; height: background.height


    Image {
        id: background
        anchors.centerIn: parent
        source: 'assets/background.png'
    }

    Text {
        anchors.centerIn: parent
        font.pixelSize: 48
        color: 'grey'
        text: 'Wanheda'
    }

    CurtainEffect {
        id: curtain
        anchors.fill: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: curtain.open = !curtain.open
    }
}
