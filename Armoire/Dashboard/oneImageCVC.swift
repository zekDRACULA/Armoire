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
    
    @IBOutlet var viewImage: UIView!
    weak var homeViewController: HomeViewController?
    @IBAction func suggestionTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        
        let nextVC = storyboard.instantiateViewController(identifier: "EventSuggestionsViewController") as! EventSuggestionsViewController
        
        let navVC = homeViewController?.navigationController
        
        homeViewController?.navigationController?.presentedViewController?.dismiss(animated: true, completion: nil)
        navVC?.pushViewController(nextVC, animated: true)

    }
}
