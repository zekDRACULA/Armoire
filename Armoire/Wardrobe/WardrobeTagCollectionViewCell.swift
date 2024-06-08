//
//  WardrobeTagCollectionViewCell.swift
//  Armoire
//
//  Created by Hitesh Rupani on 23/05/24.
//

import UIKit

protocol WardrobeTagCollectionViewCellDelegateProtocol {
    func selectTag(sender: WardrobeTagCollectionViewCell, indexPath: IndexPath)
}

class WardrobeTagCollectionViewCell: UICollectionViewCell {
    
    var isActive: Bool = false
    
    @IBOutlet var tagButton: UIButton!
    
    @IBAction func tagButtonPressed(_ sender: UIButton) {
        isActive.toggle()
        
        if isActive{
            tagButton.tintColor = UIColor(cgColor: CGColor(red: 1.0, green: 0.96, blue: 0.92, alpha: 1))
        }
        else{
            tagButton.tintColor = UIColor(cgColor: CGColor(red: 0.71, green: 0.64, blue: 0.57, alpha: 1))
        }
    }
}
