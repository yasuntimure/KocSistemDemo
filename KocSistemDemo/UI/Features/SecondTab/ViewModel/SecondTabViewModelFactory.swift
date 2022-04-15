//
//  SecondTabViewModelFactory.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import Moya

class SecondTabViewModelFactory: ViewModelFactory {

    typealias Target = SearchService
    typealias B = SearchRepository
    typealias V = SecondTabViewModel

    func makeProvider() -> MoyaProvider<SearchService> {
        return createMoyaProvider(targetType: Target.self)
    }

    func makeRepository() -> SearchRepository {
        return SearchRepository(mProvider: makeProvider())
    }

    func makeViewModel() -> SecondTabViewModel {
        return SecondTabViewModel(repository: makeRepository())
    }

}

