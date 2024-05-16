//
//  HomeViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 16/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tabBarItem.title = "Home"
        self.tabBarItem.image = UIImage(systemName: "house")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.title = "Home"
        tabBarItem.image = UIImage(systemName: "house")
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
