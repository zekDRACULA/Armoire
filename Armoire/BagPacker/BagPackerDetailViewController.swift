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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! BagPackerDetailCollectionViewCell
        cell.imageView.image = UIImage(named: selectedItems[indexPath].imageName)
        return cell
    }
    

    var selectedItems: [IndexPath] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedItems.count)
    }
    
    

}
