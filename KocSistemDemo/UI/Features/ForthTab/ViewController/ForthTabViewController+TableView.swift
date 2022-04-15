//
//  ForthTabViewController+TableView.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

extension ForthTabViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResponse.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArtistTableViewCell.reuseIdentifier, for: indexPath) as? ArtistTableViewCell else { return UITableViewCell() }
        let data = searchResponse[indexPath.row]
        cell.data = data

        cell.examineButton.onTap { _ in
            self.pushViewController(DetailViewController(data: data))
        }
        return cell
    }

}

