//
//  HomeModel.swift
//  Armoire
//
//  Created by Kanika Gupta on 20/05/24.
//

import Foundation
struct Section1Data{
    var label:String
    var button1: String
    var button2: String
    var button3: String
}

struct Section2Data{
    var image1:String
    var image2: String
}


struct Section3Data{
    var heading:String
    var compatibility:String
    var travel: String
}




class DataModel{
   static var section1:[Section1Data] = [Section1Data(label: "Party", button1: "Party", button2: "Meeting", button3: "Wardrobe")]
    
   static var section2:[Section2Data] = [Section2Data(image1: "Image_1", image2: "Image_2"), Section2Data(image1: "Image_1", image2: "Image_2"), Section2Data(image1: "Image_1", image2: "Image_2"), Section2Data(image1: "Image_1", image2: "Image_2")]
    
   static var section3:[Section3Data] = [Section3Data(heading: "More Suggestion", compatibility: "Check Compatibility", travel: "Travel Bag Planner")]
}
