//
//  imageCollectionViewCell.swift
//  Armoire
//
//  Created by Kanika Gupta on 20/05/24.
//

import UIKit

class imageCollectionViewCell: UICollectionViewCell {
    @IBOutlet var image1: UIImageView!
    
    @IBOutlet var image2: UIImageView!
    
    
    @IBOutlet var viewImage: UIView!
    

    
    func configure(picture1 : UIImage,picture2: UIImage ){
        image1.image = picture1
        image2.image = picture2
        viewImage.layer.shadowColor = UIColor.gray.cgColor
        viewImage.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        viewImage.layer.shadowOpacity = 1.0
        viewImage.layer.masksToBounds = false
        viewImage.layer.masksToBounds = false
        viewImage.layer.cornerRadius = 14.0
    }
    
}
