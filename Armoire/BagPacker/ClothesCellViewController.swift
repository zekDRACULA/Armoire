//
//  ClothesCellViewController.swift
//  BagPacker
//
//  Created by Abhay singh on 25/05/24.
//

import UIKit

class ClothesCellViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return BagPackerDataModel.clothData.count
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clothesCell", for: indexPath) as! ClothesCellCollectionViewCell
        cell.imageView.image = UIImage(named: BagPackerDataModel.clothData[indexPath.row].imageName)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectedData = BagPackerDataModel.clothData[indexPath.row].imageName
        print(selectedData)
    }
    
    @IBOutlet var bagPackerCollectionView: UICollectionView!
    @IBOutlet var BagPackerNavigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let clothesCellNib = UINib(nibName: "clothesCell", bundle: nil)
        bagPackerCollectionView.register(clothesCellNib, forCellWithReuseIdentifier: "clothesCell")
        bagPackerCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
        bagPackerCollectionView.dataSource = self
        bagPackerCollectionView.delegate = self
    }
    
    
    
    func generateLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout{(section, env) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(176), heightDimension: .absolute(276))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets.bottom = 16
            item.contentInsets.trailing = 16
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(276))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 0)
            
            return section
        }
        return layout
    }
}
