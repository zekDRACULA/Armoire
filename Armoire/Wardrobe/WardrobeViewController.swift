//
//  WardrobeViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 16/05/24.
//

import UIKit

class WardrobeViewController: UIViewController, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var imageToUse: UIImage = UIImage(named: "Image_1")!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tabBarItem.title = "Wardrobe"
        self.tabBarItem.image = UIImage(systemName: "hanger")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return MainDataModel.tags.count
        case 1:
            return MainDataModel.Wardrobe.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WardrobeTag", for: indexPath) as! WardrobeTagCollectionViewCell
            let buttonTitle = MainDataModel.tags[indexPath.row]
            cell.tagButton.setTitle("\(buttonTitle)", for: .normal)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WardrobeApparel", for: indexPath) as! WardrobeApparelCollectionViewCell
            cell.apparelImage.image = MainDataModel.Wardrobe[indexPath.row].image
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WardrobeTag", for: indexPath) as! WardrobeTagCollectionViewCell
            let buttonTitle = MainDataModel.tags[indexPath.row]
            cell.tagButton.setTitle("\(buttonTitle)", for: .normal)
            return cell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting tab bar item
        tabBarItem.title = "Wardrobe"
        tabBarItem.image = UIImage(systemName: "hanger")
        
        // setting nib files for collection view
        let firstNib = UINib(nibName: "WardrobeTag", bundle: nil)
        collectionView.register(firstNib, forCellWithReuseIdentifier: "WardrobeTag")
        
        let secondNib = UINib(nibName: "WardrobeApparel", bundle: nil)
        collectionView.register(secondNib, forCellWithReuseIdentifier: "WardrobeApparel")
        
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
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 8
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .absolute(40))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.top = 16
                section.contentInsets.leading = 16
                section.orthogonalScrollingBehavior = .continuous
                return section
                
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 20
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
                group.contentInsets.bottom = 20
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.top = 20
                section.contentInsets.leading = 16
                return section
            
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 8
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .absolute(40))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.orthogonalScrollingBehavior = .continuous
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
    }
    
    // to use image in details screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails"{
//            let something = segue.destination as! DetailsTableViewController
//            something.imageToUse = imageToUse
            
        }
    }
}
