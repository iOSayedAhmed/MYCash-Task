//
//  HomeTrendingViewModel.swift
//  MYCash-Task
//
//  Created by iOSAYed on 10/01/2024.
//

import Foundation
import RxSwift
import RxRelay

final class HomeTrendingViewModel {
    
    private let networkService: NetworkService
    private let disposeBag = DisposeBag()

    let trindingData = BehaviorRelay<[PopularData]>(value: [])
    let errorRelay = PublishRelay<String>()

    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getTrending(lat:String,lng:String,filter:String) {
        let params = ["lat":lat,"lon":lng,"filter":filter]
        networkService.request(MyCashEndpoint.homePopular(Parameters: params))
            .subscribe(onSuccess: { [weak self] (trindingModel: PopularModel) in
                guard let trindingData = trindingModel.data else {return}
                self?.trindingData.accept(trindingData)
            }, onFailure: { [weak self] error in
                self?.errorRelay.accept(error.localizedDescription)
            }).disposed(by: disposeBag)
    }
}

