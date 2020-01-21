//
//  CreateAccountViewController.swift
//  BobaChat
//
//  Created by Lenah Syed on 2/28/19.
//  Copyright © 2019 lenahsapps. All rights reserved.
//

import UIKit

final class CreateAccountViewController: UIViewController, UITextFieldDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var addPasswordTextField: UITextField!
    @IBOutlet weak var addUsernameTextField: UITextField!
    @IBOutlet weak var overlay2: UIImageView!
    
    // MARK: - View Lifecycle
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        
        // Update Contraints
        tweakUIAndConstraints()

        // Show Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        addUsernameTextField.delegate = self
        addPasswordTextField.delegate = self
    }
    
    override internal func viewWillDisappear(_ animated: Bool) {
        // Show Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override internal func viewDidLayoutSubviews() {
        addPasswordTextField.makeOneLine()
        addUsernameTextField.makeOneLine()
    }
    
    fileprivate func tweakUIAndConstraints() {
        var screenWidth: CGFloat {
            return UIScreen.main.bounds.width
        }
        var screenHeight: CGFloat {
            return UIScreen.main.bounds.height
        }
        

        
        // Constraints for background image
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        // Constraints for overlay2
        overlay2.translatesAutoresizingMaskIntoConstraints = false
        overlay2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        overlay2.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: screenHeight*0.02).isActive = true
        //overlay2.heightAnchor.constraint(equalToConstant: screenHeight*0.859).isActive = true
        overlay2.heightAnchor.constraint(equalToConstant: screenHeight*0.7).isActive = true
        overlay2.widthAnchor.constraint(equalToConstant: screenWidth*0.9).isActive = true
        
        // Add in default text/font
        addPasswordTextField.font = UIFont(name: "Kohinoor Bangla", size: 12)
        addUsernameTextField.font = UIFont(name: "Kohinoor Bangla", size: 12)
        addUsernameTextField.placeholder = "Enter username for account..."
        addPasswordTextField.placeholder = "Enter password for account..."
        
        // Constraints for addUsernameTextField
        addUsernameTextField.translatesAutoresizingMaskIntoConstraints = false
        addUsernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        addUsernameTextField.topAnchor.constraint(equalToSystemSpacingBelow: overlay2.topAnchor, multiplier: screenHeight * 0.025).isActive = true
        addUsernameTextField.widthAnchor.constraint(equalToConstant: screenWidth*0.5).isActive = true
        
        // Constraints for addPasswordTextField
        addPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        addPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        addPasswordTextField.topAnchor.constraint(equalToSystemSpacingBelow: addUsernameTextField.bottomAnchor, multiplier: 8).isActive = true
        addPasswordTextField.widthAnchor.constraint(equalTo: addUsernameTextField.widthAnchor, multiplier: 1).isActive = true
        
        // Constraints for registerButton
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        registerButton.topAnchor.constraint(equalToSystemSpacingBelow: addPasswordTextField.bottomAnchor, multiplier: screenHeight*0.015).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: screenWidth*0.50).isActive = true
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func validateFields() -> Bool {
        // Check that all fields are filled in
        return addUsernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && addPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "createAccount") {
            if (!validateFields()) {
                let alert = UIAlertController(title: "Error", message: "Fill in fields before continuing", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            let destination = segue.destination as! EnterNameViewController
            destination.username = addUsernameTextField.text!
            destination.password = addPasswordTextField.text!
        }
    }
    
    
}
