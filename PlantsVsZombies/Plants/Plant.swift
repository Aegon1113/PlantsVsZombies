//
//  Plant.swift
//  PlantsVsZombies
//
//  Created by Aclivn on 2018/12/1.
//  Copyright © 2018 Aclivn. All rights reserved.
//

import Foundation
import SpriteKit

class Peashooter:SKSpriteNode{
    private var plantHp:Int
    private var plantCost:Int
    private var fileName:String
    
    init() {
        
        plantHp = 30
        plantCost = 100
        fileName = "Peashooter"
        
        
        let dbAtlas = SKTextureAtlas(named: fileName+".atlas")
        
        let texture = dbAtlas.textureNamed(fileName)
        
        let size = texture.size()
 
        
        super.init(texture:texture,color:SKColor.white,size:size)
        
        self.name = "Peashooter"
        /*
        var tempName:String
        for i in 1...dbAtlas.textureNames.count-1 {
            
            tempName = String(format:fileName+"_%d",i)
            let dbTexture = dbAtlas.textureNamed(tempName)
            dbFrames.append( dbTexture )
        }
        self.run(SKAction.repeatForever(
            SKAction.animate(with:dbFrames, timePerFrame: 0.2)))
        */
    }
    
    func Action(){
        let dbAtlas = SKTextureAtlas(named: fileName+".atlas")
        
        var dbFrames = [SKTexture]()
        
        //let texture = dbAtlas.textureNamed(fileName)
        
        //let size = texture.size()
        
        var tempName:String
        for i in 1...dbAtlas.textureNames.count-1 {
            
            tempName = String(format:fileName+"_%d",i)
            let dbTexture = dbAtlas.textureNamed(tempName)
            dbFrames.append( dbTexture )
        }
        self.run(SKAction.repeatForever(
            SKAction.animate(with:dbFrames, timePerFrame: 0.2)))
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
