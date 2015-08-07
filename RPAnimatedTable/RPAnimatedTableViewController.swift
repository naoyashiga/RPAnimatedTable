//
//  RPAnimatedTableViewController.swift
//  RPAnimatedTable
//
//  Created by naoyashiga on 2015/08/07.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import UIKit

struct RPAnimatedTableReuseId {
    static let cell = "RPAnimatedTableViewCell"
}

class RPAnimatedTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.applyCellNib(cellNibName: RPAnimatedTableReuseId.cell)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(RPAnimatedTableReuseId.cell, forIndexPath: indexPath) as! RPAnimatedTableViewCell
        
        cell.titleLabel.text = "title \(indexPath.row)"

        return cell
    }


}
