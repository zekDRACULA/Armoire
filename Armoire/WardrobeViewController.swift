//
//  WardrobeViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 16/05/24.
//

import UIKit

class WardrobeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tabBarItem.title = "Wardrobe"
        self.tabBarItem.image = UIImage(systemName: "hanger")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.title = "Wardrobe"
        tabBarItem.image = UIImage(systemName: "hanger")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)})
            alertController.addAction(cameraAction)
            
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)})
            alertController.addAction(photoLibraryAction)
        }
        
        alertController.popoverPresentationController?.sourceItem = sender
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func DotButtonTapped(_ sender: UIBarButtonItem) {
//        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//
//        // Main Menu Items
//        alertController.addAction(UIAlertAction(title: "Option 1", style: .default, handler: { _ in
//            // Handle Option 1 action
//        }))
//        alertController.addAction(UIAlertAction(title: "Option 2", style: .default, handler: { _ in
//            // Handle Option 2 action
//        }))
//
//        // Submenu Item
//        let submenuAction = UIAlertAction(title: "More Options", style: .default, handler: { _ in
//            self.showSubMenu()
//        })
//        alertController.addAction(submenuAction)
//
//        // Cancel Action
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//
//        present(alertController, animated: true)
    }

    func showSubMenu() {
        let submenuAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // Submenu Items
        submenuAlert.addAction(UIAlertAction(title: "Sub Option 1", style: .default, handler: { _ in
            // Handle Sub Option 1 action
        }))
        submenuAlert.addAction(UIAlertAction(title: "Sub Option 2", style: .default, handler: { _ in
            // Handle Sub Option 2 action
        }))

        // Cancel Action
        submenuAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        present(submenuAlert, animated: true)
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
