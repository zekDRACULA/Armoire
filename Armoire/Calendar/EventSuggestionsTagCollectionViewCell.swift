//
//  EventSuggestionsTagCollectionViewCell.swift
//  Armoire
//
//  Created by Aditya on 23/05/24.
//

import UIKit

class EventSuggestionsTagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagButton: UIButton!
    
    @IBAction func tagButtonPressed(_ sender: UIButton) {
        
        sender.isSelected = true
    
        if sender.isSelected{
//            tagButton.layer.borderWidth = 1
//            tagButton.layer.cornerRadius = 14
//            tagButton.layer.borderColor = CGColor(red: 0.24, green: 0.24, blue: 0.24, alpha: 1)
            
            tagButton.tintColor = UIColor(cgColor: CGColor(red: 0.71, green: 0.64, blue: 0.57, alpha: 1))
        
        }
        
    }
}
