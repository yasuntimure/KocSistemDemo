//
//  PrimaryTitleLabel.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

class PrimaryTitleLabel: UILabel {
    var fontSize: CGFloat? {
        didSet {
            self.font = UIFont.boldSystemFont(ofSize: fontSize ?? 22)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI()
    }

    private func initUI() {
        self.font = UIFont.boldSystemFont(ofSize: 22)
        self.textColor = ThemeManager.currentTheme().primaryTextColor
    }
}
