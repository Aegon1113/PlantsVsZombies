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
    public var plant: Plant
    public var plantPosition: CGPoint
    public var bulletCount: Int
    public var sunCount:Int
    public var zombieNum: Int
    
    init(columns:Int, rows:Int){
        self.columns = columns
        self.rows = rows
        occupied = false
        plant = Plant.Empty
        plantPosition = CGPoint(x:0,y:0)
        bulletCount = 0
        zombieNum = 0
        sunCount = 0
    }
    
    func isOccupied()->Bool{
        return occupied
    }
    
    func setPeashooter(plantPosition:CGPoint){
        occupied = true
        plant = Plant.Peashooter
        self.plantPosition = plantPosition
    }
    
    func setSunFlower(plantPosition:CGPoint){
        occupied = true
        plant = Plant.SunFlower
        self.plantPosition = plantPosition
    }
    
    func removerPlant(){
        occupied = false
        plant = Plant.Empty
        plantPosition = CGPoint(x:0,y:0)
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
