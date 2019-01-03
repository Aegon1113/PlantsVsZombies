//
//  File.swift
//  PlantsVsZombies
//
//  Created by Aclivn on 2019/1/3.
//  Copyright © 2019 Aclivn. All rights reserved.
//

import Foundation
import SpriteKit

class Sun:SKSpriteNode{
    private var fileName: String
    
    init() {
        
        fileName = "Sun"
        //haveZombie = true
        
        let dbAtlas = SKTextureAtlas(named: fileName+".atlas")
        
        let texture = dbAtlas.textureNamed(fileName)
        
        let size = texture.size()
        
        
        
        super.init(texture:texture,color:SKColor.white,size:size)
        
        //self.name = "Peashooter"
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
}
