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
    case FadeIn
}

protocol RPAnimatedTableDelegate {
//    func animateTable(#animatedTableViewController:RPAnimatedTableViewController, animatedType type: RPAnimatedTableType)
}

public class RPTableAnimation:NSObject {
    var tableView = UITableView()
    
    var tableHeight: CGFloat = 0
    var delegate: RPAnimatedTableDelegate?
    
    func animateTable(#animatedTableViewController:RPAnimatedTableViewController, animatedType type: RPAnimatedTableType) {
        
        tableView = animatedTableViewController.tableView
        tableHeight = tableView.bounds.size.height
        startAnimation(animatedType: type)
    }
    
    private func startAnimation(#animatedType: RPAnimatedTableType) {
        tableView.reloadData()
        let cells = tableView.visibleCells()
        
        for cell in cells {
            if let cell = cell as? UITableViewCell {
                stateBeforeAnimation(animatedCell: cell, animatedType: animatedType)
            }
        }
        
        for(index, cell) in enumerate(cells) {
            
            if let cell = cell as? UITableViewCell {
                stateAfterAnimation(animatedCell: cell, animatedType: animatedType, index: index)
            }
        }
        
    }
    
    private func stateBeforeAnimation(#animatedCell: UITableViewCell, animatedType: RPAnimatedTableType) {
        switch animatedType {
        case .Spring:
            animatedCell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        case .FadeIn:
            animatedCell.transform = CGAffineTransformMakeTranslation(0, animatedCell.frame.size.height / 3)
            animatedCell.layer.opacity = 0
        default:
            break
        }
        
    }
    
    private func stateAfterAnimation(#animatedCell: UITableViewCell, animatedType: RPAnimatedTableType, index: Int) {
        switch animatedType {
        case .Spring:
            let duration: NSTimeInterval = 1.5
            
            UIView.animateWithDuration(
                1.5,
                delay: 0.05 * Double(index),
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: nil,
                animations: {
                    animatedCell.transform = CGAffineTransformMakeTranslation(0, 0)
                },
                completion: nil
            )
            
        case .FadeIn:
            let duration: NSTimeInterval = 0.5
            
            UIView.animateWithDuration(
                duration,
                delay: 0.05 * Double(index),
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: nil,
                animations: {
                    animatedCell.transform = CGAffineTransformMakeTranslation(0, 0)
                    animatedCell.layer.opacity = 1.0
                },
                completion: nil
            )
            
        default:
            break
        }
    }
}