//
//  ProfileTabViewController.swift
//  Armoire
//
//  Created by Aditya on 26/05/24.
//

import UIKit
import FirebaseAuth
import FirebaseAuth  //for authentication
import FirebaseCore  //idk
import FirebaseStorage //for storing image
import FirebaseFirestore //for retriving image as url

class ProfileTabViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var thingsWeNeed:[String] = ["Profile","Notifications","Wardrobe Utilisation","Contact Us","Terms Of Use","Privacy Policy","Logout"]
    
    @IBOutlet var usernameLabel: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thingsWeNeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(cgColor: CGColor(red: 1, green: 0.96, blue: 0.91, alpha: 1))
        cell.accessoryType = .disclosureIndicator
        var content = cell.defaultContentConfiguration()
        content.text = "\(thingsWeNeed[indexPath.row])"
        cell.contentConfiguration = content
        return cell
    }
    

    @IBOutlet weak var myTable: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.backgroundColor = UIColor(named: "bgColorProfile")
        DataController.shared.fetchUsername { [weak self] username in
            self?.usernameLabel.text = username
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        AuthService.shared.signOut{[weak self] error in
            guard let self = self else {return}
            if let error = error{
                AlertManager.showLogoutError(on: self, with: error)
                return
            }
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate{
                sceneDelegate.checkAuthentication()
            }
        }
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
                //dismiss(animated: true, completion: nil)
        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
        
        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginStoryboard")
        let navigationController = self.navigationController
        navigationController?.pushViewController(vc, animated: true)
        
        
//        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
//segue.source as ViewController
//LoginStoryboard
