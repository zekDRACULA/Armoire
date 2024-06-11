//
//  footerCollectionViewCell.swift
//  Armoire
//
//  Created by Kanika Gupta on 20/05/24.
//

import UIKit


class footerCollectionViewCell: UICollectionViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //    MARK: - OUTLETS
    @IBOutlet var compatibility: UIButton!
    @IBOutlet var travel: UIButton!
    @IBOutlet var compatibilityButton: UIButton!
    @IBOutlet var travelButton: UIButton!
    
    //    MARK: - VARIABLES
    weak var homeViewController: HomeViewController?
    var selectedImage: UIImage?
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    //    MARK: - PHOTO LIBRARY AND CAMERA ACCESS ACTION SHEET
    // MARK: ACTION SHEET
    @IBAction func compatibilityTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let alertController = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in imagePicker.sourceType = .camera
                self.homeViewController?.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
            
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in imagePicker.sourceType = .photoLibrary
                self.homeViewController?.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        alertController.popoverPresentationController?.sourceItem = sender
        self.homeViewController?.present(alertController, animated: true, completion: nil)
        
        
    }
    //MARK: updating after selecting
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let imageToUse = info[.originalImage] as? UIImage else {
            print(#function)
            return}
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        
        let nextVC = storyboard.instantiateViewController(identifier: "CompatibilityViewController") as! CompatibilityViewController
        nextVC.selectedImage = imageToUse
        
        let navVC = homeViewController?.navigationController
        
        homeViewController?.navigationController?.presentedViewController?.dismiss(animated: true, completion: nil)
        navVC?.pushViewController(nextVC, animated: true)
    }
    
    //    MARK: TRAVEL BAG VIEW CONTROLLER
    @IBAction func travelTapped(_ sender: UIButton) {
        let nextStoryboard = UIStoryboard(name: "EventDetails", bundle: nil)
        
        let nextViewController = nextStoryboard.instantiateViewController(withIdentifier: "eventDetailsIdentifier") as! EventsPageViewController
        
        homeViewController?.present(nextViewController, animated: true)
        
    }
}
