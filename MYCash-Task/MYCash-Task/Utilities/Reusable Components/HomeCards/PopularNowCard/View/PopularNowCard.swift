//
//  PopularNowCard.swift
//  MYCash-Task
//
//  Created by iOSAYed on 10/01/2024.
//

import UIKit
import RxSwift
import RxCocoa

class PopularNowCard: UIView {

        @IBOutlet weak var viewAllButton: UIButton!
        @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel : PopularViewModel!
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
                setupCollectionView()
            }
        

        
        // MARK: - Methods
    
    func configure(with viewModel: PopularViewModel,userData:UserData) {
        self.viewModel = viewModel
        if !(userData.addresses?.isEmpty ?? false) {
            let lat = userData.addresses?[0].lat ?? ""
            let lng = userData.addresses?[0].lng ?? ""
            viewModel.getPopular(lat: lat , lng: lng,filter: "1")
        }else {
            viewModel.getPopular(lat: "29.1931" , lng: "30.6421",filter: "1")
        }
    }
        
    func bindingViewModel() {
          viewModel?.popularData
              .bind(to: collectionView.rx.items(cellIdentifier: "\(PopularNowCell.self)", cellType: PopularNowCell.self)) { index, model, cell in
                  cell.title.text = model.name ?? ""
                  if let imageUrl =  model.image  {
                      cell.backgroundImage.setImageWithLoading(url: imageUrl)
                  }
                  cell.distanceLabel.text = model.distance ?? ""
                  cell.rateLabel.text = model.rate ?? ""
              }.disposed(by: disposeBag)
          viewModel?.errorRelay.subscribe(onNext: { [weak self] errorMessage in
              self?.handleError(errorMessage)
          }).disposed(by: disposeBag)
      }

        private func setupView(){
           
        }
    
    private func handleError(_ errorMessage: String) {
        ToastManager.shared.showToast(message: errorMessage, type: .error, view: self)
    }
        
        private func setupCollectionView(){
            collectionView.register(UINib(nibName: "\(PopularNowCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(PopularNowCell.self)")
        }
        
            private func commonInit() {
                let nib = UINib(nibName: "\(PopularNowCard.self)", bundle: nil)
                if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
                    view.frame = self.bounds
                    view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                    addSubview(view)
                }
            }

    }

    extension PopularNowCard:UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: self.frame.size.width / 2 , height: collectionView.frame.size.height - 10)
        }
    }

