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

    var searchResponse: SearchResponseModel = [] {
        didSet {
            self.updatedSearchResponse = searchResponse
            tableView.reloadData()
        }
    }

    override func initialComponents() {
        self.viewModel.owned = self
        tableView.registerCell(type: ArtistTableViewCell.self)
        initUI()
        addDeleteObserver()
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

extension FirstTabViewController {
    func addDeleteObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.observerCalled(_:)), name: NSNotification.Name(rawValue: StaticKeys.deleteIdentifier1.rawValue), object: nil)
    }


     // handle notification
     @objc func observerCalled(_ notification: NSNotification) {
         if let dict = notification.userInfo as NSDictionary? {
             if let index = dict["index"] as? Int {
                 self.searchResponse.remove(at: index)
             }
         }
         self.tableView.reloadData()
     }
}




