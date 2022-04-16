//
//  ThumbnailCollectionViewCell.swift
//  YemekCom
//
//  Created by Eyüp on 2.02.2022.
//

import UIKit
import Kingfisher

final class ArtistCollectionViewCell: UICollectionViewCell, Reuseable {

    var data: Result? { didSet { updateUI() } }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var examineButton: PrimaryButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }

    private func initUI() {
        self.backgroundColor = .white.darker(by: 4.0)
        self.layer.cornerRadius = 14
        titleLabel.textColor = ThemeManager.currentTheme().primaryTextColor
        infoLabel.textColor = ThemeManager.currentTheme().secondaryTextColor
    }

    func updateUI() {
        titleLabel.text = data?.artistName ?? "artistName"
        infoLabel.text = data?.trackName ?? "trackName"
    }

}
