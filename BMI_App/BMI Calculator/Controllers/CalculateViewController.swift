//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightSliderChange: UISlider!
    
    @IBOutlet weak var weightSliderChange: UISlider!
    
    @IBOutlet weak var heightValLabel: UILabel!
    
    @IBOutlet weak var weightValLabel: UILabel!
    
    var height:Float = 1.5
    
    var weight: Int = 100
    
    var result = ""
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanger(_ sender: UISlider) {
        
        heightValLabel.text = String(format:"%.2f", heightSliderChange.value) + "m"
        
    
    }
    
    @IBAction func weightSliderChanger(_ sender: UISlider) {
        
        weightValLabel.text = String(format: "%.0f", weightSliderChange.value) + "Kg"
        
        
    }
    
    @IBAction func calculateMethod(_ sender: UIButton) {
        
        let height = heightSliderChange.value
        let weight = weightSliderChange.value
        
        calculatorBrain.calculateBMIVal(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.bmiColor = calculatorBrain.getBMIColor()
            
        }
    }
    
}

