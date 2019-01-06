//
//  File.swift
//  PlantsVsZombies
//
//  Created by Aclivn on 2019/1/5.
//  Copyright © 2019 Aclivn. All rights reserved.
//

import Foundation
import SpriteKit

class ZombieFactory:SKSpriteNode{
    func zombieRandom(height:CGFloat)->CGPoint{
        let ratio = CGFloat(size.height/600)
        let Random = CGFloat(arc4random()%5)
        return CGPoint(x:(25+Random*98)*ratio+height/2,y:Random+1)
    }
    func getRandom(height:CGFloat)->CGPoint{
        let ratio = CGFloat(size.height/600)
        let Random = CGFloat(arc4random()%5)
        return CGPoint(x:(25+Random*98)*ratio+height/2,y:Random+1)
    }
    func addMonster(){
        
        /*
         let monster = SKSpriteNode(imageNamed: "Zombie_0")
         let actualY = random(min:monster.size.height/2,max:size.height-monster.size.height/2)
         monster.position = CGPoint(x:size.width+monster.size.width/2,y:actualY)
         addChild(monster)
         //let actualDuration = random(min:CGFloat(2.0),max:CGFloat(4.0))
         let actionMove = SKAction.move(to: CGPoint(x:-monster.size.width/5,y:actualY), duration: 60)
         let actionMoveDone = SKAction.removeFromParent()
         monster.run(SKAction.sequence([actionMove,actionMoveDone]))
         */
        switch (arc4random()%2){
        case 0:
            let monster = Zombie()
            monster.size = CGSize(width:166*size.width/1920*1.9,height:144*size.height/1080*1.9)
            //let actualY = random(min:monster.size.height,max:size.height-monster.size.height)
            let random = getRandom(height:monster.size.height)
            let actualY = random.x
            print(actualY)
            monster.position = CGPoint(x:size.width+monster.size.width/2,y:actualY)
            //monster.zPosition = 20
            //monster.size = CGSize(width:166,height:144)
            
            monster.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:monster.size.height/2,height:monster.size.height))
            monster.physicsBody?.categoryBitMask = ZombieCategory
            monster.physicsBody?.collisionBitMask = 0
            monster.physicsBody?.contactTestBitMask = BulletCategory
            monster.Action()
            addChild(monster)
            monster.name = "Zombie"
            /*
             for i in 1...9{
             backgroundpositions?.backgroundPositions[i][Int(random.y)].zombieNum += 1
             }
             */
            let actionMove = SKAction.move(to: CGPoint(x:-monster.size.width/5,y:actualY), duration: 60)
            let actionMoveDone = SKAction.removeFromParent()
            monster.run(SKAction.sequence([actionMove,actionMoveDone]))
            /*
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(3)){
                
                for i in 1...9{
                    self.backgroundpositions?.backgroundPositions[i][Int(random.y)].zombieNum += 1
                }
            }
            */
            /*
             if monster.position.x < size.width {
             for i in 1...9{
             backgroundpositions?.backgroundPositions[i][Int(random.y)].zombieNum += 1
             }
             }
             */
            break;
            
        case 1:
            let monster = ConeheadZombie()
            monster.size = CGSize(width:166*size.width/1920*1.9,height:144*size.height/1080*1.9)
            //let actualY = random(min:monster.size.height,max:size.height-monster.size.height)
            let random = getRandom(height:monster.size.height)
            let actualY = random.x
            print(actualY)
            monster.position = CGPoint(x:size.width+monster.size.width/2,y:actualY)
            //monster.zPosition = 20
            //monster.size = CGSize(width:166,height:144)
            monster.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:monster.size.height/2,height:monster.size.height))
            monster.physicsBody?.categoryBitMask = ZombieCategory
            monster.physicsBody?.collisionBitMask = 0
            monster.physicsBody?.contactTestBitMask = BulletCategory
            monster.Action()
            addChild(monster)
            monster.name = "ConeheadZombie"
            
            
            let actionMove = SKAction.move(to: CGPoint(x:-monster.size.width/5,y:actualY), duration: 60)
            let actionMoveDone = SKAction.removeFromParent()
            monster.run(SKAction.sequence([actionMove,actionMoveDone]))
            /*
             let time: TimeInterval = 3.0
             let delay = dispatch_time(dispatch_time_t(DispatchTime.now()), Int64(time * Double(NSEC_PER_SEC)))
             */
            /*
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(3)){
                
                for i in 1...9{
                    self.backgroundpositions?.backgroundPositions[i][Int(random.y)].zombieNum += 1
                }
            }
            */
            /*
             if monster.position.x < size.width {
             for i in 1...9{
             backgroundpositions?.backgroundPositions[i][Int(random.y)].zombieNum += 1
             }
             }
             */
            break;
            
        default:break;
        }
    }
}
