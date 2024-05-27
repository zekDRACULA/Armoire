//
//  BagPackerDetailViewController.swift
//  Armoire
//
//  Created by Abhay singh on 26/05/24.
//

import UIKit

class BagPackerDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BagPackerDetailCell", for: indexPath) as! BagPackerDetailCollectionViewCell
        cell.imageView.image = UIImage(named: selectedItems[indexPath.row].imageName)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    @IBOutlet var BagPackerDetailCollectionView: UICollectionView!
    
    var selectedItems: [ClothesData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bagPackerDetailCellNib = UINib(nibName: "BagPackerDetailCollectionViewCell", bundle: nil)
        BagPackerDetailCollectionView.register(bagPackerDetailCellNib, forCellWithReuseIdentifier: "BagPackerDetailCell")
        
        BagPackerDetailCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
        BagPackerDetailCollectionView.delegate = self
        BagPackerDetailCollectionView.dataSource = self
        print(selectedItems.count)

    }
    
    func generateLayout() -> UICollectionViewLayout{
       
        let layout = UICollectionViewCompositionalLayout{(section, env) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(100))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(137))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 0)
            
            return section
            
        }
            return layout
        }
    

}
