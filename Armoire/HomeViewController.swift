//
//  HomeViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 16/05/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tabBarItem.title = "Home"
        self.tabBarItem.image = UIImage(systemName: "house")
    }
    
    @IBOutlet var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.title = "Home"
        tabBarItem.image = UIImage(systemName: "house")
        // Do any additional setup after loading the view.
        let firstNib = UINib(nibName: "header", bundle: nil)
        let secondNib = UINib(nibName: "image", bundle: nil)
        let thirdNib = UINib(nibName: "footer", bundle: nil)
        
        collectionView.register(firstNib, forCellWithReuseIdentifier: "header")
        collectionView.register(secondNib, forCellWithReuseIdentifier: "image")
        collectionView.register(thirdNib, forCellWithReuseIdentifier: "footer")
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return DataModel.section1.count
        case 1:
            return DataModel.section2.count
        case 2:
            return DataModel.section3.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "header", for: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "footer", for: indexPath)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "header", for: indexPath)
            return cell
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func generateLayout()->UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout{(section, env)-> NSCollectionLayoutSection? in
            switch section {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.90), heightDimension: .fractionalHeight(0.90))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(500))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
//                row spacing ke liye
                group.interItemSpacing = NSCollectionLayoutSpacing.fixed(8.0)
                
                let section = NSCollectionLayoutSection(group: group)
//                column ke space ke liye
                section.interGroupSpacing = 8.0
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                return section
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(500))

                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                return section
                
            
            case 2:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
                group.interItemSpacing = NSCollectionLayoutSpacing.fixed(8.0)
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 8.0
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                return section
                
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.90), heightDimension: .absolute(500))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                return section
                
            }
        }
        return layout
    }

    
    


}
