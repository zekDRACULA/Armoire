//
//  alertManager.swift
//  Armoire
//
//  Created by Abhay singh on 02/06/24.
//

import Foundation
import UIKit

class AlertManager{
    private static func showBasicAlert(on vc: UIViewController, title: String, message: String? ){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
}



extension AlertManager{
    public static func showInvalidEmailAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, title: "Invalid Email", message: "Please enter a valid email!")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, title: "Invalid Password", message: "Please enter a valid Password!")
    }
    
    public static func showInvalidUsernameAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, title: "Invalid username", message: "Please enter a valid username!")
    }
}

// MARK: - Registration Error

extension AlertManager{
    public static func showRegistrationErrorAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, title: "Unknown Registration Error", message: "Please enter a valid email!")
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error){
        self.showBasicAlert(on: vc, title: "Registration Error", message: "\(error.localizedDescription)")
    }

}

// MARK: - Login Error

extension AlertManager{
    
    public static func showSignInErrorAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, title: "Unknown Error Signing In", message: nil)
    }
    
    
    public static func showSignInErrorAlert(on vc: UIViewController, with error: Error){
        self.showBasicAlert(on: vc, title: "Unknown Error Signing In", message: "\(error.localizedDescription)")
    }
}

// MARK: - Fetching User Error

extension AlertManager{
    
    public static func showUnknownFetchingUserError(on vc: UIViewController){
        self.showBasicAlert(on: vc, title: "Unknown Error fetching User", message: nil)
    }
    
    public static func showFetchingUserError(on vc: UIViewController, with error: Error){
        self.showBasicAlert(on: vc, title: "Error fetching User", message: "\(error.localizedDescription)")
    }
}

// MARK: - Logot Error

extension AlertManager{
    
    public static func showLogoutError(on vc: UIViewController, with error: Error){
        self.showBasicAlert(on: vc, title: "Logout Error", message: "\(error.localizedDescription)")
    }
    
}
