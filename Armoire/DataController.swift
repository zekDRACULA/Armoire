//
//  DataController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 31/05/24.
//

import Foundation
import UIKit
import FirebaseAuth  //for authentication
import FirebaseCore  //idk
import FirebaseStorage //for storing image
import FirebaseFirestore //for retriving image as url
import CoreML
import Vision

class DataController{
    
    
    
    private var wardrobe: [Apparel] = []
    private var tags: [String] = []
    private var favourites: [Apparel] = []
     var username : String?
    var outfits: [Outfit] = []
    var usernamestore:[String] = []
    
    
    // for seleted outfits in suggestions page when you add event
    var selectedSuggestions: [Outfit] = []

    
    private var allCalendarEvents: [CalendarEvent] = []
    

    // simple implementation of singleton
    static let shared = DataController()
    
    // initializer
    private init() {
        loadWardrobe()
        loadFavourites()
        loadTags()
        loadOutfits()
        retrieveData()
    }
    
    // MARK: - wardrobe items
    
    func loadWardrobe() {
//        let apparel = Apparel(category: detect(image: CIImage(image: UIImage(named: "Image_1")!)!), image: UIImage(named: "Image_1")!, id: 1, color: .black, pattern: .solid, type: .top, tag: ["Party", "Top"], isFavourite: true)
//        let apparel1 = Apparel(category: detect(image: CIImage(image: UIImage(named: "Image_2")!)!), image: UIImage(named: "Image_2")!, id: 1, color: .black, pattern: .solid, type: .top, tag: ["Party", "Top"], isFavourite: true)
//        
//        let apparel1 = Apparel(image: UIImage(named: "Image_2")!, id: 2, color: .brown, pattern: .solid, type: .bottom, tag: ["Party", "Top"])
//        
//        let apparel2 =  Apparel(image: UIImage(named: "Image_3")!, id: 3, color: .black, pattern: .solid, type: .bottom, tag: ["Party", "Top"])
//        
//        let apparel3 = Apparel(image: UIImage(named: "Image_4")!, id: 4, color: .blue, pattern: .solid, type: .bottom, tag: ["Party", "Top"])
//        
//        let apparel4 = Apparel(image: UIImage(named: "Image_5")!, id: 5, color: .blue, pattern: .solid, type: .bottom, tag: ["Party", "Top"])
//        
//        wardrobe.append(apparel)
//        wardrobe.append(apparel1)
//        wardrobe.append(apparel2)
//        wardrobe.append(apparel3)
//        wardrobe.append(apparel4)
//        
    }
    
    
    
    func getWardrobe() -> [Apparel] {
        
        wardrobe
    }
    
    func setWardrobe(with index: Int, isFavourite: Bool) {
        wardrobe[index].isFavourite = isFavourite
    }
    
    func getWardrobe(with index: Int) -> Apparel {
        wardrobe[index]
    }
    
    func countWardrobe() -> Int {
        wardrobe.count
    }
    
    func appendApparel(apparel: Apparel) {
        wardrobe.append(apparel)
    }
    
   
    // MARK: - tags
    
    func loadTags() {
        tags = ["Blazer", "Blouse", "Body", "Dress", "Hat", "Hoodie", " Outwear", "Pants", "Polo", "Shirt", "Shoes", "Shorts", "Skirt", "T-Shirt", "Top", "Undershirt"]
    }
    
    func getTags() -> [String] {
        tags
    }
    
    func getTags(with index: Int) -> String {
        tags[index]
    }
    
    func countTags() -> Int {
        tags.count
    }
    
    func appendTag(tag: String) {
        tags.append(tag)
    }
    
    // MARK: - outfits
    
    func loadOutfits() {
        let outfit = Outfit(top: UIImage(named: "Image_1")!, bottom: UIImage(named: "Image_2")!)
        let outfit1 = Outfit(top: UIImage(named: "Image_1")!, bottom: UIImage(named: "Image_3")!)
        let outfit2 = Outfit(top: UIImage(named: "Image_6")!, bottom: UIImage(named: "Image_4")!)
        let outfit3 = Outfit(top: UIImage(named: "Image_6")!, bottom: UIImage(named: "Image_5")!)
//        let outfit1 = Outfit(top: wardrobe[0], bottom: wardrobe[2])
//        let outfit2 = Outfit(top: wardrobe[0], bottom: wardrobe[3])
//        let outfit3 = Outfit(top: wardrobe[0], bottom: wardrobe[4])
        
        outfits.append(outfit)
        outfits.append(outfit1)
        outfits.append(outfit2)
        outfits.append(outfit3)
    }
    
    func getOutfit(at index: Int) -> Outfit {
        outfits[index]
    }
    
    // MARK: - favourites
    
    func loadFavourites() {
        favourites = wardrobe.filter { $0.isFavourite }
    }
    
    func getFavourites() -> [Apparel] {
        favourites
    }
    
    func getFavourites(with index: Int) -> Apparel {
        favourites[index]
    }
    
    func countFavourites() -> Int {
        favourites.count
    }
    
    func appendFavourite(apparel: Apparel) {
        favourites.append(apparel)
    }
    
