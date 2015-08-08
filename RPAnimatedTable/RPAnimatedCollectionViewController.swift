//
//  RPAnimatedCollectionViewController.swift
//  RPAnimatedTable
//
//  Created by naoyashiga on 2015/08/08.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import UIKit

struct RPAnimatedCollectionReuseId {
    static let cell = "RPAnimatedCollectionViewCell"
}

class RPAnimatedCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var animation = RPCollectionAnimation()
    var animatedType = RPAnimatedCollectionType.Spring
    
    private var cellWidth:CGFloat = 0.0
    private var cellHeight:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellWidth = view.bounds.width / 2
        cellHeight = view.bounds.width / 2

        collectionView?.applyCellNib(cellNibName: RPAnimatedCollectionReuseId.cell)
        sampleAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        sampleAnimation()
        
    }
    
    override func viewWillAppear(animated: Bool) {
//        animation.animateCollection(animatedCollectionView: collectionView!, animatedType: animatedType)
//        animation.animateCollection(animatedCollectionViewController: self, animatedType: animatedType)
        
//        sampleAnimation()
    }
    
    func sampleAnimation() {
        collectionView!.reloadData()
        let cells = collectionView!.visibleCells()
        let collectionHeight = collectionView!.bounds.size.height
        
        
        for cell in cells {
            if let cell = cell as? UICollectionViewCell {
                cell.transform = CGAffineTransformMakeTranslation(0, collectionHeight)
            }
        }
        
        for(index, cell) in enumerate(cells) {
            
            if let cell = cell as? UICollectionViewCell {
                let duration: NSTimeInterval = 1.5
                
                UIView.animateWithDuration(
                    1.5,
                    delay: 0.05 * Double(index),
                    usingSpringWithDamping: 0.8,
                    initialSpringVelocity: 0,
                    options: nil,
                    animations: {
                        cell.transform = CGAffineTransformMakeTranslation(0, 0);
                    },
                    completion: nil
                )
            }
        }
        
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(RPAnimatedCollectionReuseId.cell, forIndexPath: indexPath) as! RPAnimatedCollectionViewCell
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
