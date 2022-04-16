//
//  ArtistTableViewCell.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit
import SwipeCellKit

class ArtistTableViewCell: UITableViewCell, Reuseable {

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var examineButton: PrimaryButton!
    @IBOutlet weak var deleteButton: PrimaryButton!

    var data: Result? { didSet { updateUI() } }

    override func awakeFromNib() {
        self.backgroundColor = ThemeManager.currentTheme().backgroundColor
    }

    private func updateUI() {
        if let data = data {
            if let artistName = data.artistName {
                artistLabel.text = artistName
            }

            if let trackName = data.trackName {
                trackLabel.text = trackName
            }
        }
    }

}
