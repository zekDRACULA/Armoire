//
//  headerCollectionViewCell.swift
//  Armoire
//
//  Created by Kanika Gupta on 20/05/24.
//

import UIKit

class headerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var username: UILabel!
    
    @IBOutlet var dropDownButton: UIButton!
    
    @IBOutlet var partyButton: UIButton!
    
    @IBOutlet var calenderLabel: UILabel!
    @IBOutlet var waetherLabel: UILabel!
    @IBOutlet var outfitLabel: UILabel!
    
    @IBOutlet var eventButton: [UIButton]!
    
    var button = false
    
    func showButtonVisibility(){
        eventButton.forEach{button in
            UIView.animate(withDuration: 0.5, animations: {
                button.isHidden = !button.isHidden
                self.contentView.layoutIfNeeded()
            })
            
        }
        
    }
        override func layoutSubviews() {
            super.layoutSubviews()
            
    }
    
    @IBAction func event(_ sender: UIButton) {
        button.toggle()
        showButtonVisibility()
        if button{
            dropDownButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }else{
            dropDownButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        }
    }
    
    
    @IBAction func eventAction(_ sender: UIButton) {
        showButtonVisibility()
        switch sender.configuration!.title!{
        case "Party":
            partyButton.setTitle("Party", for: .normal)
        case "Meeting":
            partyButton.setTitle("Meeting", for: .normal)
        case "Workout":
            partyButton.setTitle("Workout", for: .normal)
        default:
            partyButton.setTitle("Party", for: .normal)
        }
    }
    
    
}
