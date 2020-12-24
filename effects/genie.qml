import QtQuick 2.5

Rectangle {
    width: 480; height: 240
    color: 'grey'

    Image {
        id: sourceImage
        width: 80; height: width
        source: "assets/longroad.jpg"
        visible: false
    }
    ShaderEffect {
        width: 80; height: width
        property variant source: sourceImage
        mesh: GridMesh { resolution: Qt.size(10, 10) }
        property real bend: 0.0
        property real minimize: 0.0
        property real side: 1.0
        SequentialAnimation on bend {
            loops: Animation.Infinite
            NumberAnimation { to: 1; duration: 700; easing.type: Easing.InOutSine }
            PauseAnimation { duration: 1300 }
            PauseAnimation { duration: 300 }
            NumberAnimation { to: 0; duration: 700; easing.type: Easing.InOutSine }
            PauseAnimation { duration: 1000 }
        }
        SequentialAnimation on minimize {
            loops: Animation.Infinite
            PauseAnimation { duration: 300 }
            NumberAnimation { to: 1; duration: 700; easing.type: Easing.InOutSine }
            PauseAnimation { duration: 1000 }
            NumberAnimation { to: 0; duration: 700; easing.type: Easing.InOutSine }
            PauseAnimation { duration: 1300 }
        }
        vertexShader: "
            uniform highp mat4 qt_Matrix;
            uniform highp float bend;
            uniform highp float minimize;
            uniform highp float side;
            uniform highp float width;
            uniform highp float height;
            attribute highp vec4 qt_Vertex;
            attribute highp vec2 qt_MultiTexCoord0;
            varying highp vec2 qt_TexCoord0;
            void main() {
                qt_TexCoord0 = qt_MultiTexCoord0;
                highp vec4 pos = qt_Vertex;
                pos.y = mix(qt_Vertex.y, height, minimize);
                highp float t = pos.y / height;
                t = (3. - 2. * t) * t * t;
                pos.x = mix(qt_Vertex.x, side * width, t * bend);
                gl_Position = qt_Matrix * pos;
            }"
    }
}
