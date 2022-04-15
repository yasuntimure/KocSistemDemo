//
//  ForthTabViewController.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

class ForthTabViewController: BaseViewController {

    @IBOutlet weak var topProfileView: TopProfileView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    let viewModel = ForthTabViewModelFactory().makeViewModel()

    var errorMessage: String = "" { didSet { showAlert(message: errorMessage) } }

    var searchResponse: SearchResponseModel = [] {
        didSet {
            tableView.reloadData()
            updateInfoLabel()
        }
    }

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
        topProfileView.titleLabel.text = "Demo Tab 4"
    }

    private func updateInfoLabel() {
        infoLabel.text = "\(searchResponse.count) results found. "
    }

}


