//
//  EnterNameViewController.swift
//  BobaChat
//
//  Created by Lenah Syed on 3/27/19.
//  Copyright © 2019 lenahsapps. All rights reserved.
//

import UIKit
import Firebase

class EnterNameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var username: String!
    var password: String!
    
    override internal func viewWillAppear(_ animated: Bool) {
        // Show Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        // Add in default text/font
        firstNameTextField.font = UIFont(name: "Kohinoor Bangla", size: 14)
        lastNameTextField.font = UIFont(name: "Kohinoor Bangla", size: 14)
        firstNameTextField.placeholder = "Enter first name..."
        lastNameTextField.placeholder = "Enter last name..."
        
        firstNameTextField.makeOneLine()
        lastNameTextField.makeOneLine()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // Check the fields and validate methods are correct
    func validateFields() -> Bool {
        
        // Check that all fields are filled in
        return firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""

    }
    
    
    @IBAction func registerAction(_ sender: Any) {
        
        // Validate the fields
        if (!validateFields()) {
            let alert = UIAlertController(title: "Error", message: "Fill in fields before continuing", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        // Create the user
        
        // Transition to the home screen
        
        //Auth.auth().createUser(withEmail: <#T##String#>, password: <#T##String#>, completion: <#T##AuthDataResultCallback?##AuthDataResultCallback?##(AuthDataResult?, Error?) -> Void#>)
    }
    


}
