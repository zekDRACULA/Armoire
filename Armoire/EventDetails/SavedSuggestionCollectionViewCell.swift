//
//  SavedSuggestionCollectionViewCell.swift
//  Armoire
//
//  Created by Aditya on 02/06/24.
//

import UIKit

class SavedSuggestionCollectionViewCell: UICollectionViewCell {
    
    var seletcIndexPath:Int?
    
    @IBOutlet weak var upperOutfitImage: UIImageView!
    
    @IBOutlet weak var lowerOutfitImage: UIImageView!
    
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
//        print(seletcIndexPath)
//        DataController.shared.selectedSuggestions.remove(at: seletcIndexPath!)
        
    }
    
}
