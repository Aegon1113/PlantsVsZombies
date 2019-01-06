//
//  DaveShopViewController.swift
//  PlantsVsZombies
//
//  Created by Aclivn on 2018/11/20.
//  Copyright © 2018 Aclivn. All rights reserved.
//

import UIKit

//var sunStrengthen:Int = 0
//var startSunAdd:Int = 0
//var shovelReturn = 0.0
//var hasCart = false
//var money = 0

class DaveShopViewController: UIViewController {
    //record all tools' level and maxlevel
    //var sunLevel = 0
    //var startLevel = 0
    //var shovelLevel = 0
    let maxLevel = 4
    
    //the detail buff
    let sunBuff = [0, 5, 10, 15]
    let startBuff = [0, 25, 50, 75]
    let shovelBuff = [0, 0.2, 0.5, 1.0]
    
    //cost of per upgrade
    let moneyCost = [4000, 10000, 20000]
    
    @IBOutlet weak var sunCost: UIButton!
    @IBOutlet weak var startCost: UIButton!
    @IBOutlet weak var shovelCost: UIButton!
    @IBOutlet weak var moneyForShop: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sunCost.setTitle(String(moneyCost[sunLevel]), for: .normal)
        startCost.setTitle(String(moneyCost[startLevel]), for: .normal)
        shovelCost.setTitle(String(moneyCost[shovelLevel]), for: .normal)
        moneyForShop.text = String(money)
        // Do any additional setup after loading the view.
    }
    //sun+: sunflower produce more sun
    @IBAction func strengthenSun(_ sender: UIButton) {
        if (sunLevel>=maxLevel-1){
            return
        }
        if (money >= moneyCost[sunLevel]){
            money -= moneyCost[sunLevel]
            sunLevel += 1
            sunStrengthen = sunBuff[sunLevel]
        }
        if sunLevel>=maxLevel-1{
            sunCost.setTitle("MAX", for: .normal)
        }
        else {
            sunCost.setTitle(String(moneyCost[sunLevel]), for: .normal)
        }
        moneyForShop.text = String(money)
        userDefault.set(money,forKey:"money")
        userDefault.integer(forKey: "money")
        userDefault.set(sunStrengthen,forKey:"sunStrength")
        userDefault.set(sunLevel,forKey:"sunLevel")
        userDefault.integer(forKey: "sunStrength")
        userDefault.integer(forKey: "sunLevel")
        printBuffInfo()
    }
    //start with more sun
    @IBAction func startWithMoreSun(_ sender: UIButton) {
        if startLevel >= maxLevel-1{
            return
        }
        if money >= moneyCost[startLevel]{
            money -= moneyCost[startLevel]
            startLevel += 1
            startSunAdd = startBuff[startLevel]
        }
        if startLevel >= maxLevel-1{
            startCost.setTitle("MAX", for: .normal)
        }
        else {
            startCost.setTitle(String(moneyCost[startLevel]), for: .normal)
        }
        moneyForShop.text = String(money)
        userDefault.set(startSunAdd,forKey:"startSunAdd")
        print(startSunAdd)
        userDefault.set(startLevel,forKey:"startLevel")
        userDefault.integer(forKey: "startSunAdd")
        userDefault.integer(forKey: "startLevel")
        userDefault.set(money,forKey:"money")
        userDefault.integer(forKey: "money")
        printBuffInfo()
    }
    //shovel: return sun
    @IBAction func returnMoreSun(_ sender: UIButton) {
        if shovelLevel >= maxLevel-1{
            return
        }
        if money >= moneyCost[shovelLevel]{
            money -= moneyCost[shovelLevel]
            shovelLevel += 1
            shovelReturn = shovelBuff[shovelLevel]
        }
        if shovelLevel >= maxLevel-1{
            shovelCost.setTitle("MAX", for: .normal)
        }
        else {
            shovelCost.setTitle(String(moneyCost[shovelLevel]), for: .normal)
        }
        moneyForShop.text = String(money)
        userDefault.set(shovelBuff,forKey:"shovelBuff")
        userDefault.double(forKey: "shovelLevel")
        userDefault.set(shovelLevel,forKey:"shovelLevel")
        userDefault.integer(forKey: "shovelLevel")
        userDefault.set(money,forKey:"money")
        userDefault.integer(forKey: "money")
        printBuffInfo()
    }
    //money: more money
    //  earn 2000 per level
    //  get 10000
    @IBAction func addMoney(_ sender: UIButton) {
        money += 10000
        moneyForShop.text = String(money)
        userDefault.set(money,forKey:"money")
        userDefault.integer(forKey: "money")
    }
    //cart:
    
    func printBuffInfo(){
        print("---------------------------")
        print("sunbuff:"+String(sunStrengthen))
        print("startbuff:"+String(startSunAdd))
        print("shovelbuff:"+String(shovelReturn))
        print("---------------------------")
    }
    
    //override func upda
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
