//
//  ItemDetailViewController.swift
//  Armoire
//
//  Created by Abhay singh on 22/05/24.
//

import UIKit

class ItemDetailViewController: UIViewController {

    
    @IBOutlet weak var mainTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //registering the custom cell
        
        let dropDownCellNib = UINib(nibName: "DropDownTableViewCell", bundle: nil)
        mainTableView.register(dropDownCellNib, forCellReuseIdentifier: "DropDownTableViewCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: Notification.Name("DropDownToggle"), object: nil)
    }
    
    @objc func reloadTableView(){
        mainTableView.beginUpdates()
        mainTableView.endUpdates()
    }

  
   
}

extension ItemDetailViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownTableViewCell", for: indexPath) as! DropDownTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.cellForRow(at: indexPath) as? DropDownTableViewCell
        let baseHeight : CGFloat = 166.0
        let dropDownHeight : CGFloat = cell?.isDropDownVisible ?? false ? CGFloat(cell?.categoryList.count ?? 0 * 166) : 0
        return baseHeight + dropDownHeight
    }
    
}


