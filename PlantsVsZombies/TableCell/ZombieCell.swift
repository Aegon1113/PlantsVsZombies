//
//  ZombieCell.swift
//  PlantsVsZombies
//
//  Created by Aclivn on 2019/1/5.
//  Copyright © 2019 Aclivn. All rights reserved.
//

import UIKit

class ZombieCell: UITableViewCell {
    @IBOutlet weak var zombieName: UILabel!
    @IBOutlet weak var zombieIntro: UILabel!
    @IBOutlet weak var zombieImage: UIImageView!
    @IBOutlet weak var dangerDegree: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
