import QtQuick 2.5
import QtQuick.Particles 2.0

Rectangle {
    id: root
    width: 400; height: 400
    color: "grey"

    ParticleSystem {
        id: particleSystem
    }

    ImageParticle {
        source: "assets/star.png"
        system: particleSystem
        colorVariation: 1.0
        rotation: 45
        rotationVariation: 30
        rotationVelocity: 0
        rotationVelocityVariation: 180
        entryEffect: ImageParticle.Scale
        alpha: 0.5
        alphaVariation: 0.4
    }

    Emitter {
        id: emitter
        anchors.fill: parent
        system: particleSystem
        lifeSpan: 4000
        size: 64
        endSize: 256
        sizeVariation: 32
    }
}
