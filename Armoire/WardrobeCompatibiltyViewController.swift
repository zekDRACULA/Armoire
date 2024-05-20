//
//  WardrobeCompatibiltyViewController.swift
//  Armoire
//
//  Created by Kanika Gupta on 16/05/24.
//

import UIKit

class WardrobeCompatibiltyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func saveOutfitAlertButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Item Saved Successfully", message: "You can find this item in wardrobe section", preferredStyle: .alert)
        
        let saveButton = UIAlertAction(title: "OK", style: .default){(action) in
            print("Saved Successfully")
        }
        self.performSegue(withIdentifier: "unwindSegueToHome", sender: self)
        
        alert.addAction(saveButton)
        present(alert, animated: true, completion: nil)
    }
}
