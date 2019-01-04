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
    private var haveZombie:Bool
    
    init() {
        
        plantHp = 30
        plantCost = 100
        fileName = "Peashooter"
        haveZombie = true
        
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
    
    func Attack(){
        if haveZombie{
            let bullet = SKSpriteNode(imageNamed: "PB0_L.png")
            bullet.position = self.position
            print("bullet:",bullet.position)
            addChild(bullet)
            
            let attack = SKAction.move(to: CGPoint(x:14*size.width/13,y:bullet.position.y), duration: 10)
            let attackDone = SKAction.removeFromParent()
            bullet.run(SKAction.sequence([attack,attackDone]))
            
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class SunFlower:SKSpriteNode{
    private var plantHp:Int
    private var plantCost:Int
    private var fileName:String
    private var haveZombie:Bool
    
    init() {
        
        plantHp = 30
        plantCost = 100
        fileName = "SunFlower"
        haveZombie = true
        
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
            SKAction.animate(with:dbFrames, timePerFrame: 0.1)))
        
    }
    
}

class Threepeater:SKSpriteNode{
    private var plantHp:Int
    private var plantCost:Int
    private var fileName:String
    private var haveZombie:Bool
    
    init() {
        
        plantHp = 30
        plantCost = 100
        fileName = "Threepeater"
        haveZombie = true
        
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
            SKAction.animate(with:dbFrames, timePerFrame: 0.1)))
        
    }
}

class SnowPea:SKSpriteNode{
    private var plantHp:Int
    private var plantCost:Int
    private var fileName:String
    private var haveZombie:Bool
    
    init() {
        
        plantHp = 30
        plantCost = 100
        fileName = "SnowPea"
        haveZombie = true
        
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
            SKAction.animate(with:dbFrames, timePerFrame: 0.1)))
        
    }
}

class CherryBomb:SKSpriteNode{
    private var plantHp:Int
    private var plantCost:Int
    private var fileName:String
    private var haveZombie:Bool
    
    init() {
        
        plantHp = 30
        plantCost = 100
        fileName = "CherryBomb"
        haveZombie = true
        
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
        self.run(SKAction.animate(with:dbFrames, timePerFrame: 0.3))
        
        /*
        let bomb = SKSpriteNode(imageNamed: "Boom_0.png")
        bomb.position = self.position
        bomb.size = self.size
        addChild(bomb)
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(0.3)) {
            bomb.removeFromParent()
        }
        */
        
    }
}
