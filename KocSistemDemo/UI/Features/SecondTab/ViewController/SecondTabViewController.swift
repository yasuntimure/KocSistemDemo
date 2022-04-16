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
        addDeleteObserver()
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

extension SecondTabViewController {
    func addDeleteObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.observerCalled(_:)), name: NSNotification.Name(rawValue: StaticKeys.deleteIdentifier2.rawValue), object: nil)
    }


     // handle notification
     @objc func observerCalled(_ notification: NSNotification) {
         if let dict = notification.userInfo as NSDictionary? {
             if let index = dict["index"] as? Int {
                 self.searchResponse.remove(at: index)
             }
         }
         self.collectionView.reloadData()
     }
}

