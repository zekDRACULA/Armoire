//
//  LoginViewController.swift
//  Armoire
//
//  Created by Abhay singh on 02/06/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
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
        
        didTapButton()
        newUserTapped()
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
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
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
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .selected
        button.setTitleColor(.accent, for: .normal)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let newUser: UILabel = {
            let label = UILabel()
            label.text = "New User? Create Account"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 17)
            label.textColor = .systemBlue
            return label
        }()
    
    func configureLablesInForegroundView() {
        
        foregroundView.addSubview(loginLabel)
        foregroundView.addSubview(emailField)
        foregroundView.addSubview(passwordField)
        foregroundView.addSubview(loginButton)
        foregroundView.addSubview(newUser)
        
        
        //        NSLayoutConstraint.activate([
        //            loginLabel.topAnchor.constraint(equalTo: foregroundView.topAnchor, constant: 50),
        //            loginLabel.centerXAnchor.constraint(equalTo: foregroundView.centerXAnchor)
        //        ])
        
        loginLabel.frame = CGRect(x: 160, y: 16, width: 70, height: 50)
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 24 ),
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
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: foregroundView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        newUser.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        newUser.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
                        newUser.centerXAnchor.constraint(equalTo: foregroundView.centerXAnchor)
                    ])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(newUserTapped))
            newUser.isUserInteractionEnabled = true
            newUser.addGestureRecognizer(tapGestureRecognizer)
        
        loginButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        
    }
    
    @objc private func newUserTapped(){
        print("label tapped")
        let SignInViewController = SignInViewController()
        SignInViewController.modalPresentationStyle = .automatic
        self.present(SignInViewController, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        emailField.becomeFirstResponder()
    }
    
    @objc private func didTapButton(){
        print("Tapped")
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else{
            print("missing field data")
            return
        }
        
    }
}
