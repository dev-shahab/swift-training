//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


struct Story{
    var title:String = ""
    var choice1:String = ""
    var choice2:String = ""
    var choice1Destination = -1
    var choice2Destination = -1
    init(title:String, choice1:String, choice2:String, choice1Dest:Int, choice2Dest:Int){
        self.title = title
        self.choice1 = choice1
        self.choice2 = choice2
        self.choice1Destination = choice1Dest
        self.choice2Destination = choice2Dest
    }
}
