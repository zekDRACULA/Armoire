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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
