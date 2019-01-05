//
//  ZombieTableViewController.swift
//  PlantsVsZombies
//
//  Created by Aclivn on 2019/1/5.
//  Copyright © 2019 Aclivn. All rights reserved.
//

import UIKit

class ZombieTableViewController: UITableViewController {
    var zombieNames = ["普通僵尸",
                       "路障僵尸",
                       "铁桶僵尸",
                       "撑杆跳僵尸",
                       "橄榄球僵尸",
                       "加刚特尔"]
    var introduction = ["生命值低、移速慢、攻击力低",
                        "拥有中等的生命值",
                        "拥有较高的生命值",
                        "可以翻越植物",
                        "生命值高，攻击力高，速度很快",
                        "生命值很高，攻击力极高，速度适中"]
    var dangerLevel = ["1",
                       "2",
                       "3",
                       "2",
                       "4",
                       "5"]
    var zombieImages = ["putongwiki",
                        "luzhangwiki",
                        "tietongwiki",
                        "chenggantiaowiki",
                        "ganlanqiuwiki",
                        "jiagangteerwiki"]
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return zombieNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ZombieCell",for:indexPath) as! ZombieCell
        cell.zombieIntro.text = introduction[indexPath.row]
        cell.zombieName.text = zombieNames[indexPath.row]
        cell.dangerDegree.text = "💀：" + dangerLevel[indexPath.row]
        cell.zombieImage.image = UIImage(named: zombieImages[indexPath.row])

        // Configure the cell...

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
