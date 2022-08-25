//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoListViewController: UITableViewController {

 
    var itemsContaineer: Results<ToDoList>?
    
    let realm = try! Realm()
    
    var selectedCategory:Category?{
        
        didSet{

            loadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
//MARK: - Populating the Table view with Cells

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Returing Rows")
        return itemsContaineer?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemsContaineer?[indexPath.row].title ?? "No Task Created"
        
        if itemsContaineer?[indexPath.row].isChecked == true{
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }
        
        
        return cell
        
    }

    
    //MARK: - Selecting Rows
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let item = itemsContaineer?[indexPath.row]{
            
            do{
                try realm.write {
                    item.isChecked = !item.isChecked
                }
            } catch {
                print("Error: \(error)")
            }
            tableView.reloadData()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
 
//MARK: - Add Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
          
          var textField = UITextField()
          let alertView = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
          
          alertView.addTextField { textFieldRef in
              textField.placeholder = "Type Something"
              textField = textFieldRef
              
          }
      
        let action = UIAlertAction(title: "Add", style: .default) { [self] action in
              
              if let text = textField.text{

                  if let currentCategory = selectedCategory{
                      
                      do{
                          try realm.write {
                              let newToDoList = ToDoList()
                              newToDoList.title = textField.text!
                              newToDoList.dateCreated = Date()
                              currentCategory.lists.append(newToDoList)
                              print("Success Adding to Database")
                              tableView.reloadData()
                          }
                      } catch{
                          print("Failed Saving to Database Error: \(error)")
                      }
                  }
                      
                  }
          }
        
          alertView.addAction(action)
          
          present(alertView, animated: true)
          
      }


    func loadData(){
        
        itemsContaineer = selectedCategory?.lists.sorted(byKeyPath: "title", ascending: true)
        
        tableView.reloadData()
  }
   
}

//MARK: - Search Bar

extension ToDoListViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       
        itemsContaineer = itemsContaineer?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        tableView.reloadData()
        
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadData()
            DispatchQueue.main.async {
                self.resignFirstResponder()
            }
            
            
        }
    }
}


