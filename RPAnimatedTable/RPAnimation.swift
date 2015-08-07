//
//  RPAnimation.swift
//  RPAnimatedTable
//
//  Created by naoyashiga on 2015/08/07.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import Foundation
import UIKit

enum RPAnimatedTableType {
    case Spring
    case MoveTop
}

protocol RPAnimatedTableDelegate {
//    func animateTable(#animatedTableViewController:RPAnimatedTableViewController, animatedType type: RPAnimatedTableType)
}

public class RPAnimation:NSObject {
    var tableView = UITableView()
    var delegate: RPAnimatedTableDelegate?
    
    func animateTable(#animatedTableViewController:RPAnimatedTableViewController, animatedType type: RPAnimatedTableType) {
        
        tableView = animatedTableViewController.tableView
        
        switch type {
        case .Spring:
            spring()
        case .MoveTop:
            moveTopTable()
        default:
            moveTopTable()
        }
    }
    
    private func spring() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells()
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell = i as! UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell = a as! UITableViewCell
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: nil, animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
    }
    
    private func moveTopTable () {
        tableView.reloadData()
        
        let cells = tableView.visibleCells()
        let tableHeight: CGFloat = tableView.bounds.size.height
        let duration: NSTimeInterval = 0.5
        
        for i in cells {
            let cell = i as! UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, cell.frame.size.height / 3)
            cell.layer.opacity = 0
        }
        
        var index = 0
        
        for a in cells {
            let cell = a as! UITableViewCell
            UIView.animateWithDuration(duration, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: nil, animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                cell.layer.opacity = 1.0
                }, completion: nil)
            
            index += 1
        }
    }
    
    
}