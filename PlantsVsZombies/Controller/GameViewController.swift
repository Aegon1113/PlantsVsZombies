//
//  GameViewController.swift
//  PlantVsZombie
//
//  Created by apple on 2018/11/13.
//  Copyright © 2018年 nju. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
         view.ignoresSiblingOrder = true
         
         view.showsFPS = true
         view.showsNodeCount = true         */
        let scene = GameScene(size: view.bounds.size)
        let skView = self.view as! SKView
        scene.scaleMode = .aspectFill
        
        //skView.showsPhysics = true
        skView.presentScene(scene)
        skView.showsNodeCount = true
        /*
        let scene = GameScene(size:view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
     */
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    @IBAction func exitGame(_ sender: UIButton) {
        exit(0)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
