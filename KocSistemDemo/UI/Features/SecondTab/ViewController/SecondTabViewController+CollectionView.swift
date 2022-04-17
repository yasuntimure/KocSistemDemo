//
//  SecondTabViewController+CollectionView.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

// MARK: - UICollectionViewDataSource
extension SecondTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResponse.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistCollectionViewCell.reuseIdentifier, for: indexPath) as? ArtistCollectionViewCell
            else { return UICollectionViewCell() }
        let data = searchResponse[indexPath.row]
        cell.data = data
        cell.deleteButton.onTap { [unowned self] _ in
            if let trackID = data.trackID { self.subject.removedItemTrackID.accept(trackID) }
        }
        cell.examineButton.onTap { [unowned self] _ in
            self.pushViewController(DetailViewController(data: data))
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SecondTabViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (Screen.width - 48 - 12) / 2
        let cellHeight: CGFloat = cellWidth - 40
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
        return UIEdgeInsets(top: 12, left: 24, bottom: 0, right: 24)
    }
}
