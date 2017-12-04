//
//  TableVIewAbstraction.swift
//  TableViewAbstraction
//
//  Created by Matthew Harrilal on 12/4/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

// The type alias represents the instantiation of the table view as well as the index path that returns the cell just so we dont have to keep typing this because then we can just have the alias here
typealias TableCellCallBack = (UITableView, IndexPath) -> UITableViewCell

// We are making a class that takes in a generic and inherits from nsobject as well as the uitableview data source therefore this class is of the type uitable view so we can use this
class TableViewDataSource<Item>: NSObject, UITableViewDataSource {
    
    // making an array of the item that the user passes in
    var items: [Item]
    
    // Instantiate a new cell
    var configureCell: TableCellCallBack?
    
    
    // Instantiating the array of the generic because you each instantiation is going to have a different array containing the data
    init(items: [Item]) {
        self.items = items
    }
    
    // This is going to be static because you are always going to want one section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // The number of cells you want to returnis dependent on the count of the items array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let configureCell = configureCell else {
            precondition(false, "You have not configured a cell yet you have to pass in a cell")
        }
        // Return the cell that has been configured for the table view as well as the index path
        return configureCell(tableView, indexPath)
    }
}

