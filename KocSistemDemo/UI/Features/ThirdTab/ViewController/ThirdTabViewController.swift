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
            reloadCollectionView()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.viewModel.owned = self
        self.viewModel.fetchData()
        subscribeSubject()
    }

    override func initialComponents() {
        initUI()
        collectionView.registerCell(type: ArtistProfileCollectionViewCell.self)
        updateInfoLabel()
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
        reloadCollectionView()
    }

    private func updateInfoLabel() {
        if let infoLabel = infoLabel {
            infoLabel.text = "\(searchResponse.count) results found. "
        }
    }

    private func reloadCollectionView() {
        if let collectionView = collectionView {
            collectionView.reloadData()
        }
    }

}


