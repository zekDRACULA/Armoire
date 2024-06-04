//
//  TodaySugestionViewController.swift
//  Armoire
//
//  Created by Kanika Gupta on 02/06/24.
//

import UIKit

protocol TodaySuggestionDelegate: AnyObject {
    func didSelectOutfit(_ outfit: Outfit)
}


class TodaySugestionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var selectedEventType: EventType = .party
    weak var todaySuggestionDelegate: TodaySuggestionDelegate?
    
    func outfitsForEventType(_ eventType: EventType) -> [Outfit] {
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
        collectionView.dataSource = self
        collectionView.dataSource = self
        let firstNib = UINib(nibName: "ImageSuggestion", bundle: nil)
        collectionView.register(firstNib, forCellWithReuseIdentifier: "ImageSuggestion")
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return outfitsForEventType(selectedEventType).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageSuggestion", for: indexPath) as! ImageSugestionCollectionViewCell
        let outfit = outfitsForEventType(selectedEventType)[indexPath.row]
        cell.configure(picture1: outfit.top.image, picture2: outfit.bottom.image)
        return cell
                
    }
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedOutfit = outfitsForEventType(selectedEventType)[indexPath.row]
        DataController.shared.selectedSuggestions.append(selectedOutfit)
        todaySuggestionDelegate?.didSelectOutfit(selectedOutfit)
        
    }

        func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            if let index = DataController.shared.selectedSuggestions.firstIndex(of: outfitsForEventType(selectedEventType)[indexPath.row]) {
                DataController.shared.selectedSuggestions.remove(at: index)
            }
        }
    
    @IBOutlet var collectionView: UICollectionView!
    

    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets.trailing = 20
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(344))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            group.contentInsets.bottom = 20
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.top = 20
            section.contentInsets.leading = 16
            
            return section
        }
        return layout
    }

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}
