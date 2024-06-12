//
//  ImageSugestionCollectionViewCell.swift
//  Armoire
//
//  Created by Kanika Gupta on 02/06/24.
//

import UIKit

class ImageSugestionCollectionViewCell: UICollectionViewCell {
    //    MARK: OUTLETS
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var viewImage: UIView!
    
    override var isSelected: Bool {
        didSet {
            viewImage.backgroundColor = isSelected ? .selected : .cell
        }
    }
    //MARK: FOR TOP AND BOTTOM
    func configure(picture1 : UIImage,picture2: UIImage ){
        image1.image = picture1
        image2.image = picture2
        viewImage.layer.masksToBounds = true
        viewImage.layer.cornerRadius = 14.0
        self.viewImage.backgroundColor = .cell
    }
}
