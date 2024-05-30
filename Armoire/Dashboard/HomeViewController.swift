//
//  HomeViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 16/05/24.
//

import UIKit


class HomeViewController: UIViewController, UICollectionViewDataSource, HeaderCollectionViewCellDelegate {
    var isExpanded: Bool = false
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tabBarItem.title = "Home"
        self.tabBarItem.image = UIImage(systemName: "house")
    }
    
    @IBOutlet var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Hi Shreya"
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
        collectionView.register(Header.self, forSupplementaryViewOfKind: categoryHeaderId, withReuseIdentifier: headerId)
    }
    func toggleLayout(isExpanded: Bool) {
            self.isExpanded = isExpanded
            collectionView.collectionViewLayout = generateLayout()
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
            cell.waetherLabel.layer.cornerRadius = 20.0
            cell.waetherLabel.clipsToBounds = true
            cell.calenderLabel.layer.cornerRadius = 20.0
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
                
                let config = UIImage.SymbolConfiguration(hierarchicalColor: .black)
                return cell
            }
            else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OneImageHome", for: indexPath) as! oneImageCVC
                cell.image.layer.masksToBounds = false
                cell.image.layer.cornerRadius = 14.0
                cell.viewImage.layer.masksToBounds = false
                cell.viewImage.layer.cornerRadius = 14.0
                return cell
            }
//            cell.viewImage.layer.shadowColor = UIColor.gray.cgColor
//            cell.viewImage.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
//            cell.viewImage.layer.shadowOpacity = 1.0
            
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "footer", for: indexPath) as! footerCollectionViewCell
            
            cell.homeViewController = self

            cell.compatibility.layer.cornerRadius = 10.0
            cell.compatibility.clipsToBounds = true
            
            

            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "header", for: indexPath) as! headerCollectionViewCell
            return cell
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func generateLayout()->UICollectionViewCompositionalLayout{
        return  UICollectionViewCompositionalLayout{(section, env)-> NSCollectionLayoutSection? in
            switch section {
            case 0:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 8
                let groupSize: NSCollectionLayoutSize
                if self.isExpanded {
                    groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(500))
                } else {
                    groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(442))
                }
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//                row spacing ke liye
                let section = NSCollectionLayoutSection(group: group)
//                column ke space ke liye
                section.contentInsets.leading = 16
                
                return section
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 32
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(386))

                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                
                return section
                
            
            case 2:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(149))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                // creating the group size
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                //        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
 //               group.contentInsets.leading = 16
                let section = NSCollectionLayoutSection(group: group)
 //               section.orthogonalScrollingBehavior = .paging
                section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 0)
 //               section.contentInsets.leading = 16
                section.boundarySupplementaryItems = [
                 .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: self.categoryHeaderId, alignment: .topLeading)
                ]
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
    }
    let headerId = "headerId"
    let categoryHeaderId = "More"
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
//        header.backgroundColor = .cyan
        return header
    }
    
}
class Header: UICollectionReusableView{
    let label = UILabel()
    override init(frame: CGRect){
        super.init(frame: frame)
        
        label.text = "More"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        addSubview(label)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

