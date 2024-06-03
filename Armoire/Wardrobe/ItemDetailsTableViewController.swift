//
//  ItemDetailsTableViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 02/06/24.
//

import UIKit
import FirebaseAuth  //for authentication
import FirebaseCore  //idk
import FirebaseStorage //for storing image
import FirebaseFirestore //for retriving image as url

class ItemDetailsTableViewController: UITableViewController {
    
    
    @IBOutlet var apparelImage: UIImageView!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var colourLabel: UILabel!
    @IBOutlet var patternLabel: UILabel!
    
    @IBOutlet var rightBarButton: UIBarButtonItem!
    
    // apparel selected
    var apparel: Apparel?
    
    // source identifier
    var segueIdentifier: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if segueIdentifier == "toDetails" {
            rightBarButton.isHidden = true
        }
        
        apparelImage.image = apparel?.image
//        typeLabel.text = apparel?.type
        colourLabel.text = apparel?.color.accessibilityName.capitalized
        patternLabel.text = apparel?.pattern.rawValue
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        DataController.shared.appendApparel(apparel: apparel!)
        uploadPhoto()
        self.dismiss(animated: true)
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 1: return "Info"
//        case 2: return "Outfit Combinations"
//        default: return nil
//        }
//    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 8, y: 5, width: tableView.frame.width, height: 25)
        
        switch section {
        case 1: label.text = "Info"
        case 2: label.text = "Outfit Combinations"
        default: label.text = ""
        }
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == IndexPath(row: 0, section: 2) {
            let homeVC = UIStoryboard(name: "Home", bundle: nil)
            
            let combinationsVC = homeVC.instantiateViewController(withIdentifier: "CompatibilityViewController") as! CompatibilityViewController
            combinationsVC.selectedImage = apparel?.image
            
            self.present(combinationsVC, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 16
        } else {
            return 35
        }
    }
    
    
    // MARK: uploadPhoto Function
    func uploadPhoto(){
        
        // checking if user is authenticated
        
        guard let user = Auth.auth().currentUser else{
            print ("user is not Authenticated")
            return
        }
        let userID = user.uid
        
        // create storage reference
        let storageRef = Storage.storage().reference()
        
        // turn image into data
        let imageData = apparel?.image.jpegData(compressionQuality: 0.80)
        
        // checking that we can convert image into data
        guard imageData != nil else{
            return
        }
        // speccify the file path and name
        let path = "\(userID)/apparels/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        print(userID)
        // upload that data
        
        let uploadTask = fileRef.putData(imageData!, metadata: nil) { metadata, error in
            
            //check for errors
            if error == nil && metadata != nil{
                
                // save a reference to the file in firestore DB
                
                let db = Firestore.firestore()
                let apparelRef = db.collection("users").document(userID).collection("Apparels").document(UUID().uuidString)
                apparelRef.setData(["url": path]){ error in
                    if let error = error{
                        print("error:\(error.localizedDescription)")
                        return
                    }else{
                        print("upload successfull")
                    }
                }
            }
        }
    }
    
    func retrievePhotos(){
        
    }

    

}
