//
//  PopularNowCell.swift
//  MYCash-Task
//
//  Created by iOSAYed on 10/01/2024.
//

import UIKit

class PopularNowCell: UICollectionViewCell {

    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        
    }
    
    func setupView(){
        containerView.applyShadow(color: Colors.brownColor?.withAlphaComponent(0.5) ?? .brown, alpha: 0.3, x: 4, y: 7, blur: 20, spread: 0)
    }

    
}
