//
//  GameScene.swift
//  PokemonChampion
//
//  Created by Kush Desai on 4/28/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()

    private var lastUpdateTime: TimeInterval = 0

    var player: SKSpriteNode!

    override func sceneDidLoad() {
        self.lastUpdateTime = 0
    }

    override func didMove(to view: SKView) {
        player = self.childNode(withName: "player") as? SKSpriteNode

        // check connected properly
        if player == nil {
            print("⚠️ Player node not found in .sks!")
        }

        backgroundColor = SKColor(red: 0.5, green: 0.8, blue: 0.5, alpha: 1.0)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)

        let touchedNode = atPoint(location)

        if let nodeName = touchedNode.name {
            print("Tapped: \(nodeName)")

            if nodeName == "pokemon1" {
                goToBattleScreen(with: "pokemon1")
            } else if nodeName == "pokemon2" {
                goToBattleScreen(with: "pokemon2")
            } else if nodeName == "pokemon3" {
                goToBattleScreen(with: "pokemon3")
            }
        }

        let moveAction = SKAction.move(to: location, duration: 0.5)
        player.run(moveAction)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // track dragging/touch movement here if needed later
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // end of touch actions
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        //  cancelled touch
    }

    // battle transition function
    func goToBattleScreen(with pokemonName: String) {
        print("Starting battle with \(pokemonName)")
        // replace with a new SKScene transition
    }
}
