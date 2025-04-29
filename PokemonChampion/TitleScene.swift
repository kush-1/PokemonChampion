//
//  TitleScene.swift
//  PokemonChampion
//
//  Created by Kush Desai on 4/29/25.
//

import SpriteKit

class TitleScene: SKScene {

    override func didMove(to view: SKView) {
        setupBackground()
        setupTitleLabel()
        setupSubtitleLabel()
        setupPlayButton()
    }

    func setupBackground() {
        // Classic bright blue background
        backgroundColor = SKColor(red: 0.4, green: 0.7, blue: 1.0, alpha: 1.0)
    }

    func setupTitleLabel() {
        let titleLabel = SKLabelNode(fontNamed: "Avenir-Black")
        titleLabel.text = "POKÉMON CHAMPION"
        titleLabel.fontSize = 60
        titleLabel.fontColor = SKColor.yellow
        titleLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.65)
        titleLabel.zPosition = 1
        titleLabel.horizontalAlignmentMode = .center
        titleLabel.verticalAlignmentMode = .center

        // Add a shadow outline effect
        let shadowLabel = SKLabelNode(fontNamed: "Avenir-Black")
        shadowLabel.text = titleLabel.text
        shadowLabel.fontSize = titleLabel.fontSize
        shadowLabel.fontColor = SKColor.black
        shadowLabel.position = CGPoint(x: titleLabel.position.x + 2, y: titleLabel.position.y - 2)
        shadowLabel.zPosition = 0

        addChild(shadowLabel)
        addChild(titleLabel)
    }

    func setupSubtitleLabel() {
        let subtitleLabel = SKLabelNode(fontNamed: "Avenir-Heavy")
        subtitleLabel.text = "Press Play to Begin!"
        subtitleLabel.fontSize = 30
        subtitleLabel.fontColor = SKColor.white
        subtitleLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.55)
        subtitleLabel.zPosition = 1
        addChild(subtitleLabel)
    }

    func setupPlayButton() {
        let playButton = SKLabelNode(fontNamed: "Avenir-Black")
        playButton.text = "▶︎ PLAY"
        playButton.fontSize = 50
        playButton.fontColor = SKColor.red
        playButton.position = CGPoint(x: size.width / 2, y: size.height * 0.35)
        playButton.name = "playButton"
        playButton.zPosition = 1
        addChild(playButton)

        // Pulse animation for play button
        let pulseUp = SKAction.scale(to: 1.1, duration: 0.5)
        let pulseDown = SKAction.scale(to: 1.0, duration: 0.5)
        let pulseSequence = SKAction.sequence([pulseUp, pulseDown])
        let pulseForever = SKAction.repeatForever(pulseSequence)
        playButton.run(pulseForever)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNode = atPoint(location)

        if touchedNode.name == "playButton" {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: .fade(withDuration: 1.0))
            }
        }
    }
}
