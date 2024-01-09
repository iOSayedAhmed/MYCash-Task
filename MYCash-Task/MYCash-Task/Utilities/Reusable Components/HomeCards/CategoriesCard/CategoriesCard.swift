//
//  CategoriesCard.swift
//  MYCash-Task
//
//  Created by iOSAYed on 10/01/2024.
//

import UIKit

class CategoriesCard: UIView {

    
    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        collectionView.delegate = self
        collectionView.dataSource = self
        setupCollectionView()

    }
    

        override init(frame: CGRect) {
            super.init(frame: frame)
            loadViewFromNib()
            setupView()
            collectionView.delegate = self
            collectionView.dataSource = self
            setupCollectionView()

        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            loadViewFromNib()
            setupView()
            collectionView.delegate = self
            collectionView.dataSource = self
            setupCollectionView()
        }
    

    
    // MARK: - Methods
    
    
    private func setupView(){
       // containerView.setGradiantBackground(.gray, .white, startPoint: CGPoint(x: 0.0, y: 0.0), endPoint: CGPoint(x: 0.0, y: 1.0))
    }
    
    private func setupCollectionView(){
        collectionView.register(UINib(nibName: "\(CategoriesCardCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(CategoriesCardCell.self)")
    }
    
        private func commonInit() {
            // Load the view from the nib file
            let nib = UINib(nibName: "\(CategoriesCard.self)", bundle: nil)
            if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
                // Add the view loaded from the nib to the current view as a subview
                view.frame = self.bounds
                view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                addSubview(view)
            }
        }

}

extension CategoriesCard:UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoriesCardCell.self)", for: indexPath) as? CategoriesCardCell else {return UICollectionViewCell()}
        return cell
    }
    
    
}
