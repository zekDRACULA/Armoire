//
//  CardCell.swift
//  Armoire
//
//  Created by Abhay singh on 16/05/24.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var pictureView: UIImageView!
    
    func configure(picture : UIImage){
        pictureView.image = picture
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cardView.layer.shadowOpacity = 1.0
        cardView.layer.masksToBounds = false
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 14.0
    }
    
}
