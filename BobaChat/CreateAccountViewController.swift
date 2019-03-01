//
//  CreateAccountViewController.swift
//  BobaChat
//
//  Created by Lenah Syed on 2/28/19.
//  Copyright © 2019 lenahsapps. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var addPasswordTextField: UITextField!
    @IBOutlet weak var addUsernameTextField: UITextField!
    @IBOutlet weak var overlay2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        addPasswordTextField.makeOneLine()
        addUsernameTextField.makeOneLine()
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
