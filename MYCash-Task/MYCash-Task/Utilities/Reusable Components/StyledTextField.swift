//
//  StyledTextField.swift
//  MYCash-Task
//
//  Created by iOSAYed on 08/01/2024.
//

import UIKit

class StyledTextField: UITextField {

    // Init from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextFieldStyles()
    }
    
    // Init from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextFieldStyles()
    }
    
    func setupTextFieldStyles() {
        // Apply your styles here
        self.borderStyle = .none
        self.textColor = .black
        self.layer.borderColor = Colors.borderColor?.cgColor
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 0.8
    }
}
