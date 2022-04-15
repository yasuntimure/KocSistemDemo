//
//  ViewModelFactory.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import Moya

protocol ViewModelFactory {

    associatedtype Target: TargetType
    associatedtype B: IBaseRepository
    associatedtype V: IBaseViewModel

    func makeProvider() -> MoyaProvider<Target>
    func makeRepository() -> B
    func makeViewModel() -> V
}

extension ViewModelFactory {

    func createMoyaProvider<Target: TargetType>(targetType: Target.Type) -> MoyaProvider<Target> {
        let provider = MoyaProvider<Target>()
        provider.session.sessionConfiguration.timeoutIntervalForRequest = 120
        return provider
    }

}
