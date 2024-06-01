//
//  Structs.swift
//  Armoire
//
//  Created by Hitesh Rupani on 31/05/24.
//

import Foundation
import UIKit

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

