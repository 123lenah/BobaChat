//
//  LogInViewController.swift
//  BobaChat
//
//  Created by Lenah Syed on 2/21/19.
//  Copyright © 2019 lenahsapps. All rights reserved.
//

import UIKit

extension UITextField {
    func makeOneLine() {
        let textFieldBottom = CALayer()
        let borderWidth = CGFloat(1.0)
        textFieldBottom.frame = CGRect(x: 0, y: self.frame.height - borderWidth, width: self.frame.width, height: self.frame.height)
        textFieldBottom.backgroundColor = UIColor.lightGray.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(textFieldBottom)
        self.layer.masksToBounds = true
    }
}

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    // self.textField.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.red, thickness: 2, width: textFieldConstraintWidth.constant)
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var overlay: UIImageView!
    
    @IBOutlet weak var BobaChatImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Update Constraints
        tweakUIAndConstaints()
        
        //add delegates for textfields
        passwordTextField.delegate = self
        usernameTextField.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        //Make usernameTextField and passwordTextField one line
        usernameTextField.makeOneLine()
        passwordTextField.makeOneLine()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    /*func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        currentTextField?.resignFirstResponder()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        currentTextField = textField
        offSet = self.scrollView.contentOffset
        return true
    }*/
    
    func tweakUIAndConstaints() {
        var screenWidth: CGFloat {
            return UIScreen.main.bounds.width
        }
        var screenHeight: CGFloat {
            return UIScreen.main.bounds.height
        }
        
        print("we are on scroll view!")
        
        //Constraints for subView
        self.view.sendSubviewToBack(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
        //Constraints for background image
        /*backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true*/
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1).isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        
        //Contraints for overlay image
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        overlay.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 1).isActive = true
        overlay.heightAnchor.constraint(equalToConstant: screenHeight*0.859).isActive = true
        overlay.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        
        //Contraints for BobaChatImage
        BobaChatImage.translatesAutoresizingMaskIntoConstraints = false
        BobaChatImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        BobaChatImage.heightAnchor.constraint(equalToConstant: screenHeight*0.03).isActive = true
        BobaChatImage.widthAnchor.constraint(equalToConstant: screenWidth*0.32).isActive = true
        BobaChatImage.topAnchor.constraint(equalTo: overlay.topAnchor, constant: screenHeight*0.18).isActive = true
        
        //Add in default text/font
        usernameTextField.font = UIFont(name: "Kohinoor Bangla", size: BobaChatImage.frame.height*0.8)
        passwordTextField.font = UIFont(name: "Kohinoor Bangla", size: BobaChatImage.frame.height*0.8)
        usernameTextField.placeholder = "Enter Username..."
        passwordTextField.placeholder = "Enter Password..."
        
        
        //Constraints for usernameTextField
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        usernameTextField.topAnchor.constraint(equalToSystemSpacingBelow: BobaChatImage.bottomAnchor, multiplier: 5).isActive = true
        usernameTextField.widthAnchor.constraint(equalToConstant: screenWidth*0.42).isActive = true
        
        
        //Constraints for passwordTextField
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        passwordTextField.topAnchor.constraint(equalToSystemSpacingBelow: usernameTextField.bottomAnchor, multiplier: 5).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor, multiplier: 1).isActive = true
        
        //Constaints for logInButton
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        //logInButton.topAnchor.constraint(equalToSystemSpacingBelow: passwordTextField.bottomAnchor, multiplier: screenHeight*0.0088).isActive = true
        logInButton.topAnchor.constraint(equalToSystemSpacingBelow: passwordTextField.bottomAnchor, multiplier: screenHeight*0.009).isActive = true
        logInButton.widthAnchor.constraint(equalToConstant: screenWidth*0.50).isActive = true
        
        //Constraints for createAccountButton
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        //createAccountButton.topAnchor.constraint(equalToSystemSpacingBelow: logInButton.bottomAnchor, multiplier: screenHeight*0.003521).isActive = true
        createAccountButton.topAnchor.constraint(equalToSystemSpacingBelow: logInButton.bottomAnchor, multiplier: screenHeight*0.005).isActive = true
        createAccountButton.widthAnchor.constraint(equalTo: logInButton.widthAnchor, multiplier: 1).isActive = true
        
    }

}
