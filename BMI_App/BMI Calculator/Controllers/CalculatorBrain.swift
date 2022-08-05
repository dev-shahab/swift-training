//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Dev on 05/08/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmiValue:BMI?
    
    
    
    mutating func calculateBMIVal(height h: Float, weight w:Float){
        
        let bmValue = w / (h*h)
        
        if bmValue < 18.5{
            bmiValue = BMI(value: bmValue, advise: "Need to Eat More Pies", color: .blue)
        }
        else if bmValue < 24.9{
            bmiValue = BMI(value: bmValue, advise: "Fit Ghoray warga", color: .green)
        }
        else{
            bmiValue = BMI(value: bmValue, advise: "Moti/Motaya Katt khaya karr", color: .red)
        }
        //bmiValue = String(format:"%.1f", result)
        
    }
    
    func getBMIValue() -> String{
        
        return String(format: "%.1f", bmiValue?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmiValue?.advise ?? "Something Went Wrong"
    }
    
    func getBMIColor() -> UIColor{
        return bmiValue?.color ?? .black
    }
    
}
