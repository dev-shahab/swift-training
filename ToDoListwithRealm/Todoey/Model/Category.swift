//
//  Category.swift
//  Todoey
//
//  Created by Dev on 25/08/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

import RealmSwift

class Category: Object{
    @objc dynamic var name:String = ""
    
    let lists = List<ToDoList>()
}

