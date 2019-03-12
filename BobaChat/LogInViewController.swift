//
//  LogInViewController.swift
//  BobaChat
//
//  Created by Lenah Syed on 2/21/19.
//  Copyright © 2019 lenahsapps. All rights reserved.
//

import UIKit

final class LogInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var createAccountButton: UIButton!
    @IBOutlet fileprivate weak var logInButton: UIButton!
    @IBOutlet fileprivate weak var backgroundImage: UIImageView!
    @IBOutlet fileprivate weak var passwordTextField: UITextField!
    @IBOutlet fileprivate weak var usernameTextField: UITextField!
    @IBOutlet fileprivate weak var overlay: UIImageView!
    @IBOutlet fileprivate weak var BobaChatImage: UIImageView!
    
    // MARK: - Properties
    
    // Offset between subviews
    fileprivate let subviewHeightOffset: CGFloat = 0.03
    
    // MARK: - View Lifecycle
    
    override internal func viewDidLoad() {
        super.viewDidLoad()

        //Update Constraints
        tweakUIAndConstaints()
        
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Show Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override internal func viewDidLayoutSubviews() {
        //Make usernameTextField and passwordTextField one line
        usernameTextField.makeOneLine()
        passwordTextField.makeOneLine()
    }
    
    fileprivate func tweakUIAndConstaints() {
        var screenWidth: CGFloat {
            return UIScreen.main.bounds.width
        }
        var screenHeight: CGFloat {
            return UIScreen.main.bounds.height
        }
        
        //Constraints for background image
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        //Contraints for overlay image
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        overlay.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: screenHeight*0.007).isActive = true
        overlay.heightAnchor.constraint(equalToConstant: screenHeight*0.859).isActive = true
        overlay.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        
        //Contraints for BobaChatImage
        BobaChatImage.translatesAutoresizingMaskIntoConstraints = false
        BobaChatImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        BobaChatImage.heightAnchor.constraint(equalToConstant: screenHeight*subviewHeightOffset).isActive = true
        BobaChatImage.widthAnchor.constraint(equalToConstant: screenWidth*0.32).isActive = true
        BobaChatImage.topAnchor.constraint(equalTo: overlay.topAnchor, constant: screenHeight*0.18).isActive = true
        
        //Add in default text/font
        usernameTextField.font = UIFont(name: "Kohinoor Bangla", size: BobaChatImage.frame.height*0.8)
        passwordTextField.font = UIFont(name: "Kohinoor Bangla", size: BobaChatImage.frame.height*0.8)
        usernameTextField.placeholder = "Enter Username..."
        passwordTextField.placeholder = "Enter Password..."
        
        
        // Constraints for usernameTextField
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        usernameTextField.topAnchor.constraint(equalToSystemSpacingBelow: BobaChatImage.bottomAnchor, multiplier: 5).isActive = true
        usernameTextField.widthAnchor.constraint(equalToConstant: screenWidth*0.42).isActive = true
        
        
        // Constraints for passwordTextField
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        passwordTextField.topAnchor.constraint(equalToSystemSpacingBelow: usernameTextField.bottomAnchor, multiplier: 5).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor, multiplier: 1).isActive = true
        
        // Constaints for logInButton
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        logInButton.topAnchor.constraint(equalToSystemSpacingBelow: passwordTextField.bottomAnchor, multiplier: screenHeight*0.009).isActive = true
        logInButton.widthAnchor.constraint(equalToConstant: screenWidth*0.50).isActive = true
        
        // Constraints for createAccountButton
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        //createAccountButton.topAnchor.constraint(equalToSystemSpacingBelow: logInButton.bottomAnchor, multiplier: screenHeight*0.003521).isActive = true
        createAccountButton.topAnchor.constraint(equalToSystemSpacingBelow: logInButton.bottomAnchor, multiplier: screenHeight*0.005).isActive = true
        createAccountButton.widthAnchor.constraint(equalTo: logInButton.widthAnchor, multiplier: 1).isActive = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
