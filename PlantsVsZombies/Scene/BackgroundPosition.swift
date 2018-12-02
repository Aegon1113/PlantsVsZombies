//
//  BackgroundPosition.swift
//  PlantsVsZombies
//
//  Created by Aclivn on 2018/12/2.
//  Copyright © 2018 Aclivn. All rights reserved.
//

import Foundation
import SpriteKit

class BackgroundPosition{
    public let columns: Int
    public let rows: Int
    private var occupied: Bool
    
    init(columns:Int, rows:Int){
        self.columns = columns
        self.rows = rows
        occupied = false
    }
    
    func isOccupied()->Bool{
        return occupied
    }
    
    func setPlant(){
        occupied = true
    }
}

class BackgroundPositions{
    public let columns: Int
    public let rows: Int
    public var backgroundPositions = [[BackgroundPosition]]()
    
    init(columns:Int, rows:Int){
        self.columns = columns
        self.rows = rows
        
        for i in 1...columns{
            var temp = [BackgroundPosition]()
            for j in 1...rows{
               temp.append(BackgroundPosition(columns: i, rows: j))
            }
            backgroundPositions.append(temp)
        }
        
        
    }
    
    
}
