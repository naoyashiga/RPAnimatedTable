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
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Table"
        case 1:
            return "Collection"
        default:
            return ""
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(menuReuseId.cell, forIndexPath: indexPath) as! MenuTableViewCell
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                cell.titleLabel.text = "Spring"
            case 1:
                cell.titleLabel.text = "FadeIn"
            default:
                cell.titleLabel.text = "None"
            }
            
        } else {
//            switch indexPath.row {
//            case 0:
//                cell.titleLabel.text = "Spring"
//            case 1:
//                cell.titleLabel.text = "MoveTop"
//            default:
//                cell.titleLabel.text = "None"
//            }
            
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.dequeueReusableCellWithIdentifier(menuReuseId.cell, forIndexPath: indexPath) as! MenuTableViewCell
        
        if indexPath.section == 0 {
            
            let vc = RPAnimatedTableViewController()
            
            switch indexPath.row {
            case 0:
                vc.animatedType = .Spring
            case 1:
                vc.animatedType = .FadeIn
            default:
                vc.animatedType = .Spring
            }
            
            navigationController?.pushViewController(vc, animated: true)
            
        } else {
            
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.itemSize = CGSize(width: view.frame.width, height: 200)
            collectionViewLayout.minimumInteritemSpacing = 1
            
            let vc = RPAnimatedCollectionViewController(collectionViewLayout: collectionViewLayout)
            
            switch indexPath.row {
            case 0:
                vc.animatedType = .Spring
            case 1:
                vc.animatedType = .FadeIn
            default:
                vc.animatedType = .Spring
            }
            
//            navigationController?.pushViewController(vc, animated: true)
            
        }

    }

}
