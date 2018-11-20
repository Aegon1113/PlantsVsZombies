//
//  WikiChoiceViewController.swift
//  PlantsVsZombies
//
//  Created by Aclivn on 2018/11/20.
//  Copyright © 2018 Aclivn. All rights reserved.
//

import UIKit

class WikiChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func wikiChoiceUnwindSegue(unwindSegue: UIStoryboardSegue){
        
    }
    
    @IBAction func jumpToPlants(_ sender: UITapGestureRecognizer) {
        let vc = WikiViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
