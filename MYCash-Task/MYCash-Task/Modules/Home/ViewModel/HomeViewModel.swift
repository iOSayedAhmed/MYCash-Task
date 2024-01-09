//
//  HomeViewModel.swift
//  MYCash-Task
//
//  Created by iOSAYed on 09/01/2024.
//

import Foundation
protocol HomeViewModelProtocol{
    
}

final class HomeViewModel:HomeViewModelProtocol {
    private var coordinator:HomeCoordinator?
    private var networkService:NetworkService?
    private var userData:UserData?
    
    init(coordinator: HomeCoordinator? = nil, networkService: NetworkService? = nil, userData:UserData? = nil) {
        self.coordinator = coordinator
        self.networkService = networkService
        self.userData = userData
    }
    
    
}