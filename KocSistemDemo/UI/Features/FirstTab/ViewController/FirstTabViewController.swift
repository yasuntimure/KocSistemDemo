//
//  ViewController.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import UIKit
import RxSwift
import RxRelay

class FirstTabViewController: BaseViewController {

    @IBOutlet weak var topProfileView: TopProfileView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    let subject = Subject.shared
    private let disposeBag = DisposeBag()

    let viewModel = FirstTabViewModelFactory().makeViewModel()

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeSubject()
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

    private func initUI() {
        let backgroundColor = ThemeManager.currentTheme().backgroundColor
        view.backgroundColor = backgroundColor
        tableView.backgroundColor = backgroundColor
        topProfileView.backgroundColor = backgroundColor
        topProfileView.titleLabel.text = "Demo Tab 1"
    }

    private func updateInfoLabel() {
        infoLabel.text = "\(searchResponse.count) results found. "
    }

}
