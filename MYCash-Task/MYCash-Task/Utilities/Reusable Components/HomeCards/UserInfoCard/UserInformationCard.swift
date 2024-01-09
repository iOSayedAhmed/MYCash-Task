//
//  UserInfoCard.swift
//  MYCash-Task
//
//  Created by iOSAYed on 09/01/2024.
//

import UIKit

class UserInformationCard: UIView {
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var containerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    
    // This init method is used when the view is created programmatically
        override init(frame: CGRect) {
            super.init(frame: frame)
            loadViewFromNib()
        }

        // This init method is used when the view is loaded from a nib
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            loadViewFromNib()
        }

    
    // MARK: - Methods
    
    private func setupView(){
        containerView.setGradiantBackground(.gray, .white, startPoint: CGPoint(x: 0.0, y: 0.0), endPoint: CGPoint(x: 0.0, y: 1.0))
    }
    
        private func commonInit() {
            // Load the view from the nib file
            let nib = UINib(nibName: "\(UserInformationCard.self)", bundle: nil)
            if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
                // Add the view loaded from the nib to the current view as a subview
                view.frame = self.bounds
                view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                addSubview(view)
            }
        }
    }
    

