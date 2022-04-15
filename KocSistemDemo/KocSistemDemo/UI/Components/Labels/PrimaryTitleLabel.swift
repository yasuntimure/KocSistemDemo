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
            self.font = FontBook.Poppins.semibold.of(size: fontSize ?? 18.0)
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
        self.font = FontBook.Poppins.semibold.of(size: 18.0)
        self.textColor = ThemeManager.currentTheme().primaryTextColor
    }
}
