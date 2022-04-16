//
//  ForthTabViewController.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit
import RxSwift
import RxRelay

class ForthTabViewController: BaseViewController {

    @IBOutlet weak var topProfileView: TopProfileView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    let subject = Subject.shared
    private let disposeBag = DisposeBag()

    let viewModel = ForthTabViewModelFactory().makeViewModel()

    var errorMessage: String = "" { didSet { showAlert(message: errorMessage) } }

    var searchResponse: SearchResponseModel = [] {
        didSet {
            updateInfoLabel()
            tableView.reloadData()
        }
    }

    override func initialComponents() {
        self.viewModel.owned = self
        self.viewModel.fetchData()
        subscribeSubject()
        tableView.registerCell(type: ArtistTableViewCell.self)
        initUI()
   
    }

    private func initUI() {
        let backgroundColor = ThemeManager.currentTheme().backgroundColor
        view.backgroundColor = backgroundColor
        tableView.backgroundColor = backgroundColor
        topProfileView.backgroundColor = backgroundColor
        topProfileView.titleLabel.text = "Demo Tab 4"
    }

    private func subscribeSubject() {
        subject
            .removedItemTrackID
            .asObservable()
            .subscribe({ [unowned self] trackID  in
                if let trackID = trackID.element {
                    self.updateSearchResponse(with: trackID)
                }
            })
            .disposed(by: disposeBag)
    }

    private func updateSearchResponse(with trackID: Int) {
        guard let index = searchResponse.firstIndex(where: {$0.trackID == trackID}) else {return}
        searchResponse.remove(at: index)
        updateInfoLabel()
        tableView.reloadData()
    }

    private func updateInfoLabel() {
        infoLabel.text = "\(searchResponse.count) results found. "
    }

}
