//
//  AuthService.swift
//  Armoire
//
//  Created by Abhay singh on 02/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase

class AuthService{
    
    //sigleton dont know what it does just following tutorial will ask maam
    
    public static let shared = AuthService()
    private init() {}
    
    
    
    /// A method to register user
    /// - Parameters:
    ///   - userRequest: The user information (email, password, username)
    ///   - completion: A completion with two values ..
    ///   - Bool: wasRegistered - Determine if the user was registered and saved in the database correctly
    ///   -Error? : An optional error if database provides once
    public func registerUser(with userRequest: RegisterUserRequest, completion: @escaping(Bool, Error?) -> Void){
        let username = userRequest.username
        let email = userRequest.email
        let password = userRequest.password
        
        Auth.auth().createUser(withEmail: email, password: password){result, error in
            if let error = error{
                completion(false, error)
                return
            }
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }
            
//            let data: [String: Any] = [
//                "username" : username,
//                "email" : email,
//                "password" : password
//            ]
            let db = Firestore.firestore()
            
            db.collection("users").document(resultUser.uid).setData([
                "username": username,
                "email": email
            ]){ error in
                if let error = error{
                    completion(false, error)
                    return
                }
                completion(true, nil)
            }
            
//            let db = Database.database().reference().child("users").child(resultUser.uid)
//            
//            db.setValue(data){error, _ in
//                if let error = error{
//                    completion(false,error)
//                    return
//                }
//                completion(true, nil)
//        
//            }
            
        }
    }
    
    public func signIn(with userRequest: LoginUserRequest, completion: @escaping(Error?) -> Void){
        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password){
            result, error in
            if let error = error{
                completion(error)
                return
            }else{
                completion(nil)
            }
        }
    }
    
    public func signOut(completion: @escaping(Error?) -> Void){
        do{
            try Auth.auth().signOut()
            completion(nil)
        }catch let error{
            completion(error)
        }
    }
}
