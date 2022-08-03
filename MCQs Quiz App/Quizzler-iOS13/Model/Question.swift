//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Dev on 02/08/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    
    var question:String = ""
    var options: [String]?
    var correctAnswer:String = ""
    
    init(q:String, a:[String], correctAnswer:String){
        self.question = q
        self.options = a
        self.correctAnswer = correctAnswer
    }
    
}
