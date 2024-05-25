//
//  DataModel.swift
//  BagPacker
//
//  Created by Abhay singh on 25/05/24.
//

import Foundation

struct ClothesData{
    
    var imageName: String
}

class BagPackerDataModel{
    
    static var clothData : [ClothesData] = [ClothesData(imageName: "Image_1"),
                                            ClothesData(imageName: "Image_2"),
                                            ClothesData(imageName: "Image_3"),
                                            ClothesData(imageName: "Image_4"),
                                            ClothesData(imageName: "Image_5"),
                                            ClothesData(imageName: "Image_6"),
                                            ClothesData(imageName: "Image_1"),
                                            ClothesData(imageName: "Image_2"),
                                            ClothesData(imageName: "Image_3"),
                                            ClothesData(imageName: "Image_4"),
                                            ClothesData(imageName: "Image_5"),
                                            ClothesData(imageName: "Image_6")]
}
