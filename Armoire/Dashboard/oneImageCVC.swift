//
//  oneImageCVC.swift
//  Armoire
//
//  Created by Kanika Gupta on 25/05/24.
//

import UIKit

//MARK: - Protocol Defined
protocol CollectionViewCellDelegate: AnyObject {
    func suggestionTapped(cell: oneImageCVC)
}

//MARK: - CLASS
class oneImageCVC: UICollectionViewCell,UINavigationControllerDelegate {
    
    //MARK: -OUTLETS
    @IBOutlet var image: UIImageView!
    @IBOutlet var suggestionButton: UIButton!
    @IBOutlet var viewImage: UIView!
    
    //MARK: VARIABLES
    weak var delegate: CollectionViewCellDelegate?
    weak var homeViewController: HomeViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //    MARK: - ACTIONS
    @IBAction func suggestionTapped(_ sender: UIButton) {
        delegate?.suggestionTapped(cell: self)
    }
    
    
}
