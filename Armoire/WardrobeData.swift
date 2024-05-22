//
//  WardrobeData.swift
//  Armoire
//
//  Created by Hitesh Rupani on 22/05/24.
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
                                             WardrobeTag(title: "Jeans"),
                                             WardrobeTag(title: "hjj"),
                                             WardrobeTag(title: "Jeffans"),
                                             WardrobeTag(title: "qwweans")
    ]
    
    static var wardrobeItem: [WardrobeItem] = [WardrobeItem(imageName: "Image_1"),
                                               WardrobeItem(imageName: "Image_2"),
                                               WardrobeItem(imageName: "Image_3"),
                                               WardrobeItem(imageName: "Image_4"),
                                               WardrobeItem(imageName: "Image_5")]
    
}
