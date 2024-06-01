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
        
        let apparel1 = Apparel(image: UIImage(named: "Image_2")!, id: 2, color: .brown, pattern: .solid, type: .bottom, tag: ["Party", "Top"])
        
        let apparel2 =  Apparel(image: UIImage(named: "Image_3")!, id: 3, color: .black, pattern: .solid, type: .bottom, tag: ["Party", "Top"])
        
        let apparel3 = Apparel(image: UIImage(named: "Image_4")!, id: 4, color: .blue, pattern: .solid, type: .bottom, tag: ["Party", "Top"])
        
        let apparel4 = Apparel(image: UIImage(named: "Image_5")!, id: 5, color: .blue, pattern: .solid, type: .bottom, tag: ["Party", "Top"])
        
        wardrobe.append(apparel)
        wardrobe.append(apparel1)
        wardrobe.append(apparel2)
        wardrobe.append(apparel3)
        wardrobe.append(apparel4)
        
    }
    
    func getWardrobe() -> [Apparel] {
        wardrobe
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
}
