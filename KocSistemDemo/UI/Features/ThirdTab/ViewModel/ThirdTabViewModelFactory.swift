//
//  ThirdTabViewModelFactory.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import Moya

class ThirdTabViewModelFactory: ViewModelFactory {

    typealias Target = SearchService
    typealias B = SearchRepository
    typealias V = ThirdTabViewModel

    func makeProvider() -> MoyaProvider<SearchService> {
        return createMoyaProvider(targetType: Target.self)
    }

    func makeRepository() -> SearchRepository {
        return SearchRepository(mProvider: makeProvider())
    }

    func makeViewModel() -> ThirdTabViewModel {
        return ThirdTabViewModel(repository: makeRepository())
    }

}
