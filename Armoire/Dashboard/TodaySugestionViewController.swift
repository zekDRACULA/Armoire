//
//  TodaySugestionViewController.swift
//  Armoire
//
//  Created by Kanika Gupta on 02/06/24.
//

import UIKit

class TodaySugestionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var selectedEventType: EventType = .party
    

    func outfitsForEventType(_ eventType: EventType) -> [MainDataModel.Outfit] {
        switch eventType {
        case .presentation:
            return MainDataModel.presentationOutfits
        case .meeting:
            return MainDataModel.meetingOutfits
        case .workout:
            return MainDataModel.workoutOutfits
        case .party:
            return MainDataModel.partyOutfits
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstNib = UINib(nibName: "ImageSuggestion", bundle: nil)
        collectionView.register(firstNib, forCellWithReuseIdentifier: "ImageSuggestion")

        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return outfitsForEventType(selectedEventType).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageSugestionCollectionViewCell", for: indexPath) as! ImageSugestionCollectionViewCell
        let outfit = outfitsForEventType(selectedEventType)[indexPath.row]
        cell.configure(picture1: outfit.top.image, picture2: outfit.bottom.image)
        cell.viewImage.layer.masksToBounds = false
        cell.viewImage.layer.cornerRadius = 14.0
        return cell
    }
   
    @IBOutlet var collectionView: UICollectionView!
    

    func generateLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets.trailing = 20
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            group.contentInsets.bottom = 20
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.top = 20
            section.contentInsets.leading = 16
            return section
        }
        return layout
    }
}
