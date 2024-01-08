//
//  LoginCoordinator.swift
//  MYCash-Task
//
//  Created by iOSAYed on 08/01/2024.
//

import Foundation
import UIKit

final class LoginCoordinator:Coordinator {

    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController:UINavigationController
//    var parentCoordinator:OnboardingCoordinator?
    
    init(navigationController:UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let loginVC = LoginVC(nibName: "LoginVC", bundle: nil)
//        let loginViewModel = LoginViewModel()
//    loginViewModel.coordinator = self
//        loginVC.viewModel = loginViewModel
        navigationController.setViewControllers([loginVC], animated: false)
    }
    


    
}
