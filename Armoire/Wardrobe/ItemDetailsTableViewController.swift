//
//  ItemDetailsTableViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 02/06/24.
//

import UIKit
import FirebaseAuth//for authentication
import FirebaseCore  //idk
import FirebaseStorage //for storing image
import FirebaseFirestore //for retriving image as url

protocol SavingNewWardrobeApparelDelegateProtocol {
    func savingAndRefreshingCollectionView()
}


class ItemDetailsTableViewController: UITableViewController {
    
    var wvc : WardrobeViewController?
    @IBOutlet var apparelImage: UIImageView!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var colourLabel: UILabel!
//    @IBOutlet var patternLabel: UILabel!
    
    @IBOutlet var rightBarButton: UIBarButtonItem!
    
    // apparel selected
    var apparel: Apparel?
    
    // source identifier
    var segueIdentifier: String?
    
    var clothType:String?
    
    var delegate:SavingNewWardrobeApparelDelegateProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if segueIdentifier == "toDetails" {
            rightBarButton.isHidden = true
        }
        
        apparelImage.image = apparel?.image
        typeLabel.text = apparel?.category
        colourLabel.text = apparel?.color
//        patternLabel.text = apparel?.pattern.rawValue
//        print(apparel)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        //DataController.shared.appendApparel(apparel: apparel!)
        //passing image To User
        DataController.shared.uploadData(apparel: apparel!)
        DataController.shared.appendApparel(apparel: apparel!)
        self.dismiss(animated: true)
        delegate?.savingAndRefreshingCollectionView()
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
    
}
