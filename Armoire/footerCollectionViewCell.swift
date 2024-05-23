//
//  footerCollectionViewCell.swift
//  Armoire
//
//  Created by Kanika Gupta on 20/05/24.
//

import UIKit


class footerCollectionViewCell: UICollectionViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet var label1: UILabel!
    
    @IBOutlet var compatibility: UILabel!
    
    @IBOutlet var travel: UILabel!
    
    @IBOutlet var compatibilityButton: UIButton!
    @IBOutlet var travelButton: UIButton!
    
    
    @IBAction func compatibilityTapped(_ sender: UIButton) {
        
    }
}
