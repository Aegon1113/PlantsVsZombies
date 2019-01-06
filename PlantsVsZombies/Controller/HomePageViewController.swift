//
//  HomePageViewController.swift
//  PlantsVsZombies
//
//  Created by Aclivn on 2018/11/20.
//  Copyright © 2018 Aclivn. All rights reserved.
//

import UIKit
import SpriteKit
var sunStrengthen:Int = 0
var startSunAdd:Int = 0
var shovelReturn = 0.0
//var hasCart = false
var money = 0
let userDefault = UserDefaults.standard
var sunLevel = 0
var startLevel = 0
var shovelLevel = 0
//let user = UserDefaults()
class HomePageViewController: UIViewController {

    override func viewDidLoad() {
    // Do any additional setup after loading the view.
        sunLevel = userDefault.integer(forKey: "sunLevel")
        startLevel = userDefault.integer(forKey: "startLevel")
        shovelLevel = userDefault.integer(forKey: "shovelLevel")
        sunStrengthen = userDefault.integer(forKey: "sunStrengthen")
        startSunAdd = userDefault.integer(forKey: "startSunAdd")
        shovelReturn = userDefault.double(forKey: "shovelReturn")
        money = userDefault.integer(forKey: "money")
       
    }
    
    @IBAction func homepageUnwindSegue(unwindSegue: UIStoryboardSegue){
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
