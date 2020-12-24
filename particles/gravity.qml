import QtQuick 2.5
import QtQuick.Particles 2.0

Rectangle {
    id: root
    width: 480; height: 240
    color: "grey"

    ParticleSystem {
        id: particleSystem
    }

    ImageParticle {
        source: "assets/particle.png"
        system: particleSystem
        color: 'purple'
        colorVariation: 0.2
    }


    Emitter {
        id: emitter
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: 1; height: 20
        system: particleSystem
        emitRate: 40
        lifeSpan: 6400
        lifeSpanVariation: 400
        size: 32
        velocity: AngleDirection {
            angle: -90
            angleVariation: 25
            magnitude: 100
            magnitudeVariation: 25
        }
    }


    Gravity {
        width: 240; height: 240
        system: particleSystem
        magnitude: 50
        angle: 90
        Tracer {}
    }
}
