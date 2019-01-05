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
    func zombieFactory(){
        
    }
}
