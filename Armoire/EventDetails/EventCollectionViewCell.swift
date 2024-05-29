//
//  EventCollectionViewCell.swift
//  Armoire
//
//  Created by Abhay singh on 28/05/24.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var eventDate: UILabel!
    
    @IBOutlet var eventTitle: UILabel!
   
    @IBOutlet var eventLocation: UILabel!
    
    @IBOutlet var eventDuration: UILabel!
    
    @IBOutlet var eventType: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }
    
    private func setupStyle(){
        eventType.layer.cornerRadius = 2.0
    }
}
