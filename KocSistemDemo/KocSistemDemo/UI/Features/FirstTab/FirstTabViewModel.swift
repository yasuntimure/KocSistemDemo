//
//  ViewModel.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import Foundation

protocol FirstTabViewModelDelegate: AnyObject {
    func showLoadingIndicator(isShow: Bool)
    func didSuccessLogin()
    func didFailureLogin(errorMessage: String)
}

class FirstTabViewModel: IBaseViewModel {

    let repository: SearchRepository

    weak var delegate: FirstTabViewModelDelegate?

    init(repository: SearchRepository) {
        self.repository = repository
    }

    func fetchData(name: String = "jack", surname: String = "johnson") {

        delegate?.showLoadingIndicator(isShow: true)

        let term = name + " " + surname
        let parameters = SearchRequestParameters(term: term)

        self.repository.getSearch(parameters: parameters) { [weak self] result in
            switch result {
            case .success(let response):
                self?.delegate?.showLoadingIndicator(isShow: false)
                print("Response Geldi", response.results)
//                if let newvalue = response.Value {
//                    self?.delegate?.didSuccessLogin()
//                } else {
//                    self?.delegate?.didFailureLogin(errorMessage: "Beklenmedik bir hata olustu!")
//                }
            case .failure(let errorType):
                self?.delegate?.showLoadingIndicator(isShow: false)
                self?.delegate?.didFailureLogin(errorMessage: errorType.description)
            }
        }
    }
}
