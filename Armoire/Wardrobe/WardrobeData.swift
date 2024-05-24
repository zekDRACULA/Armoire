//
//  WardrobeData.swift
//  Armoire
//
//  Created by Hitesh Rupani on 23/05/24.
//

import Foundation

struct WardrobeTag {
    var title: String
}

struct WardrobeItem {
    var imageName: String
}

class WardrobeData {
    static var wardrobeTag: [WardrobeTag] = [WardrobeTag(title: "Summer"),
                                             WardrobeTag(title: "Black"),
                                             WardrobeTag(title: "Dress"),
                                             WardrobeTag(title: "Jeans")
    ]
    
    static var wardrobeItem = ["Image_1", "Image_2", "Image_3", "Image_4", "Image_5"]
    
}
