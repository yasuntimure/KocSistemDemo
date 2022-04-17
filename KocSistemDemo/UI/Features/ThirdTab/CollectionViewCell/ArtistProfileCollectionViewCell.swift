//
//  ArtistProfileCollectionViewCell.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

class ArtistProfileCollectionViewCell: UICollectionViewCell, Reuseable {

    var data: Result? { didSet { updateUI() } }

    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var artistNameLabel: PrimaryTitleLabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var trackPriceLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }

    private func initUI() {
        roundBackground()
        setColors()
        artistImage.makeRounded()
    }

    func updateUI() {
        if let imagePath = data?.artworkUrl100 {
            artistImage.setKfImage(for: imagePath)
        } else {
            artistImage.image = UIImage(named: "profileImage")
        }
        artistNameLabel.text = data?.artistName ?? "artistName"
        trackNameLabel.text = data?.trackName ?? "trackName"
        releaseDateLabel.text = data?.releaseDate?.format() ?? "releaseDate"
        trackPriceLabel.text = String(data?.trackPrice ?? 0) + "$"
    }

    private func roundBackground() {
        self.layer.cornerRadius = 14
    }

    private func setColors() {
        self.backgroundColor = .white.darker(by: 4.0)
        artistNameLabel.textColor = ThemeManager.currentTheme().primaryTextColor
        trackNameLabel.textColor = ThemeManager.currentTheme().secondaryTextColor
        trackPriceLabel.textColor = ThemeManager.currentTheme().secondaryTextColor
        releaseDateLabel.textColor = ThemeManager.currentTheme().secondaryTextColor
    }

}
