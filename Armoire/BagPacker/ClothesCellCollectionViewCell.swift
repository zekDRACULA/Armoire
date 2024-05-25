//
//  ClothesCellCollectionViewCell.swift
//  BagPacker
//
//  Created by Abhay singh on 25/05/24.
//

import UIKit

class ClothesCellCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var imageView: UIImageView!

    override func awakeFromNib() {
            super.awakeFromNib()
            setupStyle()
        }
    
    private func setupStyle(){
        contentView.layer.cornerRadius = 14.0
        contentView.layer.masksToBounds = true
    }
}
