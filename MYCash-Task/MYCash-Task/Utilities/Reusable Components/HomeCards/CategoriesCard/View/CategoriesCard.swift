//
//  CategoriesCard.swift
//  MYCash-Task
//
//  Created by iOSAYed on 10/01/2024.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class CategoriesCard: UIView {

    
    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: HomeCategoryViewModel!
    private var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
           super.awakeFromNib()
           setupView()
        collectionView.delegate = self
        setupCollectionView()
        bindingViewModel()
       }
       
       func configure(with viewModel: HomeCategoryViewModel) {
           self.viewModel = viewModel
           viewModel.getCategory()
       }
    

        override init(frame: CGRect) {
            super.init(frame: frame)
            loadViewFromNib()
            collectionView.delegate = self
            setupCollectionView()
            bindingViewModel()

        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            loadViewFromNib()
            bindingViewModel()
        }
    
     func bindingViewModel() {
           viewModel?.categories
               .bind(to: collectionView.rx.items(cellIdentifier: "\(CategoriesCardCell.self)", cellType: CategoriesCardCell.self)) { index, model, cell in
                   cell.title.text = model.nameEn ?? ""
                   if let imageUrl =  model.image  {
                       cell.image.setImageWithLoading(url: imageUrl)
                   }
               }.disposed(by: disposeBag)
           viewModel?.errorRelay.subscribe(onNext: { [weak self] errorMessage in
               self?.handleError(errorMessage)
           }).disposed(by: disposeBag)
       }


    
    // MARK: - Methods
    private func setupCollectionView(){
        collectionView.register(UINib(nibName: "\(CategoriesCardCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(CategoriesCardCell.self)")}
    
    private func setupView(){
   
    }
    
    private func handleError(_ errorMessage: String) {
        ToastManager.shared.showToast(message: errorMessage, type: .error, view: self)
    }


        private func commonInit() {
            // Load the view from the nib file
            let nib = UINib(nibName: "\(CategoriesCard.self)", bundle: nil)
            if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
                view.frame = self.bounds
                view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                addSubview(view)
            }
        }

}

extension CategoriesCard:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width  / 3, height: 140)
    }
}
