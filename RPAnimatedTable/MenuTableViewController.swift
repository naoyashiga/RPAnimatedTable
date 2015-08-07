//
//  MenuTableViewController.swift
//  RPAnimatedTable
//
//  Created by naoyashiga on 2015/08/07.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import UIKit

struct menuReuseId {
    static let cell = "MenuTableViewCell"
}

class MenuTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.applyCellNib(cellNibName: menuReuseId.cell)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(menuReuseId.cell, forIndexPath: indexPath) as! MenuTableViewCell
        
        cell.titleLabel.text = "title \(indexPath.row)"


        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.dequeueReusableCellWithIdentifier(menuReuseId.cell, forIndexPath: indexPath) as! MenuTableViewCell
        
        
        let vc = RPAnimatedTableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
