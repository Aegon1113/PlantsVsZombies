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
    var plantNames = ["向日葵","豌豆射手","冰冻射手","三枪射手","樱桃炸弹","窝瓜"]
    var sunCost = ["50","100","175","325","150","50"]
    var introduction = ["生产阳光","普通伤害的豌豆","双倍伤害的豌豆","进攻三行的豌豆","对四周造成巨大伤害","对单体造成巨大伤害"]
    var plantImages = ["sunflowerwiki","Peashooterwiki","SnowPeawiki","Threepeaterwiki","CherryBombwiki","Squashwiki"]
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
        cell.plantCost.text = sunCost[indexPath.row]
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
