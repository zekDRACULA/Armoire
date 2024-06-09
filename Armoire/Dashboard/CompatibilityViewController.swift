//
//  CompatibilityViewController.swift
//  Armoire
//
//  Created by Kanika Gupta on 22/05/24.
//

protocol ImageSelectionDelegate: AnyObject {
    func didSelectImage(_ image: UIImage)
}


import UIKit

class CompatibilityViewController: UIViewController {
    
    weak var delegate: ImageSelectionDelegate?
    var selectedImage: UIImage?
    var eventType: EventType?
    var dataController = DataController.shared
    
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
        let alert = UIAlertController(title: "Item Saved Successfully", message: "You can find this item in the wardrobe section", preferredStyle: .alert)
            
            let saveButton = UIAlertAction(title: "OK", style: .default) { (action) in
                print("Saved Successfully")
                
                // Pass the selected image to the delegate
                if let selectedImage = self.selectedImage {
                            self.delegate?.didSelectImage(selectedImage)
                }
                
                self.navigationController?.popViewController(animated: true)
            }
            
            alert.addAction(saveButton)
            present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Layout
    
    fileprivate func extractedFunc() {
        // Retrieve party outfits from the DataController
        let outfits = DataController.shared.outfits

        // Assign the selected image to the main image view
        imageView.image = selectedImage

        // Assign bottom images to each cell based on the outfits
        if outfits.count >= 4 {
            bottom1.image = outfits[0].bottom.image
            bottom2.image = outfits[1].bottom.image
            bottom3.image = outfits[2].bottom.image
            bottom4.image = outfits[3].bottom.image
        }

        // Assign the selected image to each image view
        image1.image = selectedImage
        image2.image = selectedImage
        image3.image = selectedImage
        image4.image = selectedImage

        // Apply corner radius to image view and views
        let cornerRadius: CGFloat = 20.0
        [imageView, view1, view2, view3, view4].forEach { $0?.layer.cornerRadius = cornerRadius }
    }

    
//    MARK: - Functions
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extractedFunc()
    }
    

}
