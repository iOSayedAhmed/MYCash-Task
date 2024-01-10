//
//  TrendingCollectionViewCell.swift
//  MYCash-Task
//
//  Created by iOSAYed on 10/01/2024.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
        
    }
    func setupView(){
        containerView.applyShadow(color: Colors.colorOfShadowCells!, alpha: 0.3, x: 0, y: 5, blur: 10, spread: 0)
    }
}
