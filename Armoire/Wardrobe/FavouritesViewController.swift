//
//  FavouritesViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 27/05/24.
//

import UIKit

class FavouritesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("haloo")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MainDataModel.favourites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WardrobeApparel", for: indexPath) as! WardrobeApparelCollectionViewCell
        cell.apparelImage.image = MainDataModel.favourites[indexPath.row].image
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "WardrobeApparel", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "WardrobeApparel")
        
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
        collectionView.dataSource = self
        
        collectionView.delegate = self
    }
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
