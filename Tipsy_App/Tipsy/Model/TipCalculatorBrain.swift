//
//  TipCalculatorBrain.swift
//  Tipsy
//
//  Created by Dev on 05/08/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation


struct TipCalculatorBrain{
    
    var percentage:Float = 10.0
    var bill:Float = 0.0
    var splits: Int = 2
    //var tipEachPerson:Float?
    
    mutating func calculateTip() -> String {
        
        let totalBill = (((percentage/100) * bill) + bill)
        print("Total Bill: ", totalBill)
        let tip = String(format: "%.2f", totalBill / Float(splits))
        print("Splits: ", splits)
        print("Bill: ", bill)
        return tip
    }
    
    mutating func setSplitValue(_ split:Int){
        self.splits = split
    }
    
    mutating func setBillAmount(_ bill:Float){
        self.bill = bill
    }
    
    mutating func setPercentage(_ percent:Float){
        self.percentage = percent
    }
    
    func generateMessage() -> String {
        let message = "Split between \(splits), with " + String(format: "%.0f", percentage) + "% tip"
        return message
    }
}
