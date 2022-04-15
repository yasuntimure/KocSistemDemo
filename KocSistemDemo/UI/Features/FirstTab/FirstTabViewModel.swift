//
//  ViewModel.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import Foundation

class FirstTabViewModel: IBaseViewModel {
    weak var repository: SearchRepository?
    weak var owned: FirstTabViewController?

    var isLoading: Bool = false { didSet { owned?.isLoading = isLoading } }
    var errorMessage: String = "" { didSet { owned?.errorMessage = errorMessage } }
    var data: SearchResponseModel = [] { didSet { owned?.data = data } }

    init(repository: SearchRepository) {
        self.repository = repository
    }
}

extension FirstTabViewModel {
    func fetchData(name: String = "jack", surname: String = "johnson") {
        isLoading = true
        let term = name + " " + surname
        let parameters = SearchRequestParameters(term: term)
        self.repository?.getSearch(parameters: parameters) { [weak self] requestResponse in
            switch requestResponse {
            case .success(let response):
                self?.isLoading = false
                if let results = response.results {
                    self?.data = results
                } else {
                    self?.errorMessage = "Beklenmedik bir hata olustu!"
                }
            case .failure(let errorType):
                self?.isLoading = false
                self?.errorMessage = errorType.description
            }
        }
    }
}
