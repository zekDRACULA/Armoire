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
    
//select and deseletItemRow at refresh the UIView so changes can be shows by updating 
//    them inside selected and deselet method if they are connected to those func
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if !selectedCellIndexPath.contains(indexPath){
                selectedCellIndexPath.append(indexPath)
            }
            if let cell = collectionView.cellForItem(at: indexPath) as? ClothesCellCollectionViewCell{
                cell.imageView.backgroundColor = UIColor(named: "selected")
            }
        print(selectedCellIndexPath.count)
        updateFloatingViewLabel()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let index = selectedCellIndexPath.firstIndex(of: indexPath){
            selectedCellIndexPath.remove(at: index)
        }
        if let cell = collectionView.cellForItem(at: indexPath) as? ClothesCellCollectionViewCell{
            cell.imageView.backgroundColor = UIColor(named: "foreground")
        }
        print(selectedCellIndexPath.count)
        updateFloatingViewLabel()
    }
    
    
    
    var countLabel : UILabel!
    
    @IBOutlet var bagPackerCollectionView: UICollectionView!
    @IBOutlet var BagPackerNavigationBar: UINavigationBar!
    
    var selectedCellIndexPath = [IndexPath]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let clothesCellNib = UINib(nibName: "clothesCell", bundle: nil)
        bagPackerCollectionView.register(clothesCellNib, forCellWithReuseIdentifier: "clothesCell")
        bagPackerCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
        bagPackerCollectionView.dataSource = self
        bagPackerCollectionView.delegate = self
        bagPackerCollectionView.allowsMultipleSelection = true
        print(selectedCellIndexPath.count)
        view.addSubview(floatingView)
        floatingView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            floatingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            floatingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            floatingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            floatingView.widthAnchor.constraint(equalToConstant: 350),
            floatingView.heightAnchor.constraint(equalToConstant:  57)
        ])
        configureFloatingViewForItemCountLabel()
        configureFloatingViewForIcon()
    }
    
    
    
    // floating view
    var floatingView: UIView = {
           let view = UIView()
           view.backgroundColor = UIColor(named: "floatingViewColor")
           view.layer.cornerRadius = 14.0
           return view
       }()
    
  
    // this configures the item count in the floating View
    func configureFloatingViewForItemCountLabel(){
        
        countLabel = UILabel()
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.text = String(selectedCellIndexPath.count) + " Items in the Bag"
        countLabel.textColor = .black
        countLabel.font = UIFont.systemFont(ofSize: 20)
        
        floatingView.addSubview(countLabel)
        
        NSLayoutConstraint.activate([
            countLabel.leadingAnchor.constraint(equalTo: floatingView.leadingAnchor, constant: 16),
            countLabel.centerYAnchor.constraint(equalTo: floatingView.centerYAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 30),
            countLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // this configures the bag icon in the floating View
    func configureFloatingViewForIcon(){
        let bagIcon = UIImageView()
        bagIcon.image = UIImage(systemName: "gym.bag")
        bagIcon.tintColor =  .black   /*UIColor(named: "assentColor")*/
        bagIcon.contentMode = .scaleAspectFill
        bagIcon.translatesAutoresizingMaskIntoConstraints = false
        
        floatingView.addSubview(bagIcon)
        
        NSLayoutConstraint.activate([
            bagIcon.trailingAnchor.constraint(equalTo: floatingView.trailingAnchor, constant: -24),
            bagIcon.centerYAnchor.constraint(equalTo: floatingView.centerYAnchor),
            bagIcon.widthAnchor.constraint(equalToConstant: 30),
            bagIcon.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    //this updates the item count each time a cell is selected or deselected
    //and this is callled in select and deselect functions
    func updateFloatingViewLabel(){
        countLabel.text = String(selectedCellIndexPath.count) + " Items in the Bag"    }
    
    
    
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
