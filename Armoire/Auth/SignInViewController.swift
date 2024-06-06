//
//  LoginViewController.swift
//  Armoire
//
//  Created by Abhay singh on 02/06/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .selected
        
        view.addSubview(titleLabel)
        view.addSubview(foregroundView)
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        foregroundView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
        
        // Set Auto Layout constraints for foregroundView
        NSLayoutConstraint.activate([
            foregroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            foregroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            foregroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            foregroundView.heightAnchor.constraint(equalToConstant: 650)
        ])
        
        
        configureLablesInForegroundView()
    }
    
    // MARK: - Views and Labels
    
    let foregroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 14.0
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Armoire"
        //label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let signUp: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let userNameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.selected.cgColor
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let emailField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.selected.cgColor
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.selected.cgColor
        textField.layer.cornerRadius = 5
        textField.isSecureTextEntry = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .selected
        button.setTitleColor(.accent, for: .normal)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let oldUser: UILabel = {
            let label = UILabel()
            label.text = "Already a User? Login"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 17)
            label.textColor = .systemBlue
            return label
        }()
    
    func configureLablesInForegroundView() {
        
        foregroundView.addSubview(signUp)
        foregroundView.addSubview(userNameField)
        foregroundView.addSubview(emailField)
        foregroundView.addSubview(passwordField)
        foregroundView.addSubview(signUpButton)
        foregroundView.addSubview(oldUser)
        
        
        
        
        signUp.frame = CGRect(x: 160, y: 16, width: 70, height: 50)
        
        NSLayoutConstraint.activate([
            userNameField.topAnchor.constraint(equalTo: signUp.bottomAnchor, constant: 24 ),
            userNameField.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor, constant: 16),
            userNameField.trailingAnchor.constraint(equalTo: foregroundView.trailingAnchor, constant: -16),
            userNameField.heightAnchor.constraint(equalToConstant: 40),
            userNameField.widthAnchor.constraint(equalToConstant: 180)
            
        ])
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: userNameField.bottomAnchor, constant: 24 ),
            emailField.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor, constant: 16),
            emailField.trailingAnchor.constraint(equalTo: foregroundView.trailingAnchor, constant: -16),
            emailField.heightAnchor.constraint(equalToConstant: 40),
            emailField.widthAnchor.constraint(equalToConstant: 120)
            
        ])
        
        
        
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 16),
            passwordField.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor, constant: 16),
            passwordField.trailingAnchor.constraint(equalTo: foregroundView.trailingAnchor, constant: -16),
            passwordField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            signUpButton.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor, constant: 16),
            signUpButton.trailingAnchor.constraint(equalTo: foregroundView.trailingAnchor, constant: -16),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
            signUpButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        oldUser.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        oldUser.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 16),
                        oldUser.centerXAnchor.constraint(equalTo: foregroundView.centerXAnchor)
                    ])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(oldUserTapped))
            oldUser.isUserInteractionEnabled = true
            oldUser.addGestureRecognizer(tapGestureRecognizer)
        
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        
        
    }
    
    @objc private func oldUserTapped(){
        print("label tapped")
        let LoginViewController = LoginViewController()
            self.show(LoginViewController, sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        userNameField.becomeFirstResponder()
    }
    
    @objc private func didTapButton(){
        print("Tapped")
        guard let username = userNameField.text, !username.isEmpty,
              let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else{
            print("missing field data")
            return
        }
    }
    
    @objc private func didTapSignUpButton(){
        let registerUserRequest = RegisterUserRequest(
                                username: self.userNameField.text ?? "",
                                email: self.emailField.text ?? "",
                                password: self.passwordField.text ?? ""
                                )
        //username check
        if !Validator.isValidUsername(for: registerUserRequest.username){
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        //email check
        if !Validator.isValidEmail(for: registerUserRequest.email){
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        //password check
        if !Validator.isValidPassword(for: registerUserRequest.password){
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        print(registerUserRequest)
       
        Auth.auth().createUser(withEmail: registerUserRequest.email, password: registerUserRequest.password) { authResult, error in
            
            if let error = error{
                print("error: \(error.localizedDescription)")
                return
            }
            let db = Firestore.firestore()
            guard let user = Auth.auth().currentUser else{
                print("user not Authenticated")
                return
            }
            let userID = user.uid
            print(userID)
            db.collection("users").document(userID).setData(["email": registerUserRequest.email,
                                                             "username" : registerUserRequest.username]){
                error in
                if let error = error {
                    print("error : \(error.localizedDescription)")
                    return
                }else{
                    print("user data saved successfully")
                }
            }
        }
        
    }
    
}
