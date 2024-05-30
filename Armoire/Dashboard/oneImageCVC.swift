//
//  oneImageCVC.swift
//  Armoire
//
//  Created by Kanika Gupta on 25/05/24.
//

import UIKit

class oneImageCVC: UICollectionViewCell,UINavigationControllerDelegate {
    @IBOutlet var image: UIImageView!
    @IBOutlet var suggestionButton: UIButton!
    weak var homeViewController: HomeViewController?
    @IBOutlet var viewImage: UIView!
    weak var  eventSuggestionsViewController:  EventSuggestionsViewController?
    override func awakeFromNib() {
            super.awakeFromNib()
            // Add gesture recognizer to the button
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(suggestionTapped))
            suggestionButton.addGestureRecognizer(tapGestureRecognizer)
        }
    @IBAction func suggestionTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "EventSugeestions", bundle: nil)
        
        
        if let nextVC = storyboard.instantiateViewController(withIdentifier: "EventSuggestionsViewController") as? EventSuggestionsViewController {
            
            if let navVC = homeViewController?.navigationController {
                navVC.pushViewController(nextVC, animated: true)
            } else {
                print("Navigation controller is nil")
            }
        } else {
            print("EventSuggestionsViewController could not be instantiated")
        }
    }
}
