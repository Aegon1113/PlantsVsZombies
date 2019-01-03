//
//  GameScene.swift
//  PlantVsZombie
//
//  Created by apple on 2018/11/13.
//  Copyright © 2018年 nju. All rights reserved.
//

import SpriteKit
import GameplayKit

enum Plant{
    case Empty
    case Peashooter
    case SunFlower
}
let PlantCategory:UInt32 = 1<<1
let BulletCategory:UInt32 = 1<<2
let ZombieCategory:UInt32 = 1<<3
let sunSum = SKLabelNode(fontNamed: "OpenSans-Bold")

class GameScene: SKScene,SKPhysicsContactDelegate {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var selectNode : SKNode?
    private var backgroundpositions : BackgroundPositions?
    private var bulletCount : Int?
    private var zombieHeight : CGFloat?
    private var plantHeight : CGFloat?
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
                case "SunFlower":
                    selectNode = temp
                    break;
                case "Sun":
                    let sun = Sun()
                    sun.position = temp.position
                    sun.size = CGSize(width:71*size.width/1920*1.9,height:71*size.height/1080*1.9)
                    
                    sun.Action()
                    addChild(sun)
                    
                    temp.removeFromParent()
                    
                    let collectSun = SKAction.move(to: CGPoint(x:size.width/4+15,y:size.height-30), duration: 1)
                    let collectDone = SKAction.removeFromParent()
                    sun.run(SKAction.sequence([collectSun,collectDone]))
                    
                    let intsunSum = (sunSum.text! as NSString).intValue + 25
                    let stringsunSum = "\(intsunSum)"
                    sunSum.text = stringsunSum
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
                let intsunSum = (sunSum.text! as NSString).intValue
                if intsunSum < 100 {
                    selectNode = nil
                    break;
                }
                let plant = Peashooter()
                sunSum.text = "\(intsunSum - 100)"
                
                print("hello Peashooter")
                plant.size = CGSize(width:71*size.width/1920*1.9,height:71*size.height/1080*1.9)
                var location = t.location(in: self)
                print(location)
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
                print(plant.position)
                plant.Action()
                //Attack(haveZombie:true,position:plant.position)
                //plant.Attack(haveZombie: true,position:plant.position,size:self.size)
                
