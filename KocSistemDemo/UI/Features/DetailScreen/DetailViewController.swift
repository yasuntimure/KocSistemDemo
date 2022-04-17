//
//  DetailViewController.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

class DetailViewController: BaseViewController {

    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var info1Label: UILabel!
    @IBOutlet weak var info2Label: UILabel!
    @IBOutlet weak var info3Label: UILabel!

    var data: Result

    init(data: Result) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func initialComponents() {
        initUI()
    }

    private func initUI() {
        if let imagePath = data.artworkUrl100 {
            artistImage.setKfImage(for: imagePath)
            artistImage.makeRounded()
        } else {
            artistImage.image = UIImage(named: "profileImage")
        }

        artistNameLabel.text = data.artistName ?? "Artist Name"
        info1Label.text = data.trackName ?? "info1Label"
        info2Label.text = data.releaseDate?.format() ?? "releaseDate"
        info3Label.text = String(data.trackPrice ?? 0) + "$"
    }

}
