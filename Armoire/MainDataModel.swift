//
//  MainDataModel.swift
//  Armoire
//
//  Created by Hitesh Rupani on 25/05/24.
//

import Foundation
import UIKit

class MainDataModel {
    struct Apparel {
        var image: UIImage
        var id: Int
        var color: UIColor
        var pattern: Pattern
        var tag: [String]
    }

    struct Outfit {
        var top: Apparel
        var bottom: Apparel
    }

    enum Pattern {
        case solid, stripes, checks, printed, dots, floral
    }

    static var tags: [String] = ["Summer", "Winter", "Top", "Bottom", "Dress"]

    static var Wardrobe: [Apparel] = []

    static var Favourites: [Apparel] = []

}
