//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayTitleInAnimation()

       
    }
    
    
    func displayTitleInAnimation(){
        let textToBeAnimated = "⚡️FlashChat"
        titleLabel.text = ""
        var timer = Timer()
        var index = 1.0
        for i in textToBeAnimated{
            print(index*0.1)
            Timer.scheduledTimer(withTimeInterval: 0.1*index, repeats: false) {timer in
                
                self.titleLabel.text?.append(i)
                
            }
            index += 1.0
            
        }
    }

}
