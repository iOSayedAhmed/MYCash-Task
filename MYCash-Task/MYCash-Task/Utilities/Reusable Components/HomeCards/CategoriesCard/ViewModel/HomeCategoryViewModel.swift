//
//  HomeCategoryViewModel.swift
//  MYCash-Task
//
//  Created by iOSAYed on 10/01/2024.
//


import Foundation
import RxSwift
import RxRelay

final class HomeCategoryViewModel {
    
    private let networkService: NetworkService
    private let disposeBag = DisposeBag()

    let categories = BehaviorRelay<[Category]>(value: [])
    let errorRelay = PublishRelay<String>() // For simplicity, using String to represent error messages

    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getCategory() {
        networkService.request(MyCashEndpoint.homeCategory)
            .subscribe(onSuccess: { [weak self] (categoryModel: HomeCategoryModel) in
                guard let categories = categoryModel.data?.data else {return}
                self?.categories.accept(categories)
            }, onFailure: { [weak self] error in
                self?.errorRelay.accept(error.localizedDescription)
            }).disposed(by: disposeBag)
    }
}

