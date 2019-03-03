//
//  CreateAccountViewController.swift
//  BobaChat
//
//  Created by Lenah Syed on 2/28/19.
//  Copyright © 2019 lenahsapps. All rights reserved.
//

import UIKit

final class CreateAccountViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var addPasswordTextField: UITextField!
    @IBOutlet weak var addUsernameTextField: UITextField!
    @IBOutlet weak var overlay2: UIImageView!
    
    // MARK: - View Lifecycle
    
    override internal func viewDidLoad() {
        super.viewDidLoad()

        // Show Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override internal func viewWillDisappear(_ animated: Bool) {
        // Show Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override internal func viewDidLayoutSubviews() {
        addPasswordTextField.makeOneLine()
        addUsernameTextField.makeOneLine()
    }
}
