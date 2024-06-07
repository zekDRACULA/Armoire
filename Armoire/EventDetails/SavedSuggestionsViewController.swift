//
//  SavedSuggestionsViewController.swift
//  Armoire
//
//  Created by Aditya on 02/06/24.
//

import UIKit

class SavedSuggestionsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var seletedIndexPath:Int?
    
//    var selectedImage = ["Image_2","Image_3","Image_4","Image_5"]

    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DataController.shared.selectedSuggestions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SavedSuggestions", for: indexPath) as! SavedSuggestionCollectionViewCell
        cell.upperOutfitImage.image = DataController.shared.selectedSuggestions[indexPath.row].top
        cell.lowerOutfitImage.image = DataController.shared.selectedSuggestions[indexPath.row].bottom
        return cell
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        seletedIndexPath = indexPath.row
        if let cell = collectionView.cellForItem(at: indexPath) as? SavedSuggestionCollectionViewCell{
            cell.seletcIndexPath = indexPath.row
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstNib = UINib(nibName: "SavedSuggestions", bundle: nil)
        collectionViewOutlet.register(firstNib, forCellWithReuseIdentifier: "SavedSuggestions")
        collectionViewOutlet.setCollectionViewLayout(generateLayout(), animated: true)
        
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout{(section,env) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets.leading = 16
            group.contentInsets.trailing = 16
            group.contentInsets.bottom = 20
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.top = 16
            return section
                                                   
            
        }
        return layout
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
