//
//  UIView+Extensions.swift
//  MYCash-Task
//
//  Created by iOSAYed on 08/01/2024.
//

import UIKit
extension UIView {
    
    /// Loads a view from a nib file and adds it as a subview to the current view instance..
        func loadViewFromNib(bundle: Bundle? = nil) {
            let nibName = String(describing: Self.self)
            let bundle = Bundle(for: Self.self)
            let nib = UINib(nibName: nibName, bundle: bundle)

            guard let contentView = nib.instantiate(withOwner: self).first as? UIView else {
                assertionFailure("unable to find the content view")
                return
            }

            contentView.frame = bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            addSubview(contentView)
        }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
           self.layer.cornerRadius = radius
           
           var cornerMask = CACornerMask()
           if corners.contains(.topLeft) {
               cornerMask.insert(.layerMinXMinYCorner)
           }
           if corners.contains(.topRight) {
               cornerMask.insert(.layerMaxXMinYCorner)
           }
           if corners.contains(.bottomLeft) {
               cornerMask.insert(.layerMinXMaxYCorner)
           }
           if corners.contains(.bottomRight) {
               cornerMask.insert(.layerMaxXMaxYCorner)
           }
           self.layer.maskedCorners = cornerMask
       }
    
    func applyShadow(
            color: UIColor = .black,
            alpha: Float = 0.5,
            x: CGFloat = 0,
            y: CGFloat = 2,
            blur: CGFloat = 4,
            spread: CGFloat = 0) {
            
            layer.shadowColor = color.cgColor
            layer.shadowOpacity = alpha
            layer.shadowOffset = CGSize(width: x, height: y)
            layer.shadowRadius = blur / 2.0
            if spread == 0 {
                layer.shadowPath = nil
            } else {
                let dx = -spread
                let rect = bounds.insetBy(dx: dx, dy: dx)
                layer.shadowPath = UIBezierPath(rect: rect).cgPath
            }
            layer.masksToBounds = false
        }
    
    func setGradiantBackground(_ colorOne:UIColor,_ colorTwo:UIColor , startPoint:CGPoint,endPoint:CGPoint){
        
        let gradiantLayer = CAGradientLayer()
        gradiantLayer.frame = bounds
        gradiantLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
        gradiantLayer.cornerRadius = layer.cornerRadius
//        gradiantLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradiantLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradiantLayer.startPoint = startPoint
        gradiantLayer.endPoint = endPoint
        layer.insertSublayer(gradiantLayer, at: 0)
        
    }
}
