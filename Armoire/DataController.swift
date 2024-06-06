//
//  DataController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 31/05/24.
//

import Foundation
import UIKit

class DataController{
    
    private var wardrobe: [Apparel] = []
    private var tags: [String] = []
    private var favourites: [Apparel] = []
    
    var outfits: [Outfit] = []
    
    // for seleted outfits in suggestions page when you add event
    var selectedSuggestions:[Outfit] = []

    
    private var allCalendarEvents: [CalendarEvent] = []
    
    // simple implementation of singleton
    static let shared = DataController()
    
    // initializer
    private init() {
        loadWardrobe()
        loadFavourites()
        loadTags()
        loadOutfits()
    }
    
    // MARK: - wardrobe items
    
    func loadWardrobe() {
        let apparel = Apparel(image: UIImage(named: "Image_1")!, id: 1, color: .black, pattern: .solid, type: .top, tag: ["Party", "Top"], isFavourite: true)
        
        let apparel1 = Apparel(image: UIImage(named: "Image_2")!, id: 2, color: .brown, pattern: .solid, type: .bottom, tag: ["Party", "Bottom"])
        
        let apparel2 =  Apparel(image: UIImage(named: "Image_3")!, id: 3, color: .black, pattern: .solid, type: .bottom, tag: ["Party", "Bottom"])
        
        let apparel3 = Apparel(image: UIImage(named: "Image_4")!, id: 4, color: .blue, pattern: .solid, type: .bottom, tag: ["Party", "Bottom"])
        
        let apparel4 = Apparel(image: UIImage(named: "Image_5")!, id: 5, color: .blue, pattern: .solid, type: .bottom, tag: ["Party", "Bottom"])
        
        let apparel5 = Apparel(image: UIImage(named: "Image_1")!, id: 1, color: .black, pattern: .solid, type: .top, tag: ["Meeting", "Top"], isFavourite: true)
        
        let apparel6 = Apparel(image: UIImage(named: "Image_3")!, id: 3, color: .brown, pattern: .solid, type: .bottom, tag: ["Meeting", "Bottom"])
        
        let apparel7 =  Apparel(image: UIImage(named: "Image_4")!, id: 4, color: .black, pattern: .solid, type: .bottom, tag: ["Meeting", "Bottom"])
        
        let apparel8 = Apparel(image: UIImage(named: "Image_5")!, id: 5, color: .blue, pattern: .solid, type: .bottom, tag: ["Meeting", "Bottom"])
        
        let apparel9 = Apparel(image: UIImage(named: "Image_2")!, id: 2, color: .blue, pattern: .solid, type: .bottom, tag: ["Meeting", "Bottom"])
        
        let apparel10 = Apparel(image: UIImage(named: "Image_1")!, id: 1, color: .black, pattern: .solid, type: .top, tag: ["Presentation", "Top"], isFavourite: true)
        
        let apparel11 = Apparel(image: UIImage(named: "Image_4")!, id: 4, color: .brown, pattern: .solid, type: .bottom, tag: ["Presentation", "Bottom"])
        
        let apparel12 =  Apparel(image: UIImage(named: "Image_5")!, id: 5, color: .black, pattern: .solid, type: .bottom, tag: ["Presentation", "Bottom"])
        
        let apparel13 = Apparel(image: UIImage(named: "Image_2")!, id: 2, color: .blue, pattern: .solid, type: .bottom, tag: ["Presentation", "Bottom"])
        
        let apparel14 = Apparel(image: UIImage(named: "Image_3")!, id: 3, color: .blue, pattern: .solid, type: .bottom, tag: ["Presentation", "Bottom"])
        
        let apparel15 = Apparel(image: UIImage(named: "Image_1")!, id: 1, color: .black, pattern: .solid, type: .top, tag: ["Workout", "Top"], isFavourite: true)
        
        let apparel16 = Apparel(image: UIImage(named: "Image_5")!, id: 5, color: .brown, pattern: .solid, type: .bottom, tag: ["Workout", "Bottom"])
        
        let apparel17 =  Apparel(image: UIImage(named: "Image_2")!, id: 2, color: .black, pattern: .solid, type: .bottom, tag: ["Workout", "Bottom"])
        
        let apparel18 = Apparel(image: UIImage(named: "Image_3")!, id: 3, color: .blue, pattern: .solid, type: .bottom, tag: ["Workout", "Bottom"])
        
        let apparel19 = Apparel(image: UIImage(named: "Image_4")!, id: 4, color: .blue, pattern: .solid, type: .bottom, tag: ["Workout", "Bottom"])
        
        wardrobe.append(apparel)
        wardrobe.append(apparel1)
        wardrobe.append(apparel2)
        wardrobe.append(apparel3)
        wardrobe.append(apparel4)
        wardrobe.append(apparel5)
        wardrobe.append(apparel6)
        wardrobe.append(apparel7)
        wardrobe.append(apparel8)
        wardrobe.append(apparel9)
        wardrobe.append(apparel10)
        wardrobe.append(apparel11)
        wardrobe.append(apparel12)
        wardrobe.append(apparel13)
        wardrobe.append(apparel14)
        wardrobe.append(apparel15)
        wardrobe.append(apparel16)
        wardrobe.append(apparel17)
        wardrobe.append(apparel18)
        wardrobe.append(apparel19)
        
        
    }
    
