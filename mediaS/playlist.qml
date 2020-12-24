import QtQuick 2.5
import QtMultimedia 5.6
import QtQml 2.0

Rectangle {
    id: root

    width: 1024
    height: 600

    color: "lightBlue"

    MediaPlayer {
        id: player
        playlist: Playlist {
            PlaylistItem { source: "trailer_400p.ogg" }
            PlaylistItem { source: "trailer_400p.ogg" }
            PlaylistItem { source: "trailer_400p.ogg" }
        }
    }

    VideoOutput {
        anchors.fill: parent

        source: player
    }

    Component.onCompleted: {
        player.playlist.currentIndex = 0;
        player.play();
    }
}
