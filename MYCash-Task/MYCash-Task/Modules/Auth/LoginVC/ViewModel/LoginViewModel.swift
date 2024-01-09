//
//  LoginViewModel.swift
//  MYCash-Task
//
//  Created by iOSAYed on 09/01/2024.
//

import Foundation
import RxSwift
import RxRelay

protocol LoginViewModelProtocol{
    func login(email:String,password:String,deviceToken:String)
    
}

final class LoginViewModel:LoginViewModelProtocol {
   
    private var coordinator:LoginCoordinator?
    private var networkService:NetworkService?
    private let disposeBag = DisposeBag()

    private let loginResultSubject = PublishSubject<UserData>()
    
    let isLoading = BehaviorRelay<Bool>(value: false)
    // Observable for outside classes to subscribe to
       var loginResult: Observable<UserData> {
           return loginResultSubject.asObservable()
       }
    
    init(coordinator: LoginCoordinator? = nil,networkService:NetworkService? = nil) {
        self.coordinator = coordinator
        self.networkService = networkService
    }
    
    
    func login(email: String, password: String, deviceToken: String) {
        isLoading.accept(true)
        guard let networkService = networkService else {
               print("NetworkService is nil")
               return
           }
        let params = ["email":email,"password":password,"device_token":deviceToken]
        
        networkService.request(MyCashEndpoint.login(parameters: params))
            
            .subscribe(onSuccess: { [weak self] (loginModel:LoginModel) in
                guard let self , let userData = loginModel.data else {return}
                self.isLoading.accept(false)
                self.loginResultSubject.onNext(userData)
            },onFailure: { error in
                self.isLoading.accept(false)
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
    func didUserLoggedIn(userData:UserData){
        coordinator?.startHomeCoordinator(userData: userData)
    }
}
