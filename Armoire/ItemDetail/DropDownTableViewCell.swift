//
//  DropDownTableViewCell.swift
//  Armoire
//
//  Created by Abhay singh on 22/05/24.
//

import UIKit

class DropDownTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryTableViewCell: UITableView!
    @IBOutlet weak var categoryDropDownButton: UIButton!
    
    var categoryList = ["tops", "T-shirt", "Full sleeves", "shirts", "hoodies"]
    var isDropDownVisible = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        categoryTableViewCell.delegate = self
        categoryTableViewCell.dataSource = self
        categoryTableViewCell.isHidden = true
        
        //register category table view cell
        categoryTableViewCell.register(UITableView.self, forCellReuseIdentifier: "DropDownOptionCell")
        
    }
    
    @IBAction func onClickCategoryDropDownButton(_ sender: UIButton) {
        isDropDownVisible.toggle()
        categoryTableViewCell.isHidden = !isDropDownVisible
        
        //reload categoryTableViewCell for changed Height
        categoryTableViewCell.reloadData()
        
        //notifying table view to update cell height
        
        NotificationCenter.default.post(name: Notification.Name("DropDownTogggle"), object: nil)
    }
    
}

extension DropDownTableViewCell : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownOptionCell", for: indexPath)
        cell.textLabel?.text = categoryList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = categoryList[indexPath.row]
        categoryDropDownButton.setTitle(selectedCategory, for: .normal)
        
        // hiding the dropdown after selection
        isDropDownVisible = false
        categoryTableViewCell.isHidden = true
        tableView.reloadData()
        
        //notifying tableView to update cell height
        NotificationCenter.default.post(name: Notification.Name("DropDownToggle"), object: nil)
    }
}
