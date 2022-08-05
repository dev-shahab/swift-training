//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Dev on 05/08/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    var total = "None"
    var message = " "
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total
        settingLabel.text = message
        
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
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
