//
//  SignupCoordinator.swift
//  MYCash-Task
//
//  Created by iOSAYed on 09/01/2024.
//


import Foundation
import UIKit

final class SignupCoordinator:Coordinator {

    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController:UINavigationController
//    var parentCoordinator:OnboardingCoordinator?
    
    init(navigationController:UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let signupVC = SignupVC()
//        let loginViewModel = LoginViewModel()
//    loginViewModel.coordinator = self
//        loginVC.viewModel = loginViewModel
        navigationController.setViewControllers([signupVC], animated: true)
    }
    


    
}
