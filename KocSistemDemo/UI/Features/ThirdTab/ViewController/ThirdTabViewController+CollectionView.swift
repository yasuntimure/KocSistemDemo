//
//  ThirdTabViewController+CollectionView.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

// MARK: - UICollectionViewDataSource
extension ThirdTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResponse.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistProfileCollectionViewCell.reuseIdentifier, for: indexPath) as? ArtistProfileCollectionViewCell
            else { return UICollectionViewCell() }
        let data = searchResponse[indexPath.row]
        cell.data = data
        cell.deleteButton.onTap { [unowned self] _ in
            if let trackID = data.trackID { self.subject.removedItemTrackID.accept(trackID) }
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ThirdTabViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (Screen.width - 72)
        let cellHeight: CGFloat = cellWidth * 1.5
        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
}
