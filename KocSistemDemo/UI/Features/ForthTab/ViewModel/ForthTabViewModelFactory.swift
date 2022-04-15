//
//  ForthTabViewModelFactory.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import Moya

class ForthTabViewModelFactory: ViewModelFactory {

    typealias Target = SearchService
    typealias B = SearchRepository
    typealias V = ForthTabViewModel

    func makeProvider() -> MoyaProvider<SearchService> {
        return createMoyaProvider(targetType: Target.self)
    }

    func makeRepository() -> SearchRepository {
        return SearchRepository(mProvider: makeProvider())
    }

    func makeViewModel() -> ForthTabViewModel {
        return ForthTabViewModel(repository: makeRepository())
    }

}

