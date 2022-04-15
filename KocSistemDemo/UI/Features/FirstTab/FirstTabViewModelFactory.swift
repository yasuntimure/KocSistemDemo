//
//  ViewController.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import Moya

class FirstTabViewModelFactory: ViewModelFactory {

    typealias Target = SearchService
    typealias B = SearchRepository
    typealias V = FirstTabViewModel

    func makeProvider() -> MoyaProvider<SearchService> {
        return createMoyaProvider(targetType: Target.self)
    }

    func makeRepository() -> SearchRepository {
        return SearchRepository(mProvider: makeProvider())
    }

    func makeViewModel() -> FirstTabViewModel {
        return FirstTabViewModel(repository: makeRepository())
    }

}
