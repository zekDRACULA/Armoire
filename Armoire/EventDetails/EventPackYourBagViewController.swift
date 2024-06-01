//
//  EventPackYourBagViewController.swift
//  Armoire
//
//  Created by Aditya on 01/06/24.
//

import UIKit

class EventPackYourBagViewController: UIViewController {
    
    var indexPathofSelected:Int?
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d yyyy"
        
        let eventStartFormattedDate = dateFormatter.string(from: DataController.shared.getEvents()[indexPathofSelected!].eventStartDate)
        
        let eventEndFormattedDate = dateFormatter.string(from: DataController.shared.getEvents()[indexPathofSelected!].eventEndDate)
        
        
        
        titleLabel.text = "\(DataController.shared.getEvents()[indexPathofSelected!].eventTitle)"
        locationLabel.text = "\(DataController.shared.getEvents()[indexPathofSelected!].eventLocation)"
        
        startDateLabel.text = "from \(eventStartFormattedDate)"
        endDateLabel.text = "to \(eventEndFormattedDate)"
        
        
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func deleteButtonTapped(_ sender: UIBarButtonItem) {
        
        DataController.shared.removeEvent(indexpath: indexPathofSelected!)
//        dismiss(animated: true, completion: nil)
        
        // Create the alert controller
        let alertController = UIAlertController(title: "Event Deleted", message: "The event has been successfully deleted.", preferredStyle: .alert)
        
        // Add an action to the alert controller
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        
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
