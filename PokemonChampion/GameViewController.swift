//
//  GameViewController.swift
//  PokemonChampion
//
//  Created by Kush Desai on 4/28/25.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as? SKView {
            // Load the Title Scene
            let scene = TitleScene(size: view.bounds.size)
            scene.scaleMode = .aspectFill

            // Present the scene
            view.presentScene(scene)

            view.ignoresSiblingOrder = true

            // Optional: Show debug stats during development
            view.showsFPS = true
            view.showsNodeCount = true
            // view.showsPhysics = true  // Uncomment if you want to see physics bodies
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        // Only support landscape mode for Pokémon-style top-down games
        return .landscape
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
