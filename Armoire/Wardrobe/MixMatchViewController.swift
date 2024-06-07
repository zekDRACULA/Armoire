//
//  MixMatchViewController.swift
//  Armoire
//
//  Created by Kanika Gupta on 23/05/24.
//

import UIKit

class MixMatchViewController: UIViewController {

    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var image4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func configure(picture : UIImage){
        imageView.layer.shadowColor = UIColor.gray.cgColor
        imageView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.masksToBounds = false
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 14.0
    }
    
    

    @IBAction func saveButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Item Saved Successfully", message: "You can find this item in wardrobe section", preferredStyle: .alert)
        
        let saveButton = UIAlertAction(title: "OK", style: .default){(action) in
            print("Saved Successfully")
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}
