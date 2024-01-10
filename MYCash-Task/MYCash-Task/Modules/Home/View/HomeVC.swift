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
    private let categoriesCard = CategoriesCard()
    private let popularNowCard = PopularNowCard()
    private let trendingNowCard = TrendingNowCard()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupView()
        setupNavigationBar()
        addCustomViewToStack()
        getHomeCategory()
        getHomePopular()
        getHomeTrending()
        
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
        homeViewModel.retriveUserData()
        self.title = "Home"
        userInformationCard.configureDataView(userData: homeViewModel.userData ?? UserData())
    }
    
    private func setupNavigationBar(){
        // Create images
        let image1 = UIImage(named: "CartIcon")
        let image2 = UIImage(named: "MenuIcon")
        
        let cartButton = UIButton(type: .custom)
        cartButton.frame = CGRect(x: 0.0, y: 0.0, width: 30, height: 30)
        cartButton.setImage(image1, for: .normal)
        cartButton.addTarget(self, action: #selector(didTapCartButton), for: UIControl.Event.touchUpInside)
        
        let cartBarItem = UIBarButtonItem(customView: cartButton)
        
        let MenuBarItem = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        MenuBarItem.setImage(image2, for: .normal)
        MenuBarItem.addTarget(self, action: #selector(didTapMenuButton), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem.init(customView: MenuBarItem),cartBarItem]
    }
    
    private func getHomeCategory(){
        let viewModel = HomeCategoryViewModel(networkService: BasicNetworkService())
                categoriesCard.viewModel = viewModel
                categoriesCard.bindingViewModel()
                viewModel.getCategory()
    }
    
    private func getHomePopular(){
        let viewModel = PopularViewModel(networkService: BasicNetworkService())
        popularNowCard.viewModel = viewModel
        popularNowCard.bindingViewModel()
        guard let userData = homeViewModel.userData else {return}
        if !(userData.addresses?.isEmpty ?? false) {
            let lat = userData.addresses?[0].lat ?? ""
            let lng = userData.addresses?[0].lng ?? ""
            viewModel.getPopular(lat: lat , lng: lng,filter: "1")
        }else {
            viewModel.getPopular(lat: "29.1931" , lng: "30.6421",filter: "1")
        }
    }
    
    private func getHomeTrending(){
        let viewModel = HomeTrendingViewModel(networkService: BasicNetworkService())
        trendingNowCard.viewModel = viewModel
        trendingNowCard.bindingViewModel()
        guard let userData = homeViewModel.userData else {return}
        if !(userData.addresses?.isEmpty ?? false) {
            let lat = userData.addresses?[0].lat ?? ""
            let lng = userData.addresses?[0].lng ?? ""
            viewModel.getTrending(lat: lat , lng: lng,filter: "1")
        }else {
            viewModel.getTrending(lat: "29.1931" , lng: "30.6421",filter: "1")
        }
    }
    // Add the custom view to the stack view
    private func addCustomViewToStack() {
        categoriesCard.translatesAutoresizingMaskIntoConstraints = false
        popularNowCard.translatesAutoresizingMaskIntoConstraints = false
        trendingNowCard.translatesAutoresizingMaskIntoConstraints = false
        
        mainStackView.addArrangedSubview(userInformationCard)
        mainStackView.addArrangedSubview(categoriesCard)
        mainStackView.addArrangedSubview(popularNowCard)
        mainStackView.addArrangedSubview(trendingNowCard)
        
        categoriesCard.heightAnchor.constraint(equalToConstant: 250).isActive = true
        popularNowCard.heightAnchor.constraint(equalToConstant: 300).isActive = true
        trendingNowCard.heightAnchor.constraint(equalToConstant: 220).isActive = true
    }
    
    
    @objc private func didTapCartButton() {
        // Handle Cart tap
        print("Go To Cart View")
    }
    
    @objc private func didTapMenuButton() {
        // Handle Menu tap
        print("Go To Menu View")
    }
    
}
