//
//  StyledTextField.swift
//  MYCash-Task
//
//  Created by iOSAYed on 08/01/2024.
//

import UIKit

class StyledTextField: UITextField {
    
    private let innerShadowLayer = CALayer()

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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyInnerShadow()
    }
    func setupTextFieldStyles() {
        // Apply your styles here
        self.borderStyle = .none
        self.textColor = .black
        self.layer.borderColor = Colors.borderColor?.cgColor
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 0.25
        
        
    }
 

    private func applyInnerShadow() {
           let innerShadowLayer = CALayer()
           innerShadowLayer.frame = self.bounds
           
           let radius: CGFloat = 10
           let path = UIBezierPath(roundedRect: innerShadowLayer.bounds.insetBy(dx: -9, dy: -8), cornerRadius: radius)
           let innerPath = UIBezierPath(roundedRect: innerShadowLayer.bounds, cornerRadius: radius).reversing()
           
           path.append(innerPath)
           
           innerShadowLayer.shadowPath = path.cgPath
           innerShadowLayer.masksToBounds = true
           innerShadowLayer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
           innerShadowLayer.shadowOffset = CGSize(width: 9, height: 8)
        innerShadowLayer.shadowOpacity = 0.7
           innerShadowLayer.shadowRadius = 5
           innerShadowLayer.cornerRadius = radius
        innerShadowLayer.cornerRadius = self.layer.cornerRadius
        innerShadowLayer.borderWidth = self.layer.borderWidth
        innerShadowLayer.borderColor = self.layer.borderColor
           
           self.layer.addSublayer(innerShadowLayer)
           self.layer.masksToBounds = true
       }
}
