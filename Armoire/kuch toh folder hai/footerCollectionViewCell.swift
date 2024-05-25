//
//  footerCollectionViewCell.swift
//  Armoire
//
//  Created by Kanika Gupta on 20/05/24.
//

import UIKit


class footerCollectionViewCell: UICollectionViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet var label1: UILabel!
    
    @IBOutlet var compatibility: UIButton!
    
    @IBOutlet var travel: UILabel!
    
    var selectedImage: UIImage?
    @IBOutlet var compatibilityButton: UIButton!
    @IBOutlet var travelButton: UIButton!
    weak var homeViewController: HomeViewController?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
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
    //updating after selecting
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      // Update selectedImage after image selection
//      if let image = info[.originalImage] as? UIImage {
//        selectedImage = image
//      }
        guard let imageToUse = info[.originalImage] as? UIImage else {return}
        selectedImage = imageToUse
        
        homeViewController?.navigationController?.presentedViewController?.dismiss(animated: true, completion: nil)
        homeViewController?.performSegue(withIdentifier: "wardrobeCompatibility", sender: self)
        
    }
    
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "wardrobeCompatibility", let image = selectedImage {
        let compatibilityViewController = segue.destination as! CompatibilityViewController
        compatibilityViewController.selectedImage = image
      }
    }
}
