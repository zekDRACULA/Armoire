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
    
    private var wardrobe: [Apparel] = [] // all the apparels
    private var tags: [String] = [] // all the tags
    private var favourites: [Apparel] = [] // favourite apparels
    
    var outfits: [Outfit] = []
    
    var username : String?
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
        //getUsername()
    }
    
    // MARK: - wardrobe
    
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
//        let outfit = Outfit(top: UIImage(named: "Image_1")!, bottom: UIImage(named: "Image_2")!)
//        let outfit1 = Outfit(top: UIImage(named: "Image_1")!, bottom: UIImage(named: "Image_3")!)
//        let outfit2 = Outfit(top: UIImage(named: "Image_6")!, bottom: UIImage(named: "Image_4")!)
//        let outfit3 = Outfit(top: UIImage(named: "Image_6")!, bottom: UIImage(named: "Image_5")!)
//        let outfit1 = Outfit(top: wardrobe[0], bottom: wardrobe[2])
//        let outfit2 = Outfit(top: wardrobe[0], bottom: wardrobe[3])
//        let outfit3 = Outfit(top: wardrobe[0], bottom: wardrobe[4])
        
//        outfits.append(outfit)
//        outfits.append(outfit1)
//        outfits.append(outfit2)
//        outfits.append(outfit3)
        
        for _ in 0..<5 {
            outfits.append(recommendation()!)
        }
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
    

//    func getOutfits(forEventType eventType: EventType) -> [Outfit] {
//        var outfits: [Outfit] = []
//        
//        // Filter wardrobe items for tops and bottoms matching the event type
//        let tops = wardrobe.filter { $0.type == .top && $0.tag.contains(eventType.rawValue) }
//        let bottoms = wardrobe.filter { $0.type == .bottom && $0.tag.contains(eventType.rawValue) }
//        
//        // Generate outfits combinations from filtered tops and bottoms
//        for top in tops {
//            for bottom in bottoms {
//                outfits.append(Outfit(top: top, bottom: bottom))
//            }
//        }
//
//        return outfits
//    }

    // MARK: - recommendation
    
    func recommendation() -> Outfit? {
        
        let tops: [Apparel] = wardrobe.filter{ $0.type == "Tops" }
        let bottoms: [Apparel] = wardrobe.filter{ $0.type == "Bottoms" }
        
        guard tops.isEmpty || bottoms.isEmpty else {
            print("Please add more apparels.")
            return nil
        }
        
        if let top = tops.randomElement(), let bottom = bottoms.randomElement() {
            return Outfit(top: top, bottom: bottom)
        } else {
            // Handle the case where randomElement() unexpectedly returns nil
            print("Error: Unexpected nil value while selecting outfit.")
            return nil
        }
        
//        return Outfit(top: tops.randomElement()!, bottom: bottoms.randomElement()!)
    }
    

    // MARK: - getting userData
    
    func getUsername() -> String{
        username!
    }
    
    func setUsername(username : String){
        self.username = username
    }
    
    
    func fetchUsername(){
        let db = Firestore.firestore()
        
        guard let user = Auth.auth().currentUser else{
            print("user is not authenticated")
                return
        }
        let userID = user.uid
        
        db.collection("users").document(userID).getDocument { (document, error) in
            if let error = error {
                print("Error fetching document: \(error.localizedDescription)")
                return
            }
            guard let document = document, document.exists, let data = document.data() else{
                print("document is nil")
//                exit(1)
                return
            }
            if let username = data["username"] as? String{
                self.usernamestore.append(username)
                print(self.usernamestore)
                self.username = username
                print("username: \(username)")
//                self.setUsername(username: username)
            }else{
                print("user name is nil")
            }
        }
//        return username!
    }
    
    
    
    //MARK: - retrieveData function
    
    
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
            var paths = [(path: String, category: String, type: String)]()
            //print(snapshot.documents)
            // Loop through all the returned documents
            for doc in snapshot.documents {
                print(doc)
                if let url = doc["url"] as? String, let category = doc["category"] as? String, let type = doc["type"] as? String {
                    print("doc")
                    paths.append((path: url, category: category, type: type))
                }
            }
            
            // Get reference to Firebase Storage
            let storageRef = Storage.storage().reference()
            
            // Loop through each file path and fetch the data from storage
            for (path, category, type) in paths {
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
                        let apparel = Apparel(category: category, image: image, id: 876, color: .blue, pattern: .dots, type: type, tag: ["lower"])
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

    
    
    
    // MARK: uploadPhoto Function
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
        print("uploadData/userID :- \(userID)")
        // upload that data
        
        let uploadTask = fileRef.putData(imageData!, metadata: nil) { metadata, error in
            
            //check for errors
            if error == nil && metadata != nil{
                
                // save a reference to the file in firestore DB
                
                let db = Firestore.firestore()
                let apparelRef = db.collection("users").document(userID).collection("Apparels").document(UUID().uuidString)
                apparelRef.setData(["url": path, "category": apparel.category, "type": apparel.type])
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
    
    //  Adding a new document to Firestore after detecting the image category
    
//    func addNewApparelToFirestore(url: String) {
//        
//        print("inside addNewApparelToFirebase")
//        
//        let db = Firestore.firestore()
//        guard let user = Auth.auth().currentUser else {
//            print("User is not Authenticated")
//            return
//            
//        }
//        let userID = user.uid
//        let clothData = ["category": self.clothType ?? "Unknown", "url": url]
//        
//        db.collection("users").document(userID).collection("Apparels").addDocument(data: clothData) { error in
//            if let error = error {
//                print("\(error.localizedDescription)")
//            } else {
//                print("Document added")
//            }
//        }
//    }
    
    // MARK: - Category ML model
    
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
//        print("category: \(category)")
        return category!
    }
    
    // MARK: - Type ML Model
    
    func typeDetect(image: CIImage) -> String {
        var type: String?
        
        guard let model = try? VNCoreMLModel(for: TypeClassfierModel().model) else{
            fatalError("Loading CoreMl Model Failed")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else{
                fatalError("Model Failed to process image")
            }
            
//            print(" TYpe classfier model details are from here \(results)")
            if let highestConfidenceResult = results.max(by: { $0.confidence < $1.confidence }) {
                type = highestConfidenceResult.identifier
                }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        }
        catch {
            print(error)
        }
        return type!
    }
    
}
