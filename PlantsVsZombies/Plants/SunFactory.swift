//
//  File.swift
//  PlantsVsZombies
//
//  Created by Aclivn on 2019/1/5.
//  Copyright © 2019 Aclivn. All rights reserved.
//

import Foundation
import SpriteKit

var night:Bool = false

class SunFactory:SKScene{
    func randomSun()->CGPoint{
        switch(arc4random()%4) {
        case 0:
            return CGPoint(x:size.width*3/12,y:size.height*5/4)
            //break;
        case 1:
            return CGPoint(x:size.width*4/12,y:size.height*5/4)
            //break;
        case 2:
            return CGPoint(x:size.width*5/12,y:size.height*5/4)
            //break;
        case 3:
            return CGPoint(x:size.width*6/12,y:size.height*5/4)
            //break;
        default:
            return CGPoint(x:size.width*7/12,y:size.height*5/4)
            //break;
        }
    }
    func sunFactory(){
        let sun = Sun()
        sun.position = randomSun()
        sun.size = CGSize(width:71*size.width/1920*1.9,height:71*size.height/1080*1.9)
        
        sun.Action()
        addChild(sun)
        sun.name = "Sun"
        
        let sunMove = SKAction.move(to: CGPoint(x:sun.position.x,y:0), duration: 5)
        //let sunMove2 = SKAction.move(to: CGPoint(x:position.x,y:position.y-20), duration: 1.2)
        
        sun.run(sunMove)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(8)){
            sun.removeFromParent()
        }
    }
}
