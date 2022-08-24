//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class ToDoListViewController: UITableViewController {

    
    //["Complete the current chapter at most", "Have Lunch", "Perform Namaz", "Go to Wahsroom"]
    //let defaults = UserDefaults.standard
    let dataFilepath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ToDoList.plist")
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var itemArray:[ToDoListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dataFilepath)
        loadData()
        
    }
    
    
//MARK: - Populating the Table view with Cells
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        if itemArray[indexPath.row].isChecked == true{
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }
        
        
        return cell
        
    }

    
    //MARK: - Selecting Rows
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        print(itemArray[indexPath.row])
        
        
        itemArray[indexPath.row].isChecked = !itemArray[indexPath.row].isChecked

        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
               
            }
            else{
                cell.accessoryType = .checkmark
            }
        }
 
        saveList()

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
                  //let toDoList = ToDoListModel(title: text, isChecked: false
                  
                  let toDoListModel = ToDoListModel(context: context)
                  toDoListModel.title = text
                  toDoListModel.isChecked = false
                  
                  self.itemArray.append(toDoListModel)
                  //self.defaults.set(self.itemArray, forKey: )
                  //self.defaults.set(self.itemArray, forKey: "ToDoListArray")
              }

              saveList()
               
          }
        
          alertView.addAction(action)
          
          present(alertView, animated: true)
          
      }
    
    
    func saveList(){
        
        do{
            try context.save()
    
        } catch {
            print("Error: \(error)")
        }
        tableView.reloadData()
    }
    
  
    func loadData(with request: NSFetchRequest<ToDoListModel> = ToDoListModel.fetchRequest()){
        
        do{
            itemArray = try context.fetch(request)
        } catch{
            print("Error: \(error)")
        }
        
        tableView.reloadData()
  }
}
//MARK: - Search Bar

extension ToDoListViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let request: NSFetchRequest<ToDoListModel> = ToDoListModel.fetchRequest()
        
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        
        let sortingDescriptor = NSSortDescriptor(key: "title", ascending: true)
        
        request.predicate = predicate
        request.sortDescriptors = [sortingDescriptor]
        
        loadData(with: request)
        
        
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
