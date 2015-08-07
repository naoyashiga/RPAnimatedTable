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
    
    private var cellWidth:CGFloat = 0.0
    private var cellHeight:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellWidth = view.bounds.width / 2
        cellHeight = view.bounds.width / 2

        collectionView?.applyCellNib(cellNibName: RPAnimatedCollectionReuseId.cell)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
