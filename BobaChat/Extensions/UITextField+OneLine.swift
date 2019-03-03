//
//  UITextField+OneLine.swift
//  BobaChat
//
//  Created by Lenah Syed on 3/2/19.
//  Copyright © 2019 lenahsapps. All rights reserved.
//

import Foundation
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
