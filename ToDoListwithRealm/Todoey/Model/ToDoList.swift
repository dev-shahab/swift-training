//
//  ToDoList.swift
//  Todoey
//
//  Created by Dev on 25/08/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class ToDoList: Object{
    @objc dynamic var title:String = ""
    @objc dynamic var isChecked:Bool = false
    @objc dynamic var dateCreated:Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "lists")
}
