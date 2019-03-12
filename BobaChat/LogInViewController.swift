//
//  LogInViewController.swift
//  BobaChat
//
//  Created by Lenah Syed on 2/21/19.
//  Copyright © 2019 lenahsapps. All rights reserved.
//

import UIKit

final class LogInViewController: UIViewController, UITextFieldDelegate {
    
    // look at tutorial to fix constraints: https://www.natashatherobot.com/ios-autolayout-scrollview/
    
    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var createAccountButton: UIButton!
    @IBOutlet fileprivate weak var logInButton: UIButton!
    @IBOutlet fileprivate weak var backgroundImage: UIImageView!
    @IBOutlet fileprivate weak var passwordTextField: UITextField!
    @IBOutlet fileprivate weak var usernameTextField: UITextField!
    @IBOutlet fileprivate weak var overlay: UIImageView!
    @IBOutlet fileprivate weak var BobaChatImage: UIImageView!
    
    // Setting up a ScrollView
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    // MARK: - Properties
    
    // Offset between subviews
    fileprivate let subviewHeightOffset: CGFloat = 0.03
    
    // MARK: - View Lifecycle
    
    override internal func viewDidLoad() {
        super.viewDidLoad()

        // Update Constraints
        tweakUIAndConstaints()
        
        // Add observers for scrollView methods
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(LogInViewController.keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(LogInViewController.keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        
        // Set up LogInViewController as textfield delegate
        usernameTextField.delegate = self
        passwordTextField.delegate = self
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
        
        // Constraints for scrollView
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        print(scrollView.contentInset.bottom, "view started; before scrolling", screenHeight)
        
        // Constraints for background image
        scrollView.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        
        // Contraints for overlay image
        scrollView.addSubview(overlay)
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 1).isActive = true
        overlay.topAnchor.constraint(equalToSystemSpacingBelow: scrollView.topAnchor, multiplier: screenHeight*0.013).isActive = true
        overlay.heightAnchor.constraint(equalToConstant: screenHeight*0.859).isActive = true
        overlay.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        
        //Contraints for BobaChatImage
        scrollView.addSubview(BobaChatImage)
        BobaChatImage.translatesAutoresizingMaskIntoConstraints = false
        BobaChatImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 1).isActive = true
        BobaChatImage.heightAnchor.constraint(equalToConstant: screenHeight*subviewHeightOffset).isActive = true
        BobaChatImage.widthAnchor.constraint(equalToConstant: screenWidth*0.32).isActive = true
        BobaChatImage.topAnchor.constraint(equalTo: overlay.topAnchor, constant: screenHeight*0.18).isActive = true
        
        //Add in default text/font
        usernameTextField.font = UIFont(name: "Kohinoor Bangla", size: BobaChatImage.frame.height*0.8)
        passwordTextField.font = UIFont(name: "Kohinoor Bangla", size: BobaChatImage.frame.height*0.8)
        usernameTextField.placeholder = "Enter Username..."
        passwordTextField.placeholder = "Enter Password..."
        
        
        // Constraints for usernameTextField
        scrollView.addSubview(usernameTextField)
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 1).isActive = true
        usernameTextField.topAnchor.constraint(equalToSystemSpacingBelow: BobaChatImage.bottomAnchor, multiplier: 5).isActive = true
        usernameTextField.widthAnchor.constraint(equalToConstant: screenWidth*0.42).isActive = true
        
        
        // Constraints for passwordTextField
        scrollView.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 1).isActive = true
        passwordTextField.topAnchor.constraint(equalToSystemSpacingBelow: usernameTextField.bottomAnchor, multiplier: 5).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor, multiplier: 1).isActive = true
        
        // Constaints for logInButton
        scrollView.addSubview(logInButton)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 1).isActive = true
        logInButton.topAnchor.constraint(equalToSystemSpacingBelow: passwordTextField.bottomAnchor, multiplier: screenHeight*0.009).isActive = true
        logInButton.widthAnchor.constraint(equalToConstant: screenWidth*0.50).isActive = true
        
        // Constraints for createAccountButton
        scrollView.addSubview(createAccountButton)
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 1).isActive = true
        //createAccountButton.topAnchor.constraint(equalToSystemSpacingBelow: logInButton.bottomAnchor, multiplier: screenHeight*0.003521).isActive = true
        createAccountButton.topAnchor.constraint(equalToSystemSpacingBelow: logInButton.bottomAnchor, multiplier: screenHeight*0.005).isActive = true
        createAccountButton.widthAnchor.constraint(equalTo: logInButton.widthAnchor, multiplier: 1).isActive = true
    }
    
    func adjustForScrollView(shouldShow: Bool, notification: Notification) {
        let userInfo = notification.userInfo ?? [:]
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let endFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        
        // To protect against the scrollView scrolling again when another textField is selected
        if keyboardFrame.equalTo(endFrame) {
            return
        }
        
        // Adds a padding value of 20 to either be subtracted or added to scrollView's contentInset
        let adjustmentHeight = (keyboardFrame.height) * (shouldShow ? 2 : -2)
        scrollView.contentInset.bottom += adjustmentHeight
        scrollView.scrollIndicatorInsets.bottom += adjustmentHeight
        
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        adjustForScrollView(shouldShow: true, notification: notification)
        print(scrollView.contentInset.bottom, "we scrolled up!")
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        adjustForScrollView(shouldShow: false, notification: notification)
        print(scrollView.contentInset.bottom, "we scrolled down!")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return false
    }
    
    deinit {
     NotificationCenter.default.removeObserver(self)
     }
}
