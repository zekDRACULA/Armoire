//
//  SuggestionViewController.swift
//  Armoire
//
//  Created by Abhay singh on 16/05/24.
//

import UIKit

class SuggestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var cardTableView: UITableView!

    let suggestionPictures: [UIImage] = [
        UIImage(named: "suggestion1")!,
        UIImage(named: "suggestion2")!,
        UIImage(named: "suggestion3")!,
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestionPictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        
        cell.configure(picture: suggestionPictures[indexPath.row])
        
        return cell
    }


}
