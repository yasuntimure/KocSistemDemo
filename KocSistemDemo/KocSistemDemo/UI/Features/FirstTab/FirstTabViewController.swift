//
//  ViewController.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import UIKit

class FirstTabViewController: BaseViewController {

    let viewModel = FirstTabViewModelFactory().makeViewModel()

    override func initialComponents() {
        self.viewModel.delegate = self
    }

    override func registerEvents() {
        self.viewModel.fetchData()
    }


}

extension FirstTabViewController: FirstTabViewModelDelegate {
    func showLoadingIndicator(isShow: Bool) {
        self.showProgressView(showLoader: isShow)
    }

    func didSuccessLogin() {
        //
    }

    func didFailureLogin(errorMessage: String) {
        self.showAlert(message: errorMessage)
    }

}
