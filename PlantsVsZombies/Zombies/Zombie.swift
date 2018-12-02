//
//  Zombie.swift
//  PlantVsZombie
//
//  Created by apple on 2018/11/13.
//  Copyright © 2018年 nju. All rights reserved.
//

import SpriteKit

enum State{
    case normal
    case debuff
    case died
}

class Zombie:SKSpriteNode{
    
    private var zombieHp:Int
    private var zombieSpeed:Int
    //private var zombiePositionX:Float
    //private var zombiePositionY:Float
    private var fileName:String
    private var zombieState:State
    
    
    init() {
        zombieHp = 100
        zombieSpeed = 60
        fileName = "Zombie"
        zombieState = State.normal
        
        let dbAtlas = SKTextureAtlas(named: fileName)
        
        var dbFrames = [SKTexture]()
        
        let texture = dbAtlas.textureNamed(fileName+".atlas")
        
        let size = texture.size()
        
        
        super.init(texture:texture,color:SKColor.white,size:size)

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

class ConeheadZombie:SKSpriteNode{
    
    private var zombieHp:Int
    private var zombieSpeed:Int
    //private var zombiePositionX:Float
    //private var zombiePositionY:Float
    private var fileName:String
    private var zombieState:State
    
    
    init() {
        
        zombieHp = 200
        zombieSpeed = 60
        fileName = "ConeheadZombie"
        zombieState = State.normal
        
        let dbAtlas = SKTextureAtlas(named: fileName+".atlas")
        
        var dbFrames = [SKTexture]()
        
        let texture = dbAtlas.textureNamed(fileName)
        
        let size = texture.size()
        
        
        super.init(texture:texture,color:SKColor.white,size:size)
        
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
