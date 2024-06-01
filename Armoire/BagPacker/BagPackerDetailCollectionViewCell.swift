//
//  BagPackerDetailCollectionViewCell.swift
//  Armoire
//
//  Created by Abhay singh on 26/05/24.
//

import UIKit



class BagPackerDetailCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var imageView: UIImageView!

    @IBOutlet var clothType: UILabel!
    
    @IBOutlet var clothColor: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }
    
    private func setupStyle(){
        contentView.layer.cornerRadius = 14.0
        contentView.layer.masksToBounds = true
        
        imageView.layer.cornerRadius = 14.0
        
    }
    
}