    // MARK: - calendar
    
    func getEvents() -> [CalendarEvent] {
        allCalendarEvents
    }
    
    func getEvents(with index: Int) -> CalendarEvent {
        allCalendarEvents[index]
    }
    
    func countEvents() -> Int {
        allCalendarEvents.count
    }
    
    func appendEvent(event: CalendarEvent) {
        allCalendarEvents.append(event)
    }
    
    func removeEvent(indexpath:Int){
        allCalendarEvents.remove(at: indexpath)
    }
    



    // MARK: - getting userData
    
    func getUsername() -> String{
        username!
    }
    
    func setUsername(username : String){
        self.username = username
    }
    
    func fetchUsername(completion: @escaping(String?) -> Void){
        let db = Firestore.firestore()
        
        guard let user = Auth.auth().currentUser else{
            print("user is not Authenticated")
            completion(nil)
            return
        }
        let userID = user.uid
        
        db.collection("users").document(userID).getDocument {  (document, error) in
            if let error = error{
                print("\(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let document = document, document.exists, let data = document.data() else{
                print("Document is nil")
                completion(nil)
                return
            }
            if let username = data["username"] as? String
            {
                self.username = username
                completion(username)
            }else{
                print("username is nil")
                completion(nil)
            }
        }
    }
    
    
    
    //MARK: -retrieveData function
    
    
    func retrieveData() {
        
       // wardrobe.removeAll()
        
        // Get reference to Firestore
        let db = Firestore.firestore()
        
        // Ensure user is authenticated
        guard let user = Auth.auth().currentUser else {
            print("User is not authenticated")
            return
        }
        
        let userID = user.uid
        
        // Access the 'Apparels' collection for the current user
        db.collection("users").document(userID).collection("Apparels").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching documents: \(error.localizedDescription)")
                return
            }
            
            guard let snapshot = snapshot else {
                print("Snapshot is nil")
                return
            }
            
            // Array to store file paths and cloth types
            var paths = [(path: String, clothType: String)]()
            //print(snapshot.documents)
            // Loop through all the returned documents
            for doc in snapshot.documents {
                print(doc)
                if let url = doc["url"] as? String, let clothType = doc["clothType"] as? String {
                    print("doc")
                    paths.append((path: url, clothType: clothType))
                }
            }
            
            // Get reference to Firebase Storage
            let storageRef = Storage.storage().reference()
            
            // Loop through each file path and fetch the data from storage
            for (path, clothType) in paths {
                let fileRef = storageRef.child(path)
                
                // Retrieve the data
                fileRef.getData(maxSize: 20 * 1024 * 1024) { data, error in
                    if let error = error {
                        print("Error fetching data: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let data = data else {
                        print("No data returned")
                        return
                    }
                    if let image = UIImage(data: data) {
                        // Initialize Apparel with the fetched data
                        let apparel = Apparel(category: clothType, image: image, id: 876, color: .blue, pattern: .dots, type: .top, tag: ["lower"])
                        self.appendApparel(apparel: apparel)
                    } else {
                        print("Failed to create UIImage from data")
                    }
                    print("Data controller : \(self.getWardrobe())")
                }
            }
        }
        wardrobe.removeAll()
    }

    
    
    
    // MARK:- uploadPhoto Function
    func uploadData(apparel: Apparel){
        
        // checking if user is authenticated
        
        guard let user = Auth.auth().currentUser else{
            print ("user is not Authenticated")
            return
        }
        let userID = user.uid
        
        // create storage reference
        let storageRef = Storage.storage().reference()
        
        // turn image into data here thinking to pass imageToUse from itemDetails
        let imageData = apparel.image.pngData()
        // checking that we can convert image into data
        guard imageData != nil else{
            return
        }
        // speccify the file path and name
        let path = "\(userID)/apparels/\(UUID().uuidString).png"
        let fileRef = storageRef.child(path)
        print(userID)
        // upload that data
        
        let uploadTask = fileRef.putData(imageData!, metadata: nil) { metadata, error in
            
            //check for errors
            if error == nil && metadata != nil{
                
                // save a reference to the file in firestore DB
                
                let db = Firestore.firestore()
                let apparelRef = db.collection("users").document(userID).collection("Apparels").document(UUID().uuidString)
                apparelRef.setData(["url": path, "clothType" : apparel.category])
                { error in
                    if let error = error{
                        print("error:\(error.localizedDescription)")
                        return
                    }else{
                        print("upload successfull")
                    }
                }
            }
        }
        self.retrieveData()
    }
    
    
    // MARK: - ML model
    //making func for using ml model in that photo
    
    func detect(image:CIImage) -> String{
        var category : String?

        guard let model = try? VNCoreMLModel(for: ClothTypeClassifier().model) else {
            fatalError("Loading CoreML model Failed.")
        }

        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else{
                fatalError("Model failed to process image")
            }
            if let highestConfidenceResult = results.max(by: { $0.confidence < $1.confidence }) {
                category = highestConfidenceResult.identifier
                }
        }
        

        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])

        }
        catch {
            print(error)
        }
        print("category: \(category)")
        return category!
    }
    
}// data controller class closing
