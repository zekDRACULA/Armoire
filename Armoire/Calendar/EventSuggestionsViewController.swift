//
//  EventSuggestionsViewController.swift
//  Armoire
//
//  Created by Aditya on 23/05/24.
//

import UIKit

class EventSuggestionsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
//    var tagTitle:[String] = ["Summer","Black","White","Tshirts","Pants","Uper","Kuchtoh"]
//    var suggestionImages:[String] = ["Image_2","Image_3","Image_4"]
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return DataController.shared.countTags()
        case 1:
            return DataController.shared.outfits.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionsTag", for: indexPath) as! EventSuggestionsTagCollectionViewCell
            cell.tagButton.setTitle(DataController.shared.getTags()[indexPath.row], for: .normal)
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionOutfits", for: indexPath) as! EventSuggestionOutfitsCollectionViewCell
            cell.upperOutfitImage.image = DataController.shared.outfits[indexPath.row].top.image
            cell.lowerOutfitImage.image = DataController.shared.outfits[indexPath.row].bottom.image
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionsTag", for: indexPath) as! EventSuggestionsTagCollectionViewCell
            cell.tagButton.setTitle(DataController.shared.getTags()[indexPath.row], for: .normal)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if let cell = collectionView.cellForItem(at: indexPath) as? EventSuggestionOutfitsCollectionViewCell{
                
                DataController.shared.selectedSuggestions.append(DataController.shared.outfits[indexPath.row])
//                var upperOutfitPhoto = cell.upperOutfitImage
//                var lowerOutfitPhoto = cell.lowerOutfitImage

                cell.viewOutlet.backgroundColor = .selected
//                print(upperOutfitPhoto!)
//                print(lowerOutfitPhoto!)
//                
                print(DataController.shared.selectedSuggestions.count)
//                print(selectedSuggestions)
                
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        
        if let cell = collectionView.cellForItem(at: indexPath) as? EventSuggestionOutfitsCollectionViewCell {
            cell.viewOutlet.backgroundColor = .cell
//            let index = indexPath.row - 1
//            if indexPath.row == 0 {
//                selectedSuggestions.remove(at: 0)
//            }
//            else{
//                selectedSuggestions.remove(at: index)
//            }
            
//            print(selectedSuggestions.count)
//            print(selectedSuggestions)

        }
//        cell.viewOutlet.backgroundColor = .fo
    }
    
    
    
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstNib = UINib(nibName: "SuggestionsTag", bundle: nil)
        collectionViewOutlet.register(firstNib, forCellWithReuseIdentifier: "SuggestionsTag")
        
        let secondNib = UINib(nibName: "SuggestionOutfits", bundle: nil)
        collectionViewOutlet.register(secondNib, forCellWithReuseIdentifier: "SuggestionOutfits")
        
        
        collectionViewOutlet.setCollectionViewLayout(generateLayout(), animated: true)
        collectionViewOutlet.allowsMultipleSelection = true
        
        
        
        
        
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (section,env) -> NSCollectionLayoutSection? in
            switch section {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 10
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.29), heightDimension: .absolute(40))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                return section
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 20
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                group.contentInsets.bottom = 20
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.top = 20
                section.contentInsets.leading = 16
                
                return section
                
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(100))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
                
                
            }
            
        }
        return layout
    }
    
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
