//
//  GroceriesTableViewController.swift
//  TableViewAbstraction
//
//  Created by Matthew Harrilal on 12/4/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

class DisplayGroceriesTableViewController: UITableViewController {
    //The whole point of this file is that we are going to be using a layer of abstraction so we dont have to write all the code ourself
    
    var nameOfGrocery = ["Matthew", "Harrilal", "Justin"]
    var dataSource = TableViewDataSource(items: [String]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // As the name explains we are going to be using the data source and what the data source and that can be thought of as where the single source of truth and we are setting the single source of truth to the data source variable we have created
        
        // Such as the functions numeber of rows in section as well as the cell for row at function we are setting the single source of truth to the custom way we configured it as oppose to the default way
        tableView.dataSource = dataSource
        dataSource.items = nameOfGrocery
        
        dataSource.configureCell = { (tableView, indexPath) -> UITableViewCell in
            // We do not have to account for the index path because the abstraction code we have written already takes care of that for us
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            let name = self.nameOfGrocery[indexPath.row]
            cell?.textLabel?.text = name
            return cell!
            
        }
        print("This is the data source : \(dataSource.items)")
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // So basically we are saying for this instantiation of the table view we are going to use an array of strings to display on the table view cells
}
