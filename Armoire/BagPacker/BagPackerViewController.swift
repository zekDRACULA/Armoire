//
//  BagPackerViewController.swift
//  Armoire
//
//  Created by Abhay singh on 24/05/24.
//

import UIKit

class BagPackerViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    var clothImages : [String] = ["Image_1", "Image_2","Image_3", "Image_4","Image_5", "Image_6", "Image_7","Image_1", "Image_2","Image_3", "Image_4","Image_5", "Image_6", "Image_7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clothImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BagPackerCollectionViewCell
        cell.imageView.image = UIImage(named: clothImages[indexPath.row])
        return cell
    }

//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 
//    }
    
}
