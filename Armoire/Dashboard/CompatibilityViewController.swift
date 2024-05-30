//
//  CompatibilityViewController.swift
//  Armoire
//
//  Created by Kanika Gupta on 22/05/24.
//


import UIKit

class CompatibilityViewController: UIViewController {
    

    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: UIImage?
    @IBOutlet var view1: UIView!
    @IBOutlet var view3: UIView!
    
    @IBOutlet var view2: UIView!
    
    @IBOutlet var view4: UIView!
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var image4: UIImageView!
    
    @IBAction func saveOutfitButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Item Saved Successfully", message: "You can find this item in wardrobe section", preferredStyle: .alert)
        
        let saveButton = UIAlertAction(title: "OK", style: .default){(action) in
            print("Saved Successfully")
         
            
            self.navigationController?.popViewController(animated: true)
        }
        
        
        alert.addAction(saveButton)
        present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        tabBarController?.tabBar.isHidden = true
        imageView.image = selectedImage
        image1.image = selectedImage
        image2.image = selectedImage
        image3.image = selectedImage
        image4.image = selectedImage
        imageView.layer.cornerRadius = 20.0
        imageView.layer.masksToBounds = false
        view1.layer.cornerRadius = 20.0
        view1.layer.masksToBounds = false
        view2.layer.cornerRadius = 20.0
        view2.layer.masksToBounds = false
        view3.layer.cornerRadius = 20.0
        view3.layer.masksToBounds = false
        view4.layer.cornerRadius = 20.0
        view4.layer.masksToBounds = false
    }
}