    func getWardrobe() -> [Apparel] {
        wardrobe
    }
    
    func setWardrobe(with index: Int, isFavourite: Bool) {
        wardrobe[index].isFavourite = isFavourite
    }
    
    func getWardrobe(with index: Int) -> Apparel {
        wardrobe[index]
    }
    
    func countWardrobe() -> Int {
        wardrobe.count
    }
    
    func appendApparel(apparel: Apparel) {
        wardrobe.append(apparel)
    }
    
    // MARK: - tags
    
    func loadTags() {
        tags = ["Summer", "Winter", "Top", "Bottom", "Dress"]
    }
    
    func getTags() -> [String] {
        tags
    }
    
    func getTags(with index: Int) -> String {
        tags[index]
    }
    
    func countTags() -> Int {
        tags.count
    }
    
    func appendTag(tag: String) {
        tags.append(tag)
    }
    
    // MARK: - outfits
    
    func loadOutfits() {
        let outfit = Outfit(top: wardrobe[0], bottom: wardrobe[1])
        let outfit1 = Outfit(top: wardrobe[0], bottom: wardrobe[2])
        let outfit2 = Outfit(top: wardrobe[0], bottom: wardrobe[3])
        let outfit3 = Outfit(top: wardrobe[0], bottom: wardrobe[4])
        
        outfits.append(outfit)
        outfits.append(outfit1)
        outfits.append(outfit2)
        outfits.append(outfit3)
    }
    
    // MARK: - favourites
    
    func loadFavourites() {
        favourites = wardrobe.filter { $0.isFavourite }
    }
    
    func getFavourites() -> [Apparel] {
        favourites
    }
    
    func getFavourites(with index: Int) -> Apparel {
        favourites[index]
    }
    
    func countFavourites() -> Int {
        favourites.count
    }
    
    func appendFavourite(apparel: Apparel) {
        favourites.append(apparel)
    }
    
    // MARK: - calendar
    
    func getEvents() -> [CalendarEvent] {
        allCalendarEvents
    }
    
    func getEvents(with index: Int) -> CalendarEvent {
        allCalendarEvents[index]
    }
    
    func countEvents() -> Int {
        allCalendarEvents.count
    }
    
    func appendEvent(event: CalendarEvent) {
        allCalendarEvents.append(event)
    }
    
    func removeEvent(indexpath:Int){
        allCalendarEvents.remove(at: indexpath)
    }
    
    func getOutfits(forEventType eventType: EventType) -> [Outfit] {
        var outfits: [Outfit] = []
        
        // Filter wardrobe items for tops and bottoms matching the event type
        let tops = wardrobe.filter { $0.type == .top && $0.tag.contains(eventType.rawValue) }
        let bottoms = wardrobe.filter { $0.type == .bottom && $0.tag.contains(eventType.rawValue) }
        
        // Generate outfits combinations from filtered tops and bottoms
        for top in tops {
            for bottom in bottoms {
                outfits.append(Outfit(top: top, bottom: bottom))
            }
        }
        
        return outfits
    }

}
