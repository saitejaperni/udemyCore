//
//  ViewController.swift
//  udemyCore
//
//  Created by Nevexa Digital on 20/07/19.
//  Copyright © 2019 pratice. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var itemsArray = [items]()
    
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()

        let newitem = items()
        newitem.title = "One"
       // newitem.done = true
        itemsArray.append(newitem)
        
        let newitem2 = items()
        newitem.title = "Two"
        itemsArray.append(newitem2)
        
        let newitem3 = items()
        newitem.title = "Three"
        itemsArray.append(newitem3)
        
        if let items = defaults.array(forKey: "ToDoList") as? [items] {
               itemsArray = items
            
              }
        
        
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item  = itemsArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        
      /*  if(item.done == true)
        {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }*/
        //cell.textLabel?.text = "Hello"
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        itemsArray[indexPath.row].done = !itemsArray[indexPath.row].done
       /* if(itemsArray[indexPath.row].done == true){
            itemsArray[indexPath.row].done = false
        }else{
            itemsArray[indexPath.row].done = true
        }*/
        
        
       /*if ( tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark)
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
           tableView.deselectRow(at: indexPath, animated: true)
    }*/
    }

    @IBAction func addMoreButton(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New item", message: " ", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            
            let newitem = items()
            newitem.title = textField.text!
            //itemsArray.append(textField.text)
            self.itemsArray.append(newitem)
            self.defaults.setValue(self.itemsArray, forKey: "ToDoList")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "add the item name"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

