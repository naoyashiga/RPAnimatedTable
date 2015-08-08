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

class RPAnimatedTableViewController: UITableViewController, RPAnimatedTableDelegate {
    var animation = RPTableAnimation()
    var animatedType = RPAnimatedTableType.Spring
    
    var colors: [String] = [
        "0D47A1",
        "1565C0",
        "1976D2",
        "1E88E5",
        "2196F3",
        "42A5F5",
        "64B5F6",
        "90CAF9",
        "BBDEFB",
        "E3F2FD"
    ]
    
    var tableCount = 30

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.applyCellNib(cellNibName: RPAnimatedTableReuseId.cell)
        
        animation.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(animated: Bool) {
        animation.animateTable(animatedTableViewController: self, animatedType: animatedType)
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCount
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(RPAnimatedTableReuseId.cell, forIndexPath: indexPath) as! RPAnimatedTableViewCell
        
        cell.titleLabel.text = "title \(indexPath.row)"
        
        let colorIndex = indexPath.row % colors.count
        cell.backgroundColor = UIColor.hexStr(colors[colorIndex], alpha: 1.0)

        return cell
    }
}
