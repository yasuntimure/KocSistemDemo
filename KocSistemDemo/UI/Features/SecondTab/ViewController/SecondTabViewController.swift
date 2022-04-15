//
//  SecondTabViewController.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

class SecondTabViewController: BaseViewController {

    @IBOutlet weak var topProfileView: TopProfileView!
    @IBOutlet weak var collectionView: UICollectionView!

    let viewModel = SecondTabViewModelFactory().makeViewModel()

    var errorMessage: String = "" { didSet { showAlert(message: errorMessage) } }

    var searchResponse: SearchResponseModel = [] { didSet { collectionView.reloadData() } }

    override func initialComponents() {
        self.viewModel.owned = self
        collectionView.registerCell(type: ArtistCollectionViewCell.self)
        initUI()
    }

    override func registerEvents() {
        self.viewModel.fetchData()
    }

    private func initUI() {
        let backgroundColor = ThemeManager.currentTheme().backgroundColor
        view.backgroundColor = backgroundColor
        collectionView.backgroundColor = backgroundColor
        topProfileView.backgroundColor = backgroundColor
        topProfileView.titleLabel.text = "Demo Tab 2"
    }
}

