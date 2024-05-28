//
//  ProfileTabViewController.swift
//  Armoire
//
//  Created by Aditya on 26/05/24.
//

import UIKit

class ProfileTabViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var thingsWeNeed:[String] = ["Profile","Notifications","Wardrobe Utilisation","Contact Us","Terms Of Use","Privacy Policy"]
    
    
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
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
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
