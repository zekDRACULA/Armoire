//
//  DataModel.swift
//  BagPacker
//
//  Created by Abhay singh on 25/05/24.
//

import Foundation

struct ClothesData{
    
    var imageName: String
    var imageType : String
    var imageColor : String
}

class BagPackerDataModel{
    
    static var clothData : [ClothesData] = [ClothesData(imageName: "Image_1",imageType: "Top", imageColor: "Black"),
                                            ClothesData(imageName: "Image_2",imageType: "Skirt", imageColor: "Brown"),
                                            ClothesData(imageName: "Image_3",imageType: "Skirt", imageColor: "Black"),
                                            ClothesData(imageName: "Image_4",imageType: "Jeans", imageColor: "Blue"),
                                            ClothesData(imageName: "Image_5",imageType: "Skirt", imageColor: "Blue"),
                                            ClothesData(imageName: "Image_6",imageType: "Top", imageColor: "Black"),
                                            ClothesData(imageName: "Image_1",imageType: "Top", imageColor: "Black"),
                                            ClothesData(imageName: "Image_2",imageType: "Skirt", imageColor: "Brown"),
                                            ClothesData(imageName: "Image_3",imageType: "Skirt", imageColor: "Black"),
                                            ClothesData(imageName: "Image_4",imageType: "Jeans", imageColor: "Blue"),
                                            ClothesData(imageName: "Image_5",imageType: "Skirt", imageColor: "Blue"),
                                            ClothesData(imageName: "Image_6",imageType: "Top", imageColor: "Black")]
}
