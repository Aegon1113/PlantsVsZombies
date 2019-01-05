//
//  CardCell.swift
//  PlantsVsZombies
//
//  Created by Aclivn on 2019/1/4.
//  Copyright © 2019 Aclivn. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var plantIntro: UILabel!
    @IBOutlet weak var plantName: UILabel!
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var plantCost: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
