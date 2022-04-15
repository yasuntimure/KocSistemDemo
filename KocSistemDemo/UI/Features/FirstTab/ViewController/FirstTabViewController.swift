//
//  ViewController.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import UIKit

class FirstTabViewController: BaseViewController {

    @IBOutlet weak var topProfileView: TopProfileView!
    @IBOutlet weak var tableView: UITableView!

    let viewModel = FirstTabViewModelFactory().makeViewModel()

    var errorMessage: String = "" { didSet { showAlert(message: errorMessage) } }

    var searchResponse: SearchResponseModel = [] { didSet { tableView.reloadData() } }

    override func initialComponents() {
        self.viewModel.owned = self
        tableView.registerCell(type: ArtistTableViewCell.self)
        initUI()
    }

    override func registerEvents() {
        self.viewModel.fetchData()
    }

    private func initUI() {
        let backgroundColor = ThemeManager.currentTheme().backgroundColor
        view.backgroundColor = backgroundColor
        tableView.backgroundColor = backgroundColor
        topProfileView.backgroundColor = backgroundColor
        topProfileView.titleLabel.text = "Demo Tab 1"
    }

}


