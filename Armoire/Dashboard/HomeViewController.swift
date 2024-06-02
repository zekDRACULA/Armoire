//
//  HomeViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 16/05/24.
//

import UIKit
import FirebaseDatabase

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
        let second1Nib = UINib(nibName: "OneImageHome", bundle: nil)
        let thirdNib = UINib(nibName: "footer", bundle: nil)
        
        
        collectionView.register(firstNib, forCellWithReuseIdentifier: "header")
        collectionView.register(secondNib, forCellWithReuseIdentifier: "image")
        collectionView.register(second1Nib, forCellWithReuseIdentifier: "OneImageHome")
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "header", for: indexPath) as! headerCollectionViewCell
            cell.username.layer.cornerRadius = 10.0
            cell.username.clipsToBounds = true
            cell.waetherLabel.layer.cornerRadius = 10.0
            cell.waetherLabel.clipsToBounds = true
            cell.calenderLabel.layer.cornerRadius = 10.0
            cell.calenderLabel.clipsToBounds = true
            cell.partyButton.layer.cornerRadius = 8.0
            cell.partyButton.clipsToBounds = true
            cell.eventButton[0].layer.cornerRadius = 10.0
            cell.eventButton[0].clipsToBounds = true
            cell.eventButton[1].layer.cornerRadius = 10.0
            cell.eventButton[1].clipsToBounds = true
            cell.eventButton[2].layer.cornerRadius = 10.0
            cell.eventButton[2].clipsToBounds = true
            
            return cell
        case 1:
            if indexPath.row != 3{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath) as! imageCollectionViewCell
                cell.viewImage.layer.masksToBounds = false
                cell.viewImage.layer.cornerRadius = 14.0

                cell.button[indexPath.row].tintColor = .black
                let config = UIImage.SymbolConfiguration(hierarchicalColor: .black)
                cell.button[indexPath.row].setImage(UIImage(systemName: "circle.fill", withConfiguration: config), for: .normal)
                return cell
            }
            else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OneImageHome", for: indexPath) as! oneImageCVC
                cell.image.layer.masksToBounds = false
                cell.image.layer.cornerRadius = 14.0
                cell.viewImage.layer.masksToBounds = false
                cell.viewImage.layer.cornerRadius = 14.0
                let config = UIImage.SymbolConfiguration(hierarchicalColor: .black)
                cell.button[indexPath.row].setImage(UIImage(systemName: "circle.fill", withConfiguration: config), for: .normal)
                return cell
            }
//            cell.viewImage.layer.shadowColor = UIColor.gray.cgColor
//            cell.viewImage.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
//            cell.viewImage.layer.shadowOpacity = 1.0
            
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "footer", for: indexPath) as! footerCollectionViewCell
            
            cell.homeViewController = self
            
//            cell.compatibilityButton.tag = indexPath.row
//            cell.compatibilityButton.addTarget(self, action: #selector(viewDetail), for: .touchUpInside)
//            cell.travelButton.tag = indexPath.row
//            cell.travelButton.addTarget(self, action: #selector(viewDetail1), for: .touchUpInside)
 
            
            cell.compatibility.layer.cornerRadius = 10.0
            cell.compatibility.clipsToBounds = true
            cell.travel.layer.cornerRadius = 10.0
            cell.travel.clipsToBounds = true
            

            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "header", for: indexPath) as! headerCollectionViewCell
            return cell
        }
    }
//    @objc func viewDetail(sender: UIButton){
//        let home = self.storyboard?.instantiateViewController(identifier: "WardrobeCompatibilityViewController") as! CompatibilityViewController
//        self.navigationController?.pushViewController(home, animated: true)
//        
//    }
    
//    @objc func viewDetail1(sender: UIButton){
//        let ipath = IndexPath(row: sender.tag, section: 0)
//        let home = self.storyboard?.instantiateViewController(identifier: "TravelBagViewController") as! TravelBagViewController
//        self.navigationController?.pushViewController(home, animated: true)
//
//    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func generateLayout()->UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout{(section, env)-> NSCollectionLayoutSection? in
            switch section {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.90), heightDimension: .fractionalHeight(0.90))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(633), heightDimension: .absolute(463))
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
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(461), heightDimension: .absolute(386))

                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                return section
                
            
            case 2:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(396), heightDimension: .absolute(184))
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
