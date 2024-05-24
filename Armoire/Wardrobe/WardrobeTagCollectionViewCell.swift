//
//  WardrobeTagCollectionViewCell.swift
//  Armoire
//
//  Created by Hitesh Rupani on 23/05/24.
//

import UIKit

class WardrobeTagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var tagButton: UIButton!
    
    var isActive: Bool = false
    @IBAction func tagButtonPressed(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if sender.isSelected{
            sender.tintColor = .red
        }
    }
    
    
}
