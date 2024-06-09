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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BagPackerDetailCollectionViewCell", for: indexPath) as! BagPackerDetailCollectionViewCell
        let item = selectedItems[indexPath.row]
        cell.imageView.image = item.image
        cell.clothType.text =  item.category
        cell.clothColor.text = "blue"
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    @IBOutlet var BagPackerDetailCollectionView: UICollectionView!
    @IBOutlet weak var DoneBarButton : UIBarButtonItem!
    
    @IBOutlet weak var deleteButton : UIBarButtonItem!
    @IBOutlet weak var buttomNavigation : UINavigationBar!
    
    
    
    
    var selectedItems: [Apparel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bagPackerDetailCellNib = UINib(nibName: "BagPackerDetailCollectionViewCell", bundle: nil)
        BagPackerDetailCollectionView.register(bagPackerDetailCellNib, forCellWithReuseIdentifier: "BagPackerDetailCollectionViewCell")
        
        BagPackerDetailCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
        BagPackerDetailCollectionView.delegate = self
        BagPackerDetailCollectionView.dataSource = self

    }
    
    func generateLayout() -> UICollectionViewLayout{
       
        let layout = UICollectionViewCompositionalLayout{(section, env) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(137))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 16)
            return section
            
        }
            return layout
        }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
