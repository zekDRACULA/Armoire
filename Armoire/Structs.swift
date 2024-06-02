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
    var color: UIColor
    var pattern: Pattern
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

enum Pattern{
    case solid, stripes, checks, printed, dots, floral
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

