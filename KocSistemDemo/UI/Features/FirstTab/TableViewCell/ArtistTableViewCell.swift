//
//  ArtistTableViewCell.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit
import SwipeCellKit

class ArtistTableViewCell: SwipeTableViewCell, Reuseable {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var examineButton: PrimaryButton!

    var data: Result? { didSet { updateUI() } }

    override func awakeFromNib() {
        self.backgroundColor = ThemeManager.currentTheme().backgroundColor
        cellView.backgroundColor = ThemeManager.currentTheme().backgroundColor.darker(by: 5)
        cellView.layer.cornerRadius = 14
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
