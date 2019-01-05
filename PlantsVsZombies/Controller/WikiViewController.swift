//
//  WikiViewController.swift
//  PlantsVsZombies
//
//  Created by Aclivn on 2018/11/20.
//  Copyright © 2018 Aclivn. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController, UITableViewDataSource{
    
    var plantNames = ["向日葵",
                      "豌豆射手",
                      "冰冻射手",
                      "三枪射手",
                      "樱桃炸弹",
                      "窝瓜",
                      "双枪射手",
                      "食人花"]
    var sunCost = ["50",
                   "100",
                   "175",
                   "325",
                   "150",
                   "50",
                   "200",
                   "150"]
    var introduction = ["向日葵不能反击，每隔一段时间生产阳光",
                        "豌豆射手每次发射一个普通伤害的豌豆",
                        "冰冻射手每次发射一个造成双倍伤害的豌豆",
                        "三枪射手能一次发射三枚普通豌豆，攻击最近三路的敌人",
                        "樱桃炸弹爆炸时对四周的敌人造成巨大伤害",
                        "窝瓜对单个敌人造成巨大伤害",
                        "双枪射手一次发射两枚普通豌豆",
                        "食人花能吞噬两格内的僵尸，但需要大量时间消化"]
    var plantImages = ["SunFlower","Peashooter","SnowPea","Threepeater","CherryBomb","Squash","Repeater","Chomper"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(plantNames.count)
        return plantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let id = String(describing: plantcell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: "plantcell",for:indexPath)
        cell.imageView?.image = UIImage(named: plantImages[indexPath.row])
        cell.textLabel?.text = plantNames[indexPath.row]
        cell.detailTextLabel?.text = introduction[indexPath.row]
        cell.backgroundColor = UIColor.init(patternImage: UIImage(named: "wikibackground")! )
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
