//
//  UIImageView + Extensions.swift
//  MYCash-Task
//
//  Created by iOSAYed on 11/01/2024.
//

import Foundation
import SDWebImage

extension UIImageView {
    
    func setImageWithLoading(url: String){
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: URL(string: "\(url)"),placeholderImage: UIImage(systemName: "photo")?.withTintColor(.secondText, renderingMode: .alwaysOriginal))
    }
}
