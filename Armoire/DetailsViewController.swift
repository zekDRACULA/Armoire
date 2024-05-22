//
//  DetailsViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 22/05/24.
//

import UIKit

class DetailsViewController: UIViewController {

    
    
    @IBOutlet var imageView: UIImageView!
    
    var imageToUse:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageToUse
        
        // Do any additional setup after loading the view.
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
