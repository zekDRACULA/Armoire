//
//  headerCollectionViewCell.swift
//  Armoire
//
//  Created by Kanika Gupta on 20/05/24.
//

import UIKit

protocol HeaderCollectionViewCellDelegate: AnyObject {
    func toggleLayout(isExpanded: Bool)
}

class headerCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var dropDownButton: UIButton!
    
    @IBOutlet var partyButton: UIButton!
    
    @IBOutlet var calenderLabel: UILabel!
    @IBOutlet var waetherLabel: UILabel!
    @IBOutlet var outfitLabel: UILabel!
    
    @IBOutlet var eventButton: [UIButton]!
    
//    @IBOutlet var myStackView: UIStackView!
    
    weak var delegate: HeaderCollectionViewCellDelegate? 
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
        delegate?.toggleLayout(isExpanded: button)
    }
    
    
    @IBAction func eventAction(_ sender: UIButton) {
//        showButtonVisibility()
        switch sender.configuration!.title!{
        case "Presentation":
            partyButton.setTitle("Presentation", for: .normal)
            partyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            partyButton.setImage(UIImage(named: "network"), for: .normal)
        case "Meeting":
            partyButton.setTitle("Meeting", for: .normal)
            partyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            partyButton.setImage(UIImage(named: "filemenu.and.cursorarrow"), for: .normal)
        case "Workout":
            partyButton.setTitle("Workout", for: .normal)
            partyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            partyButton.setImage(UIImage(named: "figure.yoga"), for: .normal)
        default:
            partyButton.setTitle("Party", for: .normal)
            partyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            partyButton.setImage(UIImage(named: "party.popper.fill"), for: .normal)
        }
    }
    
    
}
