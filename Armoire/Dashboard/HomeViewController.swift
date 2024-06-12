//
//  HomeViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 16/05/24.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth  //for authentication
import FirebaseCore  //idk
import FirebaseStorage //for storing image
import FirebaseFirestore //for retriving image as url

class HomeViewController: UIViewController, UICollectionViewDataSource, HeaderCollectionViewCellDelegate, UICollectionViewDelegate, CollectionViewCellDelegate {
    
    //    MARK: - Variables
    var selectedOutfitFromSuggestion: Outfit?
    var isExpanded: Bool = false
    var selectedEventType: EventType = .meeting
    let headerId = "headerId"
    let categoryHeaderId = "More"
    var userName : String?
    
    // Define static arrays for event-based outfits
    var partyOutfits: [Outfit] = [ Outfit(top: UIImage(named: "Image_15")!, bottom: UIImage(named: "Image_3")!) , Outfit(top: UIImage(named: "Image_14")!, bottom: UIImage(named: "Image_8")!),Outfit(top: UIImage(named: "Image_13")!, bottom: UIImage(named: "Image_10")!), Outfit(top: UIImage(named: "Image_1")!, bottom: UIImage(named: "Image_2")!)]
    
    var presentationOutfits: [Outfit] = [ Outfit(top: UIImage(named: "Image_12")!, bottom: UIImage(named: "Image_10")!),Outfit(top: UIImage(named: "Image_6")!, bottom: UIImage(named: "Image_8")!), Outfit(top: UIImage(named: "Image_1")!, bottom: UIImage(named: "Image_4")!), Outfit(top: UIImage(named: "Image_1")!, bottom: UIImage(named: "Image_2")!)]
    
    var meetingOutfits: [Outfit] = [ Outfit(top: UIImage(named: "Image_12")!, bottom: UIImage(named: "Image_16")!), Outfit(top: UIImage(named: "Image_17")!, bottom: UIImage(named: "Image_18")!), Outfit(top: UIImage(named: "Image_6")!, bottom: UIImage(named: "Image_10")!), Outfit(top: UIImage(named: "Image_1")!, bottom: UIImage(named: "Image_18")!)]
    
    var workoutOutfits: [Outfit] = [Outfit(top: UIImage(named: "Image_1")!, bottom: UIImage(named: "Image_11")!), Outfit(top: UIImage(named: "Image_19")!, bottom: UIImage(named: "Image_20")!), Outfit(top: UIImage(named: "Image_22")!, bottom: UIImage(named: "Image_21")!), Outfit(top: UIImage(named: "Image_1")!, bottom: UIImage(named: "Image_2")!)]
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tabBarItem.title = "Home"
        self.tabBarItem.image = UIImage(systemName: "house")
        //        HomeViewController.partyOutfits = DataController.shared.getOutfits(forEventType: .party)
        //        HomeViewController.presentationOutfits = DataController.shared.getOutfits(forEventType: .presentation)
        //        HomeViewController.meetingOutfits = DataController.shared.getOutfits(forEventType: .meeting)
        //        HomeViewController.workoutOutfits = DataController.shared.getOutfits(forEventType: .workout)
        
