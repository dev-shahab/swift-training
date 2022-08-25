//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Dev on 24/08/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift
class CategoryTableViewController: UITableViewController {

    
    let realm = try? Realm()
    
    var categoryArray: Results<Category>?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

    }

    
    //MARK: - TableView DATA Source Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoryArray?[indexPath.row].name ?? "No Category Exists"
        return cell
    }
    
    
    
    //MARK: - Data Manipulation Methods
    
    
    func saveData(category:Category){
        print("Challa2")
        do{
            try realm?.write {
                print("Category: ", category.name)
                realm?.add(category)
            }
            
        } catch{
            print("Error Jo Agyaa: \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadData(){
        
        categoryArray = realm?.objects(Category.self)
        tableView.reloadData()
    }
    
    //MARK: - Add Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        
        
        alert.addTextField { text in
            textField = text
            text.placeholder = "Please Type Something"
        }
        
        let action = UIAlertAction(title: "Add", style: .default) {[weak self] text in
            
            
            guard let _weakSelf = self else {
                return
            }
            //print("Text: \(textField.text!)")
            let category = Category()
            category.name = textField.text!
            print("Challa")
            _weakSelf.saveData(category: category)
                
        }
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    
    //MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        performSegue(withIdentifier: "ToToDoList", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            
            destinationVC.selectedCategory = categoryArray?[indexPath.row]
            
        }
    }
    
}
