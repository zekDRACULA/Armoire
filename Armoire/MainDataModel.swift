//
//  MainDataModel.swift
//  Armoire
//
//  Created by Hitesh Rupani on 25/05/24.
//

import Foundation
import UIKit

class MainDataModel {

    static var tags: [String] = ["Summer", "Winter", "Top", "Bottom", "Dress"]

    static var wardrobe: [Apparel] = [
        Apparel(image: UIImage(named: "Image_1")!, id: 1, color: .black, pattern: .solid, type: .top, tag: ["Party", "Top"], isFavourite: true),
        Apparel(image: UIImage(named: "Image_2")!, id: 2, color: .brown, pattern: .solid, type: .bottom, tag: ["Party", "Top"]),
        Apparel(image: UIImage(named: "Image_3")!, id: 3, color: .black, pattern: .solid, type: .bottom, tag: ["Party", "Top"]),
        Apparel(image: UIImage(named: "Image_4")!, id: 4, color: .blue, pattern: .solid, type: .bottom, tag: ["Party", "Top"]),
        Apparel(image: UIImage(named: "Image_5")!, id: 5, color: .blue, pattern: .solid, type: .bottom, tag: ["Party", "Top"])
    ]

    static var favourites: [Apparel] = wardrobe.filter{$0.isFavourite}
    
    static var outfits: [Outfit] = [
        Outfit(top: Apparel(image: UIImage(named: "Image_1")!, id: 1, color: .black, pattern: .solid, type: .top, tag: ["Party", "Top"], isFavourite: true),
               bottom: Apparel(image: UIImage(named: "Image_2")!, id: 2, color: .brown, pattern: .solid, type: .bottom, tag: ["Party", "Top"])),
        Outfit(top: Apparel(image: UIImage(named: "Image_1")!, id: 1, color: .black, pattern: .solid, type: .top, tag: ["Party", "Top"], isFavourite: true),
               bottom: Apparel(image: UIImage(named: "Image_3")!, id: 3, color: .black, pattern: .solid, type: .bottom, tag: ["Party", "Top"])),
        Outfit(top: Apparel(image: UIImage(named: "Image_1")!, id: 1, color: .black, pattern: .solid, type: .top, tag: ["Party", "Top"], isFavourite: true),
               bottom: Apparel(image: UIImage(named: "Image_4")!, id: 4, color: .blue, pattern: .solid, type: .bottom, tag: ["Party", "Top"])),
        Outfit(top: Apparel(image: UIImage(named: "Image_1")!, id: 1, color: .black, pattern: .solid, type: .top, tag: ["Party", "Top"], isFavourite: true),
                       bottom: Apparel(image: UIImage(named: "Image_5")!, id: 5, color: .blue, pattern: .solid, type: .bottom, tag: ["Party", "Top"])),
    ]
}

struct Apparel {
    var image: UIImage
    var id: Int
    var color: UIColor
    var pattern: Pattern
    var type: OfType?
    var tag: [String]
    var isFavourite: Bool = false
}

struct Outfit {
    var top: Apparel
    var bottom: Apparel
}

enum Pattern {
    case solid, stripes, checks, printed, dots, floral
}

enum OfType {
    case top, bottom
}

struct CalendarEventInfo {
    var eventTitle:String
    var eventStartDate:Date
    var eventEndDate:Date
    var eventLocation:String

    
}

class AllAddedEventDetails {
    
    
    static var allEventsinformation:[CalendarEventInfo] = []
}
