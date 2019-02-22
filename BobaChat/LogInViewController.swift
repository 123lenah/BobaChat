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

class LogInViewController: UIViewController {
    
    // self.textField.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.red, thickness: 2, width: textFieldConstraintWidth.constant)
    
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
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tweakUIAndConstaints() {
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
        overlay.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 1).isActive = true
        overlay.heightAnchor.constraint(equalToConstant: screenHeight-100).isActive = true
        overlay.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        
        //Contraints for BobaChatImage
        BobaChatImage.translatesAutoresizingMaskIntoConstraints = false
        BobaChatImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1).isActive = true
        BobaChatImage.heightAnchor.constraint(equalToConstant: screenHeight*0.03).isActive = true
        BobaChatImage.widthAnchor.constraint(equalToConstant: screenWidth*0.32).isActive = true
        BobaChatImage.topAnchor.constraint(equalTo: overlay.topAnchor, constant: screenHeight*0.18).isActive = true
        
        //Make usernameTextField and passwordTextField one line
        usernameTextField.makeOneLine()
        passwordTextField.makeOneLine()
        
        //Add in default text/font
        usernameTextField.font = UIFont(name: "Kohinoor Bangla", size: BobaChatImage.frame.height*0.8)
        passwordTextField.font = UIFont(name: "Kohinoor Bangla", size: BobaChatImage.frame.height*0.8)
        usernameTextField.placeholder = "Enter Username..."
        passwordTextField.placeholder = "Enter Password..."
        
        
        /*//Constraints for usernameTextField
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameTextField.topAnchor.constraint(equalToSystemSpacingBelow: BobaChatImage.bottomAnchor, multiplier: screenHeight*0.18).isActive = true
        usernameTextField.widthAnchor.constraint(equalToConstant: screenWidth*0.32).isActive = true
        BobaChatImage.topAnchor.constraint(equalTo: overlay.topAnchor, constant: screenHeight*0.18).isActive = true
        
        
        //Constraints for passwordTextField
        passwordTextField.widthAnchor.constraint(equalToConstant: 165).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.topAnchor, constant: screenHeight*0.18).isActive = true*/
        
        
    }

}
