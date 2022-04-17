//
//  FirstTabViewController+TableView.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit
import SwipeCellKit

extension FirstTabViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResponse.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArtistTableViewCell.reuseIdentifier, for: indexPath) as? ArtistTableViewCell else { return UITableViewCell() }
        let data = searchResponse[indexPath.row]
        cell.data = data
        cell.delegate = self
        cell.examineButton.onTap { [unowned self] _ in
            self.pushViewController(DetailViewController(data: data))
        }
        return cell
    }

}


// MARK:- SwipeTableViewCellDelegate
extension FirstTabViewController: SwipeTableViewCellDelegate {

    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .fill
        options.transitionStyle = .border
        options.backgroundColor = .clear
        return options
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArtistTableViewCell.reuseIdentifier, for: indexPath) as? ArtistTableViewCell else { fatalError() }
        guard let trackID = searchResponse[indexPath.row].trackID else { fatalError() }
        cell.delegate = self
        guard orientation == .right else { return nil }
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { [weak self] action, _ in
            self?.tableView.performBatchUpdates {
                action.fulfill(with: .delete)
                self?.subject.removedItemTrackID.accept(trackID)
            }
        }
        deleteAction.backgroundColor = .systemBlue.lighter()
        return [deleteAction]
    }
}


