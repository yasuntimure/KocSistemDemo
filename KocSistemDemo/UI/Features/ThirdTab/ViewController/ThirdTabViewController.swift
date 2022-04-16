//
//  ThirdTabViewController.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit
import RxSwift
import RxRelay

class ThirdTabViewController: BaseViewController {

    @IBOutlet weak var topProfileView: TopProfileView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    var subject = Subject.shared
    private let disposeBag = DisposeBag()

    let viewModel = ThirdTabViewModelFactory().makeViewModel()

    var errorMessage: String = "" { didSet { showAlert(message: errorMessage) } }

    var searchResponse: SearchResponseModel = [] {
        didSet {
            updateInfoLabel()
            collectionView.reloadData()
        }
    }

    override func initialComponents() {
        self.viewModel.owned = self
        self.viewModel.fetchData()
        subscribeSubject()
        collectionView.registerCell(type: ArtistProfileCollectionViewCell.self)
        initUI()
    }

    private func initUI() {
        let backgroundColor = ThemeManager.currentTheme().backgroundColor
        view.backgroundColor = backgroundColor
        collectionView.backgroundColor = backgroundColor
        topProfileView.backgroundColor = backgroundColor
        topProfileView.titleLabel.text = "Demo Tab 3"
    }

    private func subscribeSubject() {
        subject
            .removedItemTrackID
            .asObservable()
            .subscribe({ [unowned self] trackID in
            if let trackID = trackID.element {
                self.updateSearchResponse(with: trackID)
            }
        })
            .disposed(by: disposeBag)
    }

    private func updateSearchResponse(with trackID: Int) {
        guard let index = searchResponse.firstIndex(where: { $0.trackID == trackID }) else { return }
        searchResponse.remove(at: index)
        updateInfoLabel()
        collectionView.reloadData()
    }

    private func updateInfoLabel() {
        infoLabel.text = "\(searchResponse.count) results found. "
    }

}


