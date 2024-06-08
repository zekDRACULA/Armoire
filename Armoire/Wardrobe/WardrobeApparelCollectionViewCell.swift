//
//  WardrobeApparelCollectionViewCell.swift
//  Armoire
//
//  Created by Hitesh Rupani on 24/05/24.
//

import UIKit
protocol WardrobeApparelCollectionViewCellDelegateProtocol {
    func toggleIsFavourite(sender: WardrobeApparelCollectionViewCell,indexPath: IndexPath)
    
}

class WardrobeApparelCollectionViewCell: UICollectionViewCell {
    
    var delegate: WardrobeApparelCollectionViewCellDelegateProtocol?
    
    var indexPath: IndexPath?
    
    @IBOutlet var apparelImage: UIImageView!
    
    @IBOutlet var heartButton: UIButton!

    @IBAction func heartButtonPressed(_ sender: UIButton) {
        delegate?.toggleIsFavourite(sender: self, indexPath: indexPath!)
        
//        let button = sender as! UIButton
        
//        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: [], animations: {
//            sender.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
////            sender.transform = CGAffineTransform.identity
//        }, completion: { _ in
//            sender.transform = CGAffineTransform.identity
//        })
    }
}
