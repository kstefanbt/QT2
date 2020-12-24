import QtQuick 2.5

Item {
	id: root
	anchors.fill: parent
	anchors.margins: 1
    property color color: 'green'

	Rectangle {
		anchors.fill: parent
		color: 'transparent'
		border.color: root.color
        border.width: 2
        opacity: 0.8
	}
}
