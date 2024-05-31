//
//  oneImageCVC.swift
//  Armoire
//
//  Created by Kanika Gupta on 25/05/24.
//

import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    func suggestionTapped(cell: oneImageCVC)
}

class oneImageCVC: UICollectionViewCell,UINavigationControllerDelegate {
    @IBOutlet var image: UIImageView!
    @IBOutlet var suggestionButton: UIButton!
    weak var homeViewController: HomeViewController?
    @IBOutlet var viewImage: UIView!
    weak var delegate: CollectionViewCellDelegate?
    weak var  eventSuggestionsViewController:  EventSuggestionsViewController?
    override func awakeFromNib() {
            super.awakeFromNib()
            // Add gesture recognizer to the button
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(suggestionTapped))
            suggestionButton.addGestureRecognizer(tapGestureRecognizer)
        }
    @IBAction func suggestionTapped(_ sender: UIButton) {
        delegate?.suggestionTapped(cell: self)
    }
}
