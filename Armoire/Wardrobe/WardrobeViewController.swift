//
//  WardrobeViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 16/05/24.
//

import UIKit
import CoreML
import Vision
import FirebaseAuth  //for authentication
import FirebaseCore  //idk
import FirebaseStorage //for storing image
import FirebaseDatabase //for retriving image as url


class WardrobeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    // apparels to be displayed in the collection view
    var apparelsToDisplay: [Apparel] = []{
        didSet{
            collectionView.reloadData()
        }
    }

    // image stored here, to be used for, adding new apparel
    var imageToUse: UIImage = UIImage(named: "Image_1")!
    
    // apparel that has been tapped on
    var selectedApparel: Apparel?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tabBarItem.title = "Wardrobe"
        self.tabBarItem.image = UIImage(systemName: "hanger")
    }
    
    // to store the item and use toDetails segue to see details
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let indexPath = collectionView.indexPathsForSelectedItems?.first {
            selectedApparel = apparelsToDisplay[indexPath.row]
        }
        performSegue(withIdentifier: "toDetails", sender: self)
    }
    
    // number of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    // number of items to be displayed in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return DataController.shared.countTags()
        case 1:
            return apparelsToDisplay.count
        default:
            return 0
        }
    }
    
    // using nib files to display the items in collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WardrobeTag", for: indexPath) as! WardrobeTagCollectionViewCell
            let buttonTitle = DataController.shared.getTags(with: indexPath.row)
            cell.tagButton.setTitle("\(buttonTitle)", for: .normal)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WardrobeApparel", for: indexPath) as! WardrobeApparelCollectionViewCell
            cell.delegate = self
            cell.indexPath = indexPath
            print(cell.indexPath)
            apparelsToDisplay[indexPath.row].isFavourite ? cell.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal) : cell.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            cell.apparelImage.image = apparelsToDisplay[indexPath.row].image
//            cell.heartButton.addTarget(self, action: #selector(setIsFavourite), for: .touchUpInside)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WardrobeTag", for: indexPath) as! WardrobeTagCollectionViewCell
            let buttonTitle = DataController.shared.getTags(with: indexPath.row)
            cell.tagButton.setTitle("\(buttonTitle)", for: .normal)
            return cell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting tab bar item
        tabBarItem.title = "Wardrobe"
        tabBarItem.image = UIImage(systemName: "hanger")
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .foreground
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        changedSegment(segmentedControl)
        
        collectionView.reloadData()
        // setting nib files for collection view
        let firstNib = UINib(nibName: "WardrobeTag", bundle: nil)
        collectionView.register(firstNib, forCellWithReuseIdentifier: "WardrobeTag")
        
        let secondNib = UINib(nibName: "WardrobeApparel", bundle: nil)
        collectionView.register(secondNib, forCellWithReuseIdentifier: "WardrobeApparel")
        
        // setting collection view
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        collectionView.reloadData()
//    }
    
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
    
//    @IBAction private func setIsFavourite() {
//        print("Set as Favourite")
//    }
    
    @IBAction func changedSegment(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        // for all
        case 0:
            apparelsToDisplay = DataController.shared.getWardrobe()
            collectionView.reloadData()
            
        // for tops
        case 1:
            apparelsToDisplay = DataController.shared.getWardrobe().filter { $0.type == .top }
            collectionView.reloadData()
            
        // for bottoms
        case 2:
            apparelsToDisplay = DataController.shared.getWardrobe().filter { $0.type == .bottom}
            collectionView.reloadData()
            
        default:
            apparelsToDisplay = DataController.shared.getWardrobe()
            collectionView.reloadData()
        }
    }
    

    
    // for alert controller on pressing + button
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
        
        //uploadPhoto()
    }
    
    // to get image from camera and photo library selection
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        imageToUse = selectedImage
        
        //from here
        
        //uploadPhoto()
        
        //converting image to Ciimage for ml model processing
        guard let ciimage = CIImage(image: selectedImage) else {
            fatalError("Could Not conver UIimage to CIimage")
        }
        
        // MARK: have to remove below comment to run the model
        //detect(image: ciimage)
        
        dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "toAdd", sender: nil)
    }
    

    //func for uploading image in forebase storage
    
    
    
    
    
    //making func for using ml model in that photo
    
    func detect(image:CIImage) {
        
        
        guard let model = try? VNCoreMLModel(for: ClothTypeClassifier().model) else {
            fatalError("Loading CoreML model Failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else{
                fatalError("Model failed to process image")
            }
            print(results)
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])

        }
        catch {
            print(error)
        }
        
        
        
    }
    

    // to pass data according to the source of segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let itemDetailsTVC = segue.destination as! ItemDetailsTableViewController
//        itemDetailsTVC.segueIdentifier = segue.identifier
        
        if segue.identifier == "toAdd"{
            let itemDetailsTVC = segue.destination as! ItemDetailsTableViewController
            itemDetailsTVC.segueIdentifier = segue.identifier
            selectedApparel = Apparel(image: imageToUse, id: 123, color: .red, pattern: .solid,type: .top, tag: ["Summer"])
            itemDetailsTVC.apparel = selectedApparel
        }

        if segue.identifier == "toDetails" {
            let itemDetailsTVC = segue.destination as! ItemDetailsTableViewController
            itemDetailsTVC.segueIdentifier = segue.identifier
            itemDetailsTVC.apparel = selectedApparel
        }
    }
}

extension WardrobeViewController: WardrobeApparelCollectionViewCellDelegateProtocol {
    func toggleIsFavourite(sender: WardrobeApparelCollectionViewCell, indexPath: IndexPath) {
//        sender.delegate = self
        apparelsToDisplay[indexPath.row].isFavourite.toggle()
        DataController.shared.setWardrobe(with: indexPath.row, isFavourite: apparelsToDisplay[indexPath.row].isFavourite)
        collectionView.reloadData()
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            sender.heartButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.heartButton.transform = CGAffineTransform(scaleX: 1, y: 1)
//            sender.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    

    
    
}
