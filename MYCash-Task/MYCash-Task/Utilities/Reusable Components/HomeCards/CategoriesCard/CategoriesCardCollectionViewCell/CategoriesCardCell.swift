//
//  CategoriesCardCell.swift
//  MYCash-Task
//
//  Created by iOSAYed on 10/01/2024.
//

import UIKit

class CategoriesCardCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    func setupView(){
        containerView.applyShadow(color: Colors.colorOfShadowCells ?? .gray, alpha: 0.3, x: 0, y: 8, blur: 10, spread: 0)
    }

}
