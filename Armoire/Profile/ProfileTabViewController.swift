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
    
    var thingsWeNeed:[String] = ["Profile","Notifications","Contact Us","Terms Of Use","Privacy Policy"]
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath)
        if indexPath == IndexPath(row: 0, section: 0){
//            print("Profile Pressed")
            performSegue(withIdentifier: "toProfilePage", sender: self)
        }
        else if indexPath == IndexPath(row: 1, section: 0){
//            print("Notifications pressed")
            performSegue(withIdentifier: "toNotifications", sender: self)
        }
        else if indexPath == IndexPath(row: 2, section: 0){
//            print("Notifications pressed")
            performSegue(withIdentifier: "toContactUs", sender: self)
        }
        else if indexPath == IndexPath(row: 3, section: 0){
//            print("Notifications pressed")
            performSegue(withIdentifier: "toTermsOfUse", sender: self)
        }
        else if indexPath == IndexPath(row: 4, section: 0){
//            print("Notifications pressed")
            performSegue(withIdentifier: "toPrivacyPolicy", sender: self)
        }
    }
    

    @IBOutlet weak var myTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        puttingUsername()
       //usernameLabel.text = DataController.shared.username
        myTable.dataSource = self
        myTable.delegate = self
        myTable.backgroundColor = UIColor(named: "bgColorProfile")
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - username
    
    func puttingUsername(){
        let db = Firestore.firestore()
        
        guard let user = Auth.auth().currentUser else{
            print("user is not authenticated")
                return
        }
        let userID = user.uid
        
        db.collection("users").document(userID).getDocument { (document, error) in
            if let error = error {
                print("Error fetching document: \(error.localizedDescription)")
                return
            }
            guard let document = document, document.exists, let data = document.data() else{
                print("document is nil")
//                exit(1)
                return
            }
            if let username = data["username"] as? String{
                self.usernameLabel.text = username
                //print(self.usernamestore)
                //self.username = username
                print("username in profile : \(username)")
//                self.setUsername(username: username)
            }else{
                print("user name is nil")
            }
        }
//        return username!
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
