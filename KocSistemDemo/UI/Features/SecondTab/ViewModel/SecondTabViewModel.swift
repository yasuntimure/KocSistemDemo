//
//  SecondTabViewModel.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import Foundation

class SecondTabViewModel: IBaseViewModel {

    var errorMessage: String = "" { didSet { owned?.errorMessage = errorMessage } }
    var data: SearchResponseModel = [] { didSet { owned?.searchResponse = data } }

    weak var owned: SecondTabViewController?
    let repository: SearchRepository

    init(repository: SearchRepository) {
        self.repository = repository
    }
}

extension SecondTabViewModel {
    func fetchData(name: String = "jack", surname: String = "johnson") {
        let term = name + " " + surname
        let parameters = SearchRequestParameters(term: term)
        self.repository.getSearch(parameters: parameters) { [weak self] requestResponse in
            switch requestResponse {
            case .success(let response):
                if let results = response.results {
                    self?.data = results
                } else {
                    self?.errorMessage = "Beklenmedik bir hata olustu!"
                }
            case .failure(let errorType):
                self?.errorMessage = errorType.description
            }
        }
    }
}

