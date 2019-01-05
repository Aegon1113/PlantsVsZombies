//
//  DaveShopViewController.swift
//  PlantsVsZombies
//
//  Created by Aclivn on 2018/11/20.
//  Copyright © 2018 Aclivn. All rights reserved.
//

import UIKit

var sunStrengthen = 0
var startSunAdd = 0
var shovelReturn = 0.0
//var hasCart = false
var money = 0

class DaveShopViewController: UIViewController {
    //record all tools' level and maxlevel
    var sunLevel = 0
    var startLevel = 0
    var shovelLevel = 0
    let maxLevel = 3
    
    //the detail buff
    let sunBuff = [5, 10, 15]
    let startBuff = [25, 50, 75]
    let shovelBuff = [0.2, 0.5, 1.0]
    
    //cost of per upgrade
    let moneyCost = [4000, 10000, 20000]
    
    @IBOutlet weak var sunCost: UIButton!
    @IBOutlet weak var startCost: UIButton!
    @IBOutlet weak var shovelCost: UIButton!
    @IBOutlet weak var moneyForShop: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sunCost.setTitle(String(moneyCost[0]), for: .normal)
        startCost.setTitle(String(moneyCost[0]), for: .normal)
        shovelCost.setTitle(String(moneyCost[0]), for: .normal)
        moneyForShop.text = String(money)
        // Do any additional setup after loading the view.
    }
    //sun+: sunflower produce more sun
    @IBAction func strengthenSun(_ sender: UIButton) {
        if (sunLevel>=maxLevel){
            return
        }
        if (money >= moneyCost[sunLevel]){
            money -= moneyCost[sunLevel]
            sunStrengthen = sunBuff[sunLevel]
            sunLevel += 1
        }
        if sunLevel>=maxLevel{
            sunCost.setTitle("MAX", for: .normal)
        }
        else {
            sunCost.setTitle(String(moneyCost[sunLevel]), for: .normal)
        }
        moneyForShop.text = String(money)
        printBuffInfo()
    }
    //start with more sun
    @IBAction func startWithMoreSun(_ sender: UIButton) {
        if startLevel >= maxLevel{
            return
        }
        if money >= moneyCost[startLevel]{
            money -= moneyCost[startLevel]
            startSunAdd = startBuff[startLevel]
            startLevel += 1
        }
        if startLevel >= maxLevel{
            startCost.setTitle("MAX", for: .normal)
        }
        else {
            startCost.setTitle(String(moneyCost[startLevel]), for: .normal)
        }
        moneyForShop.text = String(money)
        printBuffInfo()
    }
    //shovel: return sun
    @IBAction func returnMoreSun(_ sender: UIButton) {
        if shovelLevel >= maxLevel{
            return
        }
        if money >= moneyCost[shovelLevel]{
            money -= moneyCost[shovelLevel]
            shovelReturn = shovelBuff[shovelLevel]
            shovelLevel += 1
        }
        if shovelLevel >= maxLevel{
            shovelCost.setTitle("MAX", for: .normal)
        }
        else {
            shovelCost.setTitle(String(moneyCost[shovelLevel]), for: .normal)
        }
        moneyForShop.text = String(money)
        printBuffInfo()
    }
    //money: more money
    //  earn 2000 per level
    //  get 10000
    @IBAction func addMoney(_ sender: UIButton) {
        money += 10000
        moneyForShop.text = String(money)
    }
    //cart:
    
    func printBuffInfo(){
        print("---------------------------")
        print("sunbuff:"+String(sunStrengthen))
        print("startbuff:"+String(startSunAdd))
        print("shovelbuff:"+String(shovelReturn))
        print("---------------------------")
    }
    //
    //
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
