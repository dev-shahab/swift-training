//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Dev on 24/08/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {

    var categoryArray:[Category] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

    }

    
    //MARK: - TableView DATA Source Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoryArray[indexPath.row].name
        return cell
    }
    
    
    
    //MARK: - Data Manipulation Methods
    
    
    func saveData(){
        
        do{
            try context.save()
            tableView.reloadData()
            
        } catch{
            print("Error: \(error)")
        }
    }
    
    func loadData(with request: NSFetchRequest<Category> = Category.fetchRequest()){
        
        do{
            categoryArray = try context.fetch(request)
            
        } catch{
            
            print("Error: \(error)")
            
        }
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
            
            
            
            //print("Text: \(textField.text!)")
            let category = Category(context: self!.context)
            category.name = textField.text!
            self!.categoryArray.append(category)
            self!.saveData()
                
        }
        alert.addAction(action)
        present(alert, animated: true)
        
    }
}
