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
    
    
    @IBAction func saveOutfitButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Item Saved Successfully", message: "You can find this item in wardrobe section", preferredStyle: .alert)
        
        let saveButton = UIAlertAction(title: "OK", style: .default){(action) in
            print("Saved Successfully")
            self.navigationController?.popViewController(animated: true)
        }
//        self.performSegue(withIdentifier: "unwindSegueToHome", sender: self)
        
        alert.addAction(saveButton)
        present(alert, animated: true, completion: nil)
        
//        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        if let image = selectedImage {
            imageView.image = image
            
        }
    }
    
    
    
}
