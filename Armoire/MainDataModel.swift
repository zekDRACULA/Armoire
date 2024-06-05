////
////  MainDataModel.swift
////  Armoire
////
////  Created by Hitesh Rupani on 25/05/24.
////
//
//import Foundation
//import UIKit
//
//class MainDataModel {
//    
//    
//    enum Pattern {
//        case solid, stripes, checks, printed, dots, floral
//    }
//    
//    static var tags: [String] = ["Summer", "Winter", "Top", "Bottom", "Dress"]
//    
//    static var Wardrobe: [Apparel] = [
//        Apparel(image: UIImage(named: "Image_1")!, id: 1, color: .black, pattern: .solid, tag: ["Party", "Top"]),
//        Apparel(image: UIImage(named: "Image_2")!, id: 2, color: .black, pattern: .solid, tag: ["Party", "Top"]),
//        Apparel(image: UIImage(named: "Image_3")!, id: 3, color: .black, pattern: .solid, tag: ["Party", "Top"]),
//        Apparel(image: UIImage(named: "Image_4")!, id: 4, color: .black, pattern: .solid, tag: ["Party", "Top"]),
//        Apparel(image: UIImage(named: "Image_5")!, id: 5, color: .black, pattern: .solid, tag: ["Party", "Top"])
//    ]
//    
//    static var Favourites: [Apparel] = [
//        Apparel(image: UIImage(named: "Image_1")!, id: 1, color: .black, pattern: .solid, tag: ["Party", "Top"]),
//        Apparel(image: UIImage(named: "Image_2")!, id: 2, color: .black, pattern: .solid, tag: ["Party", "Top"]),
//        Apparel(image: UIImage(named: "Image_3")!, id: 3, color: .black, pattern: .solid, tag: ["Party", "Top"])
//    ]
//    
//    
//    static var partyOutfits: [Outfit] = [
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[1]),
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[2]),
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[3]),
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[4])
//    ]
//    
//    static var meetingOutfits: [Outfit] = [
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[2]),
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[3]),
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[4]),
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[1])
//    ]
//    
//    static var presentationOutfits: [Outfit] = [
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[3]),
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[4]),
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[1]),
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[2])
//    ]
//    
//    static var workoutOutfits: [Outfit] = [
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[4]),
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[1]),
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[2]),
//        Outfit(top: Wardrobe[0], bottom: Wardrobe[3])
//    ]
//    
//}
