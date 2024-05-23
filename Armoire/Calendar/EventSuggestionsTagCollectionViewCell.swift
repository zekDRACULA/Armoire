//
//  EventSuggestionsTagCollectionViewCell.swift
//  Armoire
//
//  Created by Aditya on 23/05/24.
//

import UIKit

class EventSuggestionsTagCollectionViewCell: UICollectionViewCell {
    
    
    var isActive:Bool = false
    @IBOutlet weak var tagButton: UIButton!
    
    @IBAction func tagButtonPressed(_ sender: UIButton) {
        
        if isActive{
            isActive = false
            tagButton.tintColor = UIColor(cgColor: CGColor(red: 1.0, green: 0.96, blue: 0.92, alpha: 1))
        }
        else{
            isActive = true
            tagButton.tintColor = UIColor(cgColor: CGColor(red: 0.71, green: 0.64, blue: 0.57, alpha: 1))
        }
        
//        sender.isSelected = true
//    
//        if sender.isSelected{
////            tagButton.layer.borderWidth = 1
////            tagButton.layer.cornerRadius = 14
////            tagButton.layer.borderColor = CGColor(red: 0.24, green: 0.24, blue: 0.24, alpha: 1)
//            
//            tagButton.tintColor = UIColor(cgColor: CGColor(red: 0.71, green: 0.64, blue: 0.57, alpha: 1))
//        
//        }
        
    }
}