                plant.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:plant.size.width/1.5,height:plant.size.height/2))
                plant.physicsBody?.categoryBitMask = PlantCategory
                plant.physicsBody?.collisionBitMask = 0
                plant.physicsBody?.contactTestBitMask = ZombieCategory
                
                addChild(plant)
                backgroundpositions?.backgroundPositions[Int(occupiedX.y)][Int(occupiedY.y)].setPeashooter(plantPosition:plant.position)
                selectNode = nil
                break;
            case "SunFlower":
                let intsunSum = (sunSum.text! as NSString).intValue
                print("suncount",intsunSum)
                if intsunSum < 50 {
                    selectNode = nil
                    break;
                }
                let plant = SunFlower()
                sunSum.text = "\(intsunSum-50)"
                print("hello SunFlower")
                plant.size = CGSize(width:71*size.width/1920*1.9,height:71*size.height/1080*1.9)
                var location = t.location(in: self)
                print(location)
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
                print(plant.position)
                plant.Action()
                //Attack(haveZombie:true,position:plant.position)
                //plant.Attack(haveZombie: true,position:plant.position,size:self.size)
                
                plant.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:plant.size.width/1.5,height:plant.size.height/2))
                plant.physicsBody?.categoryBitMask = PlantCategory
                plant.physicsBody?.collisionBitMask = 0
                plant.physicsBody?.contactTestBitMask = ZombieCategory
                
                addChild(plant)
                backgroundpositions?.backgroundPositions[Int(occupiedX.y)][Int(occupiedY.y)].setSunFlower(plantPosition:plant.position)
                selectNode = nil
            default:break;
            }
            
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
        
        for i in 1...9{
            for j in 1...5{
                if let temp = backgroundpositions?.backgroundPositions[i][j] as? BackgroundPosition {
                    if temp.plant == Plant.Peashooter && temp.zombieNum>0 {
                        if temp.bulletCount == 0 || bulletCount! - temp.bulletCount > 30{
                        Attack(haveZombie: true, position: (backgroundpositions?.backgroundPositions[i][j].plantPosition)!)
                            temp.bulletCount = bulletCount!
                        }
                    }
                    else if temp.plant == Plant.SunFlower {
                        if temp.sunCount > 300 {
                            produceSun(position: temp.plantPosition)
                            temp.sunCount = 0
                        }
                        temp.sunCount = temp.sunCount + 1
                    }
                }
            }
        }
        
        bulletCount = bulletCount! + 1
        

    }
    
    
    override func didMove(to view: SKView){
        //backgroundColor = SKColor.green
        bulletCount = 0
        zombieHeight = 144*size.height/1080*1.9
        plantHeight = 71*size.height/1080*1.9
        
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector.zero
        
        /*
        let sunSum = SKLabelNode(fontNamed: "OpenSans-Bold")
        sunSum.text = "0"
        sunSum.fontSize = 45
        sunSum.position = CGPoint(x:size.width/3,y:size.height*3/4)
        addChild(sunSum)
        */
        
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
        
        let toChooseBackground2 = SKSpriteNode(imageNamed: "SeedChooser_Background.png")
        toChooseBackground2.size = CGSize(width:80*size.width/1920*1.9,height:80*size.height/1080*1.9)
        toChooseBackground2.position = CGPoint(x:toChooseBackground2.size.width,y:toChooseBackground2.size.height*2)
        addChild(toChooseBackground2)
        
        let toChoosePlant2 = SKSpriteNode(imageNamed: "SunFlower.png")
        toChoosePlant2.size = CGSize(width:71*size.width/1920*1.9,height:71*size.height/1080*1.9)
        toChoosePlant2.name = "SunFlower"
        toChoosePlant2.position = CGPoint(x:toChooseBackground2.size.width,y:toChooseBackground2.size.height*2)
        addChild(toChoosePlant2)
        
        let toChooseBackground3 = SKSpriteNode(imageNamed: "SeedChooser_Background.png")
        toChooseBackground3.size = CGSize(width:80*size.width/1920*1.9,height:80*size.height/1080*1.9)
        toChooseBackground3.position = CGPoint(x:toChooseBackground3.size.width,y:toChooseBackground3.size.height*3)
        addChild(toChooseBackground3)
        
        let toChooseBackground4 = SKSpriteNode(imageNamed: "SeedChooser_Background.png")
        toChooseBackground4.size = CGSize(width:80*size.width/1920*1.9,height:80*size.height/1080*1.9)
        toChooseBackground4.position = CGPoint(x:toChooseBackground4.size.width,y:toChooseBackground4.size.height*4)
        addChild(toChooseBackground4)
        
        let toChooseBackground5 = SKSpriteNode(imageNamed: "SeedChooser_Background.png")
        toChooseBackground5.size = CGSize(width:80*size.width/1920*1.9,height:80*size.height/1080*1.9)
        toChooseBackground5.position = CGPoint(x:toChooseBackground5.size.width,y:toChooseBackground5.size.height*5)
        addChild(toChooseBackground5)
        
        
        
        /*
        let toChoosePlant1 = Peashooter()
        toChoosePlant1.size = CGSize(width:71*size.width/1920*1.9,height:71*size.height/1080*1.9)
        toChoosePlant1.position = CGPoint(x:toChooseBackground1.size.width,y:toChooseBackground1.size.height)
        //toChoosePlant1.name = "Peashooter"
        toChoosePlant1.Action()
        addChild(toChoosePlant1)
         */
        let sunBack = SKSpriteNode(imageNamed: "SunBack.png")
        print("sunBack",sunBack.size)
        sunBack.position = CGPoint(x:size.width/4,y:size.height-17)
        addChild(sunBack)
        
        sunSum.text = "500"
        sunSum.fontSize = 34
        sunSum.fontColor = UIColor.black
        sunSum.position = CGPoint(x:size.width/4+15,y:size.height-30)
        addChild(sunSum)
        
            
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addMonster),
                SKAction.wait(forDuration:5.0)
                ])
        ))
        
    }
    
    func random()-> CGFloat{
        return CGFloat(Float(arc4random())/0xFFFFFFFF)
    }
    
    func random(min:CGFloat,max:CGFloat)->CGFloat{
        return random()*(max-min)+min
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
            
            monster.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:monster.size.width/2,height:monster.size.height/2))
            monster.physicsBody?.categoryBitMask = ZombieCategory
            monster.physicsBody?.collisionBitMask = 0
            monster.physicsBody?.contactTestBitMask = BulletCategory
            
            
            addChild(monster)
            /*
            for i in 1...9{
                backgroundpositions?.backgroundPositions[i][Int(random.y)].zombieNum += 1
            }
            */
            let actionMove = SKAction.move(to: CGPoint(x:-monster.size.width/5,y:actualY), duration: 60)
            let actionMoveDone = SKAction.removeFromParent()
            monster.run(SKAction.sequence([actionMove,actionMoveDone]))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(3)){
                
                for i in 1...9{
                    self.backgroundpositions?.backgroundPositions[i][Int(random.y)].zombieNum += 1
                }
            }
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
            monster.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:monster.size.width/2,height:monster.size.height/2))
            monster.physicsBody?.categoryBitMask = ZombieCategory
            monster.physicsBody?.collisionBitMask = 0
            monster.physicsBody?.contactTestBitMask = BulletCategory
            
            addChild(monster)
            
            
            let actionMove = SKAction.move(to: CGPoint(x:-monster.size.width/5,y:actualY), duration: 60)
            let actionMoveDone = SKAction.removeFromParent()
            monster.run(SKAction.sequence([actionMove,actionMoveDone]))
            /*
            let time: TimeInterval = 3.0
            let delay = dispatch_time(dispatch_time_t(DispatchTime.now()), Int64(time * Double(NSEC_PER_SEC)))
            */
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(3)){
                
                for i in 1...9{
                    self.backgroundpositions?.backgroundPositions[i][Int(random.y)].zombieNum += 1
                }
            }
            
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
            return CGPoint(x:3.5*size.width/13,y:1)
        }
        else if 4*size.width/13<position.x && position.x<size.width*5/13{
            return CGPoint(x:4.5*size.width/13,y:2)
        }
        else if 5*size.width/13<position.x && position.x<size.width*6/13{
            return CGPoint(x:5.5*size.width/13,y:3)
        }
        else if 6*size.width/13<position.x && position.x<size.width*7/13{
            return CGPoint(x:6.5*size.width/13,y:4)
        }
        else if 7*size.width/13<position.x && position.x<size.width*8/13{
            return CGPoint(x:7.5*size.width/13,y:5)
        }
        else if 8*size.width/13<position.x && position.x<size.width*9/13{
            return CGPoint(x:8.5*size.width/13,y:6)
        }
        else if 9*size.width/13<position.x && position.x<size.width*10/13{
            return CGPoint(x:9.5*size.width/13,y:7)
        }
        else if 10*size.width/13<position.x && position.x<size.width*11/13{
            return CGPoint(x:10.5*size.width/13,y:8)
        }
        else if 11*size.width/13<position.x && position.x<size.width*12/13{
            return CGPoint(x:11.5*size.width/13,y:9)
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
        print(col,row)
        if let temp = backgroundpositions?.backgroundPositions[col][row] as? BackgroundPosition{
            return temp.isOccupied()
        }
       return true
    }
    
    func Attack(haveZombie:Bool,position:CGPoint){
        if haveZombie{
            let bullet = SKSpriteNode(imageNamed: "PB0_L.png")
            
            bullet.size = CGSize(width:bullet.size.width/1.5,height:bullet.size.height/2)
            bullet.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:bullet.size.width/1.5,height:bullet.size.height/2))
            bullet.physicsBody?.categoryBitMask = BulletCategory
            bullet.physicsBody?.collisionBitMask = 0
            bullet.physicsBody?.contactTestBitMask = ZombieCategory
            
            bullet.position = CGPoint(x:position.x+bullet.size.width,y:position.y+bullet.size.height/2)
            //print("bullet:",bullet.position)
            addChild(bullet)
            let attack = SKAction.move(to: CGPoint(x:14*size.width/13,y:bullet.position.y), duration: 6)
            let attackDone = SKAction.removeFromParent()
            bullet.run(SKAction.sequence([attack,attackDone]))
        }
    }
    
    /*
    func checkCollisions(){
        
    }
    
    override func didEvaluateActions() {
        checkCollisions()
    }
     */
    
    func zombieDie(zombie:SKNode){
        let positionY = Int(delectPositionY(position: zombie.position, height: zombieHeight!).y)
        for i in 1...9{
            backgroundpositions?.backgroundPositions[i][positionY].zombieNum -= 1
        }
    }
    
    func plantDie(plant:SKNode){
        let positionX = Int(delectPositionX(position: plant.position, height: plantHeight!).y)
        let positionY = Int(delectPositionY(position: plant.position, height: plantHeight!).y)
        print(positionX,positionY)
        backgroundpositions?.backgroundPositions[positionX][positionY].removerPlant()
    
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == BulletCategory && contact.bodyB.categoryBitMask == ZombieCategory) || (contact.bodyB.categoryBitMask == BulletCategory && contact.bodyA.categoryBitMask == ZombieCategory){
            print("zombie die")
            
            if contact.bodyA.categoryBitMask == ZombieCategory {
                zombieDie(zombie:contact.bodyA.node!)
            }
            else {
                zombieDie(zombie:contact.bodyB.node!)
            }
            
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
        }
        
        if (contact.bodyA.categoryBitMask == PlantCategory && contact.bodyB.categoryBitMask == ZombieCategory) || (contact.bodyB.categoryBitMask == PlantCategory && contact.bodyA.categoryBitMask == ZombieCategory){
            print("plant die")
            
            if contact.bodyA.categoryBitMask == PlantCategory {
                plantDie(plant:contact.bodyA.node!)
                contact.bodyA.node?.removeFromParent()
            }
            else {
                plantDie(plant:contact.bodyB.node!)
                contact.bodyB.node?.removeFromParent()
            }
            
        }
    }
    
    func produceSun(position:CGPoint){
        let sun = Sun()
        sun.position = position
        sun.size = CGSize(width:71*size.width/1920*1.9,height:71*size.height/1080*1.9)
        
        sun.Action()
        addChild(sun)
        sun.name = "Sun"
        
        let sunMove1 = SKAction.move(to: CGPoint(x:position.x,y:position.y+50), duration: 0.7)
        let sunMove2 = SKAction.move(to: CGPoint(x:position.x,y:position.y-20), duration: 1.2)
        
        sun.run(SKAction.sequence([sunMove1,sunMove2]))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(5)){
            sun.removeFromParent()
        }
        
    }
    
}


