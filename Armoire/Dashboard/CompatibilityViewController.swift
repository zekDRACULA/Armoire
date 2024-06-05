//
//  CompatibilityViewController.swift
//  Armoire
//
//  Created by Kanika Gupta on 22/05/24.
//


import UIKit

class CompatibilityViewController: UIViewController {
    
    
    var selectedImage: UIImage?
    
    // MARK: - Outlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var view1: UIView!
    @IBOutlet var view3: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view4: UIView!
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var image4: UIImageView!
    @IBOutlet var bottom1: UIImageView!
    @IBOutlet var bottom2: UIImageView!
    @IBOutlet var bottom3: UIImageView!
    @IBOutlet var bottom4: UIImageView!
    
    
    // MARK: - Actions
    
    @IBAction func saveOutfitButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Item Saved Successfully", message: "You can find this item in wardrobe section", preferredStyle: .alert)
        
        let saveButton = UIAlertAction(title: "OK", style: .default){(action) in
            print("Saved Successfully")
            
            self.navigationController?.popViewController(animated: true)
        }
        
        
        alert.addAction(saveButton)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Layout
    
    fileprivate func extractedFunc() {
        //tabBarController?.tabBar.isHidden = true
        let outfits = MainDataModel.partyOutfits
        bottom1.image = outfits[0].bottom.image
        bottom2.image = outfits[1].bottom.image
        bottom3.image = outfits[2].bottom.image
        bottom4.image = outfits[3].bottom.image
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
    
//    MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        extractedFunc()
    }
}
