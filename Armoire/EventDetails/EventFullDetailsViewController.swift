//
//  EventFullDetailsViewController.swift
//  Armoire
//
//  Created by Aditya on 30/05/24.
//

import UIKit

class EventFullDetailsViewController: UIViewController {
    
    
    var indexPathOfSelcted:Int?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d yyyy"
        
        let eventStartFormattedDate = dateFormatter.string(from: DataController.shared.getEvents()[indexPathOfSelcted!].eventStartDate)
        
        let eventEndFormattedDate = dateFormatter.string(from: DataController.shared.getEvents()[indexPathOfSelcted!].eventEndDate)
        
        
        
        titleLabel.text = "\(DataController.shared.getEvents()[indexPathOfSelcted!].eventTitle)"
        locationLabel.text = "\(DataController.shared.getEvents()[indexPathOfSelcted!].eventLocation)"
        
        startDateLabel.text = "from \(eventStartFormattedDate)"
        endDateLabel.text = "to \(eventEndFormattedDate)"
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteEventTapped(_ sender: UIBarButtonItem) {
        
        DataController.shared.removeEvent(indexpath: indexPathOfSelcted!)
//        dismiss(animated: true, completion: nil)
        
        // Create the alert controller
        let alertController = UIAlertController(title: "Event Deleted", message: "The event has been successfully deleted.", preferredStyle: .alert)
        
        // Add an action to the alert controller
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        // Dismiss the current view controller and then present the alert
        
            
            
            
            //            dismiss(animated: true, completion: nil)
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
