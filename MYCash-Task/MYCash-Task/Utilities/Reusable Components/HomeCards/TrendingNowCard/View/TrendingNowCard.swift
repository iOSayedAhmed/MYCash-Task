//
//  TrendingNowCard.swift
//  MYCash-Task
//
//  Created by iOSAYed on 10/01/2024.
//

import UIKit
import RxSwift
import RxCocoa

class TrendingNowCard: UIView {

    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var viewModel : HomeTrendingViewModel!
    private let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        collectionView.delegate = self
        setupCollectionView()
        bindingViewModel()
    }
    

        override init(frame: CGRect) {
            super.init(frame: frame)
            loadViewFromNib()
            setupView()
            collectionView.delegate = self
            setupCollectionView()
            bindingViewModel()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            loadViewFromNib()
            setupView()
            collectionView.delegate = self
            setupCollectionView()
            bindingViewModel()
        }
    

    
    // MARK: - Methods
    private func setupView(){
  
    }
    
    func configure(with viewModel: HomeTrendingViewModel,userData:UserData) {
        self.viewModel = viewModel
        if !(userData.addresses?.isEmpty ?? false) {
            let lat = userData.addresses?[0].lat ?? ""
            let lng = userData.addresses?[0].lng ?? ""
            viewModel.getTrending(lat: lat , lng: lng,filter: "1")
        }else {
            viewModel.getTrending(lat: "29.1931" , lng: "30.6421",filter: "1")
        }
    }
        
    func bindingViewModel() {
          viewModel?.trindingData
              .bind(to: collectionView.rx.items(cellIdentifier: "\(TrendingCollectionViewCell.self)", cellType: TrendingCollectionViewCell.self)) { index, model, cell in
                  
                  if let imageUrl =  model.image  {
                      cell.image.setImageWithLoading(url: imageUrl)
                  }
              }.disposed(by: disposeBag)
          viewModel?.errorRelay.subscribe(onNext: { [weak self] errorMessage in
              self?.handleError(errorMessage)
          }).disposed(by: disposeBag)
      }
    
    private func handleError(_ errorMessage: String) {
        ToastManager.shared.showToast(message: errorMessage, type: .error, view: self)
    }
    
    
    private func setupCollectionView(){
        collectionView.register(UINib(nibName: "\(TrendingCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(TrendingCollectionViewCell.self)")
    }
    
        private func commonInit() {
            let nib = UINib(nibName: "\(TrendingNowCard.self)", bundle: nil)
            if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
                view.frame = self.bounds
                view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                addSubview(view)
            }
        }

}

extension TrendingNowCard:UICollectionViewDelegateFlowLayout {
   
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width  / 3, height: 130)
    }
}
