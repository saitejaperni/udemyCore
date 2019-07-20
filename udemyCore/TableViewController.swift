//
//  ViewController.swift
//  udemyCore
//
//  Created by Nevexa Digital on 20/07/19.
//  Copyright © 2019 pratice. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let itemsArray = ["one", "Two", "Three"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
        cell.textLabel?.text = itemsArray[indexPath.row]
        //cell.textLabel?.text = "Hello"
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        if ( tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark)
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
           tableView.deselectRow(at: indexPath, animated: true)
    }


}

