//
//  AppCoordinator.swift
//  MYCash-Task
//
//  Created by iOSAYed on 08/01/2024.
//

import UIKit

protocol Coordinator:AnyObject{
    var childCoordinators:[Coordinator] {get}
    func start()
}



final class AppCoordinator:Coordinator {
    
   private(set) var childCoordinators: [Coordinator] = []
   private let navigationController = UINavigationController()

    private let window:UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        startSplashScreen()
    }
    
    
    func startSplashScreen(){
//        let splashScreenCoordinator = SplashScreenCoordinator(navigationController: navigationController)
        let splashScreenCoordinator = LoginCoordinator(navigationController: navigationController)
        childCoordinators.append(splashScreenCoordinator)
        splashScreenCoordinator.start()
    }
    
 
    
}