        //        HomeViewController.partyOutfits = [DataController.shared.getOutfit(at: 0), DataController.shared.getOutfit(at: 1), DataController.shared.getOutfit(at: 3)]
        //        HomeViewController.presentationOutfits = [DataController.shared.getOutfit(at: 1), DataController.shared.getOutfit(at: 2), DataController.shared.getOutfit(at: 0)]
        //        HomeViewController.meetingOutfits = [DataController.shared.getOutfit(at: 2),
        //                                             DataController.shared.getOutfit(at: 3), DataController.shared.getOutfit(at: 1)]
        //        HomeViewController.workoutOutfits = [DataController.shared.getOutfit(at: 1), DataController.shared.getOutfit(at: 3), DataController.shared.getOutfit(at: 2)]
    }
    
    
    
    //    MARK: - Outlets
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUsername()
        
        tabBarItem.title = "Home"
        tabBarItem.image = UIImage(systemName: "house")
        // Do any additional setup after loading the view.
        let firstNib = UINib(nibName: "header", bundle: nil)
        let secondNib = UINib(nibName: "image", bundle: nil)
        let second1Nib = UINib(nibName: "OneImageHome", bundle: nil)
        let thirdNib = UINib(nibName: "footer", bundle: nil)
        
        
        collectionView.delegate = self
        
        collectionView.register(firstNib, forCellWithReuseIdentifier: "header")
        collectionView.register(secondNib, forCellWithReuseIdentifier: "image")
        collectionView.register(second1Nib, forCellWithReuseIdentifier: "OneImageHome")
        collectionView.register(thirdNib, forCellWithReuseIdentifier: "footer")
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
        collectionView.register(Header.self, forSupplementaryViewOfKind: categoryHeaderId, withReuseIdentifier: headerId)
    }
    
    //    MARK: - Defining Protocols
    // for drop down expanding and closing
    func toggleLayout(isExpanded: Bool) {
        self.isExpanded = isExpanded
        collectionView.collectionViewLayout = generateLayout()
        collectionView.reloadData()
        //        collectionView.reloadSections(IndexSet(integer: 0))
    }
    
    // for changing images according to selected event
    func eventSelected(eventType: EventType) {
        self.selectedEventType = eventType
        collectionView.reloadSections(IndexSet(integer: 1))
    }
    
    //MARK: - Defining the events
    func outfitsForEventType(_ eventType: EventType) -> [Outfit] {
        switch eventType {
        case .party:
            return partyOutfits
        case .presentation:
            return presentationOutfits
        case .meeting:
            return meetingOutfits
        case .workout:
            return workoutOutfits
        }
    }
    
    
    
    //    MARK: - Collection view functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            //            MARK: heading
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "header", for: indexPath) as! headerCollectionViewCell
            cell.delegate = self
            cell.weatherStack.layer.cornerRadius = 14.0
            cell.weatherStack.clipsToBounds = true
            
            cell.calenderLabel.layer.cornerRadius = 14.0
            cell.calenderLabel.clipsToBounds = true
            
            cell.dropDownButton.layer.cornerRadius = 14.0
            cell.dropDownButton.clipsToBounds = true
            
            cell.partyButton.layer.cornerRadius = 14.0
            cell.partyButton.clipsToBounds = true
            cell.eventButton[0].layer.cornerRadius = 14.0
            cell.eventButton[0].clipsToBounds = true
            cell.eventButton[1].layer.cornerRadius = 14.0
            cell.eventButton[1].clipsToBounds = true
            cell.eventButton[2].layer.cornerRadius = 14.0
            cell.eventButton[2].clipsToBounds = true
            
            return cell
            
        case 1:
            // MARK: making first three images according to event chosen and last is fixed
            if indexPath.row < min(outfitsForEventType(selectedEventType).count, 3) {
                // Configure cells with dynamic images
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath) as! imageCollectionViewCell
                let outfit = outfitsForEventType(selectedEventType)[indexPath.row]
                cell.configure(picture1: outfit.top, picture2: outfit.bottom)
                cell.viewImage.layer.masksToBounds = false
                cell.viewImage.layer.cornerRadius = 14.0
                return cell
            } else {
                // Fourth cell with static image
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OneImageHome", for: indexPath) as! oneImageCVC
                cell.image.layer.cornerRadius = 14.0
                cell.image.layer.masksToBounds = true
                cell.image.contentMode = .scaleAspectFill
                cell.viewImage.layer.cornerRadius = 14.0
                cell.viewImage.layer.masksToBounds = true
                cell.delegate = self
                return cell
            }
            
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "footer", for: indexPath) as! footerCollectionViewCell
            cell.homeViewController = self
            cell.compatibility.layer.cornerRadius = 14.0
            cell.compatibility.clipsToBounds = true
            cell.compatibilityButton.layer.cornerRadius = 14.0
            cell.compatibilityButton.clipsToBounds = true
            
            cell.travel.layer.cornerRadius = 14.0
            cell.travel.clipsToBounds = true
            cell.travelButton.layer.cornerRadius = 14.0
            cell.travelButton.clipsToBounds = true
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "header", for: indexPath) as! headerCollectionViewCell
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    //    MARK: - Layout of sections
    
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
                    groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(442))
                    
                } else {
                    groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(238))
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
                item.contentInsets.trailing = 16
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(386))
                
                
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
    //    MARK: - Suggestion btton of image 4 of section 1 More Suggestions
    
    func suggestionTapped(cell: oneImageCVC) {
        let storyboard = UIStoryboard(name: "TodaySuggestion", bundle: nil)
        if let nextVC = storyboard.instantiateViewController(withIdentifier: "TodaySugestionViewController") as? TodaySugestionViewController {
            if let navVC = self.navigationController {
                navVC.pushViewController(nextVC, animated: true)
            } else {
                print("Navigation controller is nil")
            }
        } else {
            print("TodaySuggestionsViewController could not be instantiated")
        }
    }
    
    
    //MARK: - fetching username
    
    func fetchUsername(){
        let db = Firestore.firestore()
        
        guard let user = Auth.auth().currentUser else{
            print("user is not authenticated")
            return
        }
        let userID = user.uid
        
        db.collection("users").document(userID).getDocument { (document, error) in
            if let error = error {
                print("Error fetching document: \(error.localizedDescription)")
                return
            }
            guard let document = document, document.exists, let data = document.data() else{
                print("document is nil")
                //                exit(1)
                return
            }
            if let username = data["username"] as? String{
                self.navigationItem.title = "Hi, \(username)"
                //print(self.usernamestore)
                //self.username = username
                //print("username in home : \(self.userName)")
                //                self.setUsername(username: username)
            }else{
                print("user name is nil")
            }
        }
        //        return username!
    }
    
    // MARK: - For heading of section 2("More")
    
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
        label.font = UIFont.boldSystemFont(ofSize: 18)
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

