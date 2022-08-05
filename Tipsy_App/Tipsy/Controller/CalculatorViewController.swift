//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
   
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var totalBill = " "
    
    var tipCalculatorBrain = TipCalculatorBrain()

    @IBAction func tipChanged(_ sender: UIButton) {
        
        deSelectTipButtons()
        sender.isSelected = true
        var percent = sender.currentTitle
        percent?.removeLast()
        tipCalculatorBrain.setPercentage(Float(percent!)!)
    
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        
        let stepperValue = String(format: "%.0f", sender.value)
        splitNumberLabel.text = stepperValue
        tipCalculatorBrain.setSplitValue(Int(stepperValue)!)
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = Float(billTextField.text!) ?? 0.0
        tipCalculatorBrain.setBillAmount(bill)
        totalBill = tipCalculatorBrain.calculateTip()
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    func deSelectTipButtons(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            var destinationVC = segue.destination as! ResultViewController
            destinationVC.total = totalBill
            destinationVC.message = tipCalculatorBrain.generateMessage()
        }
        
    }
    
   
    
    
}

