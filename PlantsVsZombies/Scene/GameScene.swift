//
//  GameScene.swift
//  PlantVsZombie
//
//  Created by apple on 2018/11/13.
//  Copyright © 2018年 nju. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var selectNode : SKNode?
    private var backgroundpositions : BackgroundPositions?
    /*
     override func didMove(to view: SKView) {
     
     // Get label node from scene and store it for use later
     self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
     if let label = self.label {
     label.alpha = 0.0
     label.run(SKAction.fadeIn(withDuration: 2.0))
     }
     
     // Create shape node to use during mouse interaction
     let w = (self.size.width + self.size.height) * 0.05
     self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
     
     if let spinnyNode = self.spinnyNode {
     spinnyNode.lineWidth = 2.5
     
     spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
     spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
     SKAction.fadeOut(withDuration: 0.5),
     SKAction.removeFromParent()]))
     }
     }
     */
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in (touches) {
            let location = t.location(in: self)
            //print("you fan ying")
            let node = nodes(at: location)
            for temp in (node){
                switch (temp.name) {
                case "Peashooter":
                    selectNode = temp
                    break;
                default: break;
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            switch (selectNode?.name){
            case "Peashooter":
                let plant = Peashooter()
                print("hello Peashooter")
                plant.size = CGSize(width:71*size.width/1920*1.9,height:71*size.height/1080*1.9)
                var location = t.location(in: self)
                var occupiedX:CGPoint
                occupiedX = delectPositionX(position: location, height: plant.size.height)
                var occupiedY:CGPoint
                occupiedY = delectPositionY(position: location, height: plant.size.height)
                location.x = occupiedX.x
                location.y = occupiedY.x
                if location.x == 0 || isOccupied(col: Int(occupiedX.y), row:Int(occupiedY.y) ){
                    break;
                }
                plant.position = CGPoint(x:location.x,y:location.y)
                plant.Action()
                addChild(plant)
                backgroundpositions?.backgroundPositions[Int(occupiedX.y)][Int(occupiedY.y)].setPlant()
                selectNode = nil
                break;
            default:break;
            }
            
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    let player = SKSpriteNode(imageNamed:"Zombie")
    override func didMove(to view: SKView){
        //backgroundColor = SKColor.green
        let background = SKSpriteNode(imageNamed: "PVZBackground_3.jpg")
        print(background.size.width,background.size.height)
        //background.size = CGSize(width:size.width,height:size.height)
        print(size.width,size.height)
        background.size = CGSize(width:background.size.width*size.height/background.size.height,height:size.height)
        background.position = CGPoint(x: background.size.width*0.5,y:size.height*0.5)
        print(background.size.width,background.size.height)
        //self.moveBackground(background: background,offset:background.size.width , timer:0.02)
        addChild(background)
        
        /*
        let peashooter = Peashooter()
        peashooter.size = CGSize(width:71*size.width/1920*1.9,height:71*size.height/1080*1.9)
        peashooter.position = CGPoint(x:peashooter.size.width,y:peashooter.size.height)
        addChild(peashooter)
        */
        
        backgroundpositions = BackgroundPositions(columns: 10, rows: 6)
        
        let toChooseBackground1 = SKSpriteNode(imageNamed: "SeedChooser_Background.png")
        toChooseBackground1.size = CGSize(width:80*size.width/1920*1.9,height:80*size.height/1080*1.9)
        toChooseBackground1.position = CGPoint(x:toChooseBackground1.size.width,y:toChooseBackground1.size.height)
        addChild(toChooseBackground1)
        
        
        let toChoosePlant1 = SKSpriteNode(imageNamed: "Peashooter.png")
        toChoosePlant1.size = CGSize(width:71*size.width/1920*1.9,height:71*size.height/1080*1.9)
        toChoosePlant1.name = "Peashooter"
        toChoosePlant1.position = CGPoint(x:toChooseBackground1.size.width,y:toChooseBackground1.size.height)
        addChild(toChoosePlant1)
        
        /*
        let toChoosePlant1 = Peashooter()
        toChoosePlant1.size = CGSize(width:71*size.width/1920*1.9,height:71*size.height/1080*1.9)
        toChoosePlant1.position = CGPoint(x:toChooseBackground1.size.width,y:toChooseBackground1.size.height)
        //toChoosePlant1.name = "Peashooter"
        toChoosePlant1.Action()
        addChild(toChoosePlant1)
         */
        
        
            
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addMonster),
                SKAction.wait(forDuration:20.0)
                ])
        ))
        
    }
    
    func random()-> CGFloat{
        return CGFloat(Float(arc4random())/0xFFFFFFFF)
    }
    
    func random(min:CGFloat,max:CGFloat)->CGFloat{
        return random()*(max-min)+min
    }
    
    func getRandom(height:CGFloat)->CGFloat{
        let ratio = CGFloat(size.height/600)
        let Random = CGFloat(arc4random()%5)
        return (25+Random*98)*ratio+height/2
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
            let actualY = getRandom(height:monster.size.height)
            print(actualY)
            monster.position = CGPoint(x:size.width+monster.size.width/2,y:actualY)
            //monster.zPosition = 20
            //monster.size = CGSize(width:166,height:144)
            addChild(monster)
            let actionMove = SKAction.move(to: CGPoint(x:-monster.size.width/5,y:actualY), duration: 60)
            let actionMoveDone = SKAction.removeFromParent()
            monster.run(SKAction.sequence([actionMove,actionMoveDone]))
            break;
            
        case 1:
            let monster = ConeheadZombie()
            monster.size = CGSize(width:166*size.width/1920*1.9,height:144*size.height/1080*1.9)
            //let actualY = random(min:monster.size.height,max:size.height-monster.size.height)
            let actualY = getRandom(height:monster.size.height)
            print(actualY)
            monster.position = CGPoint(x:size.width+monster.size.width/2,y:actualY)
            //monster.zPosition = 20
            //monster.size = CGSize(width:166,height:144)
            addChild(monster)
            let actionMove = SKAction.move(to: CGPoint(x:-monster.size.width/5,y:actualY), duration: 60)
            let actionMoveDone = SKAction.removeFromParent()
            monster.run(SKAction.sequence([actionMove,actionMoveDone]))
            break;
            
        default:break;
        }
    }
    
    func moveBackground(background:SKSpriteNode,offset:CGFloat,timer:CGFloat) {
        let moveZombieSprite = SKAction.moveBy(x: offset,y:0,duration: TimeInterval(timer*background.size.width))
        background.run(moveZombieSprite)
        let movePlantSprite = SKAction.moveBy(x: -offset, y:0,duration: TimeInterval(timer*background.size.width))
        background.run(movePlantSprite)
    }
    
    func getPostionY(height:CGFloat,num:Int)->CGFloat{
        let ratio = CGFloat(size.height/600)
        let Random = CGFloat(num*98+25)
        return Random*ratio+height/2
        
    }
    
    func delectPositionX(position:CGPoint,height:CGFloat)->CGPoint{
        if position.x<2*size.width/13 || position.x > size.width*12/13{
            return CGPoint(x:0,y:1)
        }
        else if 3*size.width/13<position.x && position.x<size.width*4/13{
            return CGPoint(x:3*size.width/13,y:1)
        }
        else if 4*size.width/13<position.x && position.x<size.width*5/13{
            return CGPoint(x:4*size.width/13,y:2)
        }
        else if 5*size.width/13<position.x && position.x<size.width*6/13{
            return CGPoint(x:5*size.width/13,y:3)
        }
        else if 6*size.width/13<position.x && position.x<size.width*7/13{
            return CGPoint(x:6*size.width/13,y:4)
        }
        else if 7*size.width/13<position.x && position.x<size.width*8/13{
            return CGPoint(x:7*size.width/13,y:5)
        }
        else if 8*size.width/13<position.x && position.x<size.width*9/13{
            return CGPoint(x:8*size.width/13,y:6)
        }
        else if 9*size.width/13<position.x && position.x<size.width*10/13{
            return CGPoint(x:9*size.width/13,y:7)
        }
        else if 10*size.width/13<position.x && position.x<size.width*11/13{
            return CGPoint(x:10*size.width/13,y:8)
        }
        else if 11*size.width/13<position.x && position.x<size.width*12/13{
            return CGPoint(x:11*size.width/13,y:9)
        }
        else {
            return CGPoint(x:0,y:1)
        }
    }
    
    func delectPositionY(position:CGPoint,height:CGFloat)->CGPoint{
        if 0 < position.y && position.y<getPostionY(height:height,num:0)+height/2{
            return CGPoint(x:getPostionY(height: height,num:0),y:1)
        }
        else if getPostionY(height:height,num:0)+height/2<position.y && position.y<getPostionY(height:height,num:1)+height/2{
            return CGPoint(x:getPostionY(height:height,num:1),y:2)
        }
        else if getPostionY(height:height,num:1)+height/2<position.y && position.y<getPostionY(height:height,num:2)+height/2{
            return CGPoint(x:getPostionY(height:height,num:2),y:3)
        }
        else if getPostionY(height:height,num:2)+height/2<position.y && position.y<getPostionY(height:height,num:3)+height/2{
            return CGPoint(x:getPostionY(height:height,num:3),y:4)
        }
        else if getPostionY(height:height,num:3)+height/2<position.y && position.y<getPostionY(height:height,num:4)+height/2{
            return CGPoint(x:getPostionY(height:height,num:4),y:5)
        }
        else {
            return CGPoint(x:0,y:1)
        }
    }
    
    func isOccupied(col:Int, row:Int)->Bool{
        if let temp = backgroundpositions?.backgroundPositions[col][row] as? BackgroundPosition{
            return temp.isOccupied()
        }
       return true
    }
    
    
}
