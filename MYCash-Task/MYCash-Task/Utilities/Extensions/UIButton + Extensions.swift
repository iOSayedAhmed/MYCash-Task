//
//  UIButton + Extensions.swift
//  MYCash-Task
//
//  Created by iOSAYed on 10/01/2024.
//

import Foundation
import UIKit

extension UIButton {
    
    func addUnderline(color:UIColor) {
        let underlineView = UIView(frame: CGRect(x: 8, y: self.frame.size.height - 2, width: self.bounds.size.width - 8, height: 2))
        underlineView.backgroundColor = color
        self.addSubview(underlineView)
    }

}
