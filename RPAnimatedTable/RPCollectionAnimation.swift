//
//  RPCollectionAnimation.swift
//  RPAnimatedTable
//
//  Created by naoyashiga on 2015/08/08.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import Foundation
import UIKit

enum RPAnimatedCollectionType {
    case Spring
    case FadeIn
}

protocol RPAnimatedCollectionDelegate {
}

public class RPCollectionAnimation:NSObject {
    var collectionView: UICollectionView?
//    var collectionView = UICollectionView(
    
    var collectionHeight: CGFloat = 0
//    var delegate: RPAnimatedTableDelegate?
    
//    func animateCollection(#animatedCollectionViewController: RPAnimatedCollectionViewController, animatedType type: RPAnimatedCollectionType) {
    func animateCollection(#animatedCollectionView:  UICollectionView, animatedType type: RPAnimatedCollectionType) {
        
//        collectionView = animatedCollectionViewController.collectionView!
        collectionView = animatedCollectionView
        collectionHeight = collectionView!.bounds.size.height
        startAnimation(animatedType: type)
    }
    
    private func startAnimation(#animatedType: RPAnimatedCollectionType) {
        collectionView!.reloadData()
        let cells = collectionView!.visibleCells()
        
        for cell in cells {
            if let cell = cell as? UICollectionViewCell {
                stateBeforeAnimation(animatedCell: cell, animatedType: animatedType)
            }
        }
        
        for(index, cell) in enumerate(cells) {
            
            if let cell = cell as? UICollectionViewCell {
                stateAfterAnimation(animatedCell: cell, animatedType: animatedType, index: index)
            }
        }
        
    }
    
    private func stateBeforeAnimation(#animatedCell: UICollectionViewCell, animatedType: RPAnimatedCollectionType) {
        switch animatedType {
        case .Spring:
            animatedCell.transform = CGAffineTransformMakeTranslation(0, collectionHeight)
        case .FadeIn:
            animatedCell.transform = CGAffineTransformMakeTranslation(0, animatedCell.frame.size.height / 3)
            animatedCell.layer.opacity = 0
        default:
            break
        }
        
    }
    
    private func stateAfterAnimation(#animatedCell: UICollectionViewCell, animatedType: RPAnimatedCollectionType, index: Int) {
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
                    animatedCell.transform = CGAffineTransformMakeTranslation(0, 0);
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