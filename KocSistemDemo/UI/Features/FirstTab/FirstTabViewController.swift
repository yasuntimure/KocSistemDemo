//
//  ViewController.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import UIKit

class FirstTabViewController: BaseViewController {

    @IBOutlet weak var topProfileView: TopProfileView!

    let viewModel = FirstTabViewModelFactory().makeViewModel()

    var isLoading: Bool = false { didSet { showProgressView(showLoader: isLoading) } }
    var errorMessage: String = "" { didSet { showAlert(message: errorMessage) } }
    var data: SearchResponseModel = [] //{ didSet { // } }

    override func initialComponents() {
        self.viewModel.owned = self
        topProfileView.titleLabel.text = "Demo Project"
    }

    override func registerEvents() {
        self.viewModel.fetchData()
    }


}


