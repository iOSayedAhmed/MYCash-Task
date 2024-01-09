//
//  HomeVC.swift
//  MYCash-Task
//
//  Created by iOSAYed on 09/01/2024.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var mainStackView: UIStackView!
    
    
    private let homeViewModel:HomeViewModel!
    private let disposeBag = DisposeBag()
    
    private let userInformationCard = UserInformationCard()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addCustomViewToStack()
    }

    init(viewModel:HomeViewModel,nibName:String) {
        self.homeViewModel = viewModel
        super.init(nibName: nibName, bundle: nil)
    }
    
    convenience required init() {
        let defaultViewModel = HomeViewModel()
        self.init(viewModel: defaultViewModel, nibName: "\(HomeVC.self)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods

    private func setupView(){
        userInformationCard.configureDataView(userData: homeViewModel.userData ?? UserData())
    }
    
    // Add the custom view to the stack view
    private func addCustomViewToStack() {
            mainStackView.addArrangedSubview(userInformationCard)
        }

}
