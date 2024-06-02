//
//  SceneDelegate.swift
//  Armoire
//
//  Created by zekDracula on 09/05/24.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    //guard let _ = (scene as? UIWindowScene) else { return }
        
        //self.checkAuthentication()
        
       setupWindow(with: scene)
        checkAuthentication()
        
    }

    public func setupWindow(with scene: UIScene){
        guard let windowScene = (scene as? UIWindowScene) else {return}
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        self.window?.makeKeyAndVisible()
    }

    public func checkAuthentication(){
        if Auth.auth().currentUser == nil{
                    let vc = LoginViewController()
                    let nav = UINavigationController(rootViewController: vc)
                    nav.modalPresentationStyle = .fullScreen
                    self.window?.rootViewController = nav
        }else{
            let vc = ViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.window?.rootViewController = nav
        }
    }

}

