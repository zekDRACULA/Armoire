//
//  WardrobeViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 16/05/24.
//

import UIKit

class WardrobeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    var imageToUse: UIImage = UIImage(named: "Image_1")!
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return WardrobeData.wardrobeTag.count
//        case 1:
//            return WardrobeData.wardrobeItem.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WardrobeTag", for: indexPath) as! WardrobeTagCollectionViewCell
            let buttonTitle = WardrobeData.wardrobeTag[indexPath.row].title
            cell.tagButton.setTitle("\(buttonTitle)", for: .normal)
            return cell
//        case 1:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WardrobeItem", for: indexPath) as! WardrobeItemCollectionViewCell
//            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WardrobeTag", for: indexPath)
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tabBarItem.title = "Wardrobe"
        self.tabBarItem.image = UIImage(systemName: "hanger")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting tab bar item
        tabBarItem.title = "Wardrobe"
        tabBarItem.image = UIImage(systemName: "hanger")
        
        // setting nib files for collection view
        let firstNib = UINib(nibName: "WardrobeTag", bundle: nil)
        collectionView.register(firstNib, forCellWithReuseIdentifier: "WardrobeTag")
        
        let secondNib = UINib(nibName: "WardrobeItem", bundle: nil)
        collectionView.register(secondNib, forCellWithReuseIdentifier: "WardrobeItem")
        
        // setting collection view
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
        collectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    // to generate layout for collection view
    func generateLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
            switch section {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.1))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: WardrobeData.wardrobeTag.count)
                group.interItemSpacing = NSCollectionLayoutSpacing.fixed(4.0)
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
//                section.interGroupSpacing = NSCollectionLayoutSpacing.fixed(8)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                return section
//            case 1:
//                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.33))
//                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.90), heightDimension: .absolute(300))
////                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
//                group.interItemSpacing = NSCollectionLayoutSpacing.fixed(8.0)
//                let section = NSCollectionLayoutSection(group: group)
//                section.interGroupSpacing = 8.0
////                section.orthogonalScrollingBehavior = .groupPagingCentered
//                return section
            
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.90), heightDimension: .absolute(300))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                return section
            }
        }
        return layout
    }
    
    
    // for alert controller on pressing add button
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)})
            alertController.addAction(cameraAction)
            
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)})
            alertController.addAction(photoLibraryAction)
        }
        
        alertController.popoverPresentationController?.sourceItem = sender
        present(alertController, animated: true, completion: nil)
    }
    
    // to get image from camera and photo library selection
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        imageToUse = selectedImage
        dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "toDetails", sender: nil)
    }
    
    // for 3 dot button
    @IBAction func DotButtonTapped(_ sender: UIBarButtonItem) {
//        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//
//        // Main Menu Items
//        alertController.addAction(UIAlertAction(title: "Option 1", style: .default, handler: { _ in
//            // Handle Option 1 action
//        }))
//        alertController.addAction(UIAlertAction(title: "Option 2", style: .default, handler: { _ in
//            // Handle Option 2 action
//        }))
//
//        // Submenu Item
//        let submenuAction = UIAlertAction(title: "More Options", style: .default, handler: { _ in
//            self.showSubMenu()
//        })
//        alertController.addAction(submenuAction)
//
//        // Cancel Action
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//
//        present(alertController, animated: true)
    }

//    func showSubMenu() {
//        let submenuAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        
//        // Submenu Items
//        submenuAlert.addAction(UIAlertAction(title: "Sub Option 1", style: .default, handler: { _ in
//            // Handle Sub Option 1 action
//        }))
//        submenuAlert.addAction(UIAlertAction(title: "Sub Option 2", style: .default, handler: { _ in
//            // Handle Sub Option 2 action
//        }))
//
//        // Cancel Action
//        submenuAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//
//        present(submenuAlert, animated: true)
//    }
    
    // to use image in details screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails"{
//            let something = segue.destination as! DetailsTableViewController
//            something.imageToUse = imageToUse
            
        }
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
