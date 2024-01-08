//
//  ButtonStyle.swift
//  MYCash-Task
//
//  Created by iOSAYed on 08/01/2024.
//

import UIKit

class StyledButton: UIButton {
    
    // Init from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtonStyles()
    }
    
    // Init from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButtonStyles()
    }
    
    
    
    func setupButtonStyles() {
        // Apply your styles here
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = Colors.PrimaryButtonColor
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        self.layer.cornerRadius = 12
         }

         override func layoutSubviews() {
             super.layoutSubviews()
             
         }
}
