//
//  TopProfileView.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

class TopProfileView: BaseReusableView, CustomViewProtocol {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var titleLabel: PrimaryTitleLabel!

    override func initialize() {
        self.commonInit(for: nibName())
        initUI()
    }

    private func initUI() {
        contentView.backgroundColor = ThemeManager.currentTheme().backgroundColor
        profileImage.makeRounded()
    }
}
