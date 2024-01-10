//
//  PopularViewModel.swift
//  MYCash-Task
//
//  Created by iOSAYed on 10/01/2024.
//

import Foundation
import RxSwift
import RxRelay

final class PopularViewModel {
    
    private let networkService: NetworkService
    private let disposeBag = DisposeBag()

    let popularData = BehaviorRelay<[PopularData]>(value: [])
    let errorRelay = PublishRelay<String>() 

    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getPopular(lat:String,lng:String,filter:String) {
        let params = ["lat":lat,"lon":lng,"filter":filter]
        networkService.request(MyCashEndpoint.homePopular(Parameters: params))
            .subscribe(onSuccess: { [weak self] (popularModel: PopularModel) in
                guard let popularData = popularModel.data else {return}
                self?.popularData.accept(popularData)
            }, onFailure: { [weak self] error in
                self?.errorRelay.accept(error.localizedDescription)
            }).disposed(by: disposeBag)
    }
}

