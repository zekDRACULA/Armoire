//
//  ViewController.swift
//  Armoire
//
//  Created by zekDracula on 09/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataController.shared.fetchUsername()
        // Do any additional setup after loading the view.
    }


}

