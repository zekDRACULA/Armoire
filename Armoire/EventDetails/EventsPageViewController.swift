//
//  EventViewController.swift
//  Armoire
//
//  Created by Abhay singh on 28/05/24.
//

import UIKit

class EventsPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return EventDataModel.eventData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCell", for: indexPath) as! EventCollectionViewCell
        cell.eventDate.text = EventDataModel.eventData[indexPath.row].eventDate
        cell.eventTitle.text = EventDataModel.eventData[indexPath.row].eventTitle
        cell.eventLocation.text = EventDataModel.eventData[indexPath.row].eventLocation
        cell.eventDuration.text = EventDataModel.eventData[indexPath.row].eventDuration
        cell.eventType.backgroundColor = UIColor(named: "AccentColor")
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    @IBOutlet var eventPageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}
