//
//  PlantTableViewController.swift
//  PlantsVsZombies
//
//  Created by Aclivn on 2019/1/4.
//  Copyright © 2019 Aclivn. All rights reserved.
//

import UIKit

class PlantTableViewController: UITableViewController {
    //datasource
    //plantname,introduction,picture
    var plantNames = ["向日葵",
                      "豌豆射手",
                      "冰冻射手",
                      "三枪射手",
                      "樱桃炸弹",
                      "窝瓜",
                      "食人花",
                      "土豆地雷",
                      "冰西瓜",
                      "坚果墙",
                      "双枪射手",
                      "西瓜投手",
                      "孪生向日葵"]
    var sunCost = ["50",
                   "100",
                   "175",
                   "325",
                   "150",
                   "50",
                   "150",
                   "25",
                   "200",
                   "50",
                   "200",
                   "300",
                   "150"]
    var introduction = ["每隔一段时间生产阳光",
                        "每次发射一颗普通伤害的豌豆",
                        "每次发射一颗双倍伤害的豌豆",
                        "每次发射三颗豌豆m，进攻三行的敌人",
                        "对四周的敌人造成巨大伤害",
                        "对单体造成巨大伤害",
                        "吞食两格距离内的敌人，需要较长时间消化",
                        "与敌人同归于尽，需要较长的部署时间",
                        "对群体产生巨量伤害,产生减速效果",
                        "无法反击，承受大量伤害",
                        "一次发射两颗普通豌豆",
                        "对群体造成大量伤害",
                        "种在普通向日葵上，一次产生两个阳光"]
    var plantImages = ["sunflowerwiki",
                       "Peashooterwiki",
                       "SnowPeawiki",
                       "Threepeaterwiki",
                       "CherryBombwiki",
                       "Squashwiki",
                       "Chomperwiki",
                       "Potatowiki",
                       "Freezemelonwiki",
                       "Peanutwiki",
                       "Repeaterwiki",
                       "Watermelonwiki",
                       "TwinSunflowerwiki"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(plantNames.count)
        return plantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let id = String(describing: CardCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell",for:indexPath) as! CardCell
        cell.plantIntro.text = introduction[indexPath.row]
        cell.plantName.text = plantNames[indexPath.row]
        cell.plantCost.text = "☀️：" + sunCost[indexPath.row]
        cell.plantImage.image = UIImage(named: plantImages[indexPath.row])
        //cell.contentView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
