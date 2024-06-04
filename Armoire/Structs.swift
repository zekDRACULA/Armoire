//
//  Structs.swift
//  Armoire
//
//  Created by Hitesh Rupani on 31/05/24.
//

import Foundation
import UIKit

struct Apparel: Equatable {
    var image: UIImage
    var id: Int
//    var color: String
    var color: UIColor
    var pattern: Pattern
//    var category: String
    var type: OfType?
    var tag: [String]
    var isFavourite: Bool = false
    
    static func == (lhs: Apparel, rhs: Apparel) -> Bool {
            return lhs.id == rhs.id
        }
}

struct Outfit: Equatable {
    var top: Apparel
    var bottom: Apparel
    static func == (lhs: Outfit, rhs: Outfit) -> Bool {
            return lhs.top == rhs.top && lhs.bottom == rhs.bottom
        }
}

enum Pattern: String {
    case solid = "Solid"
    case stripes = "Striped"
    case checks = "Checkered"
    case printed = "Printed"
    case dots = "Dots"
    case floral = "Floral"
}

enum OfType {
    case top, bottom
}

struct CalendarEvent {
    var eventTitle: String
    var eventStartDate: Date
    var eventEndDate: Date
    var eventLocation: String
}

