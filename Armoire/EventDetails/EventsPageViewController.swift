//
//  EventViewController.swift
//  Armoire
//
//  Created by Abhay singh on 28/05/24.
//

import UIKit

class EventsPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var indexPathOfSelected:Int?

    @IBOutlet weak var noEventsLabel: UILabel!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataController.shared.countEvents()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCell", for: indexPath) as! EventCollectionViewCell
        
        // for just picking the day and date and removing the time from the data
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d yyyy"
        
        let eventStartFormattedDate = dateFormatter.string(from: DataController.shared.getEvents()[indexPath.row].eventStartDate)
        
//        cell.eventDate.text = "\(AllAddedEventDetails.allEventsinformation[indexPath.row].eventStartDate)"
        cell.eventDate.text = eventStartFormattedDate
        cell.eventTitle.text = DataController.shared.getEvents()[indexPath.row].eventTitle
        cell.eventLocation.text = DataController.shared.getEvents()[indexPath.row].eventLocation
        cell.eventType.backgroundColor = UIColor(named: "AccentColor")
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexPathOfSelected = indexPath.row
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d yyyy"
        
        let eventStartFormattedDate = dateFormatter.string(from: DataController.shared.getEvents()[indexPath.row].eventStartDate)
        
        let eventEndFormattedDate = dateFormatter.string(from: DataController.shared.getEvents()[indexPath.row].eventEndDate)
        
        
        
//        let startDate = DataController.shared.getEvents()[indexPath.row].eventStartDate
//        let endDate = DataController.shared.getEvents()[indexPath.row].eventEndDate
        
        if eventStartFormattedDate == eventEndFormattedDate{
            performSegue(withIdentifier: "toFullDetailsPage", sender: self)

        }
        else{
            performSegue(withIdentifier: "toBagPacker", sender: self)
        }
        
    }
    
    
    @IBOutlet var eventPageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if DataController.shared.countEvents() != 0 {
            noEventsLabel.isHidden = true
        }
        let eventCellNib = UINib(nibName: "EventCell", bundle: nil)
        eventPageCollectionView.register(eventCellNib, forCellWithReuseIdentifier: "EventCell")
        eventPageCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
        eventPageCollectionView.dataSource = self
        eventPageCollectionView.delegate = self
        print(EventDataModel.eventData.count)
    }

    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout{(secttion, env) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets.bottom = 16
            item.contentInsets.trailing = 16
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 0)
            return section
        }
        return layout
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFullDetailsPage"{
            let something = segue.destination as! EventFullDetailsViewController
            something.indexPathOfSelcted = indexPathOfSelected
        }
        else{
            let something = segue.destination as! EventPackYourBagViewController
            something.indexPathofSelected = indexPathOfSelected
        }
    }
    
    @IBAction func unwindToEventsPageViewController(segue:UIStoryboardSegue){
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
}
