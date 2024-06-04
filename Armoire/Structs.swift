//
//  Structs.swift
//  Armoire
//
//  Created by Hitesh Rupani on 31/05/24.
//

import Foundation
import UIKit

struct Apparel {
    var category : String
    var image: UIImage
    var id: Int
//   var color: String
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

struct RegisterUserRequest{
    let username : String
    let email : String
    let password : String
}

struct LoginUserRequest{
    let email : String
    let password : String
}
