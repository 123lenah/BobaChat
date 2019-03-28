//
//  EnterNameViewController.swift
//  BobaChat
//
//  Created by Lenah Syed on 3/27/19.
//  Copyright © 2019 lenahsapps. All rights reserved.
//

import UIKit

class EnterNameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
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
    
    
    @IBAction func registerAction(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
