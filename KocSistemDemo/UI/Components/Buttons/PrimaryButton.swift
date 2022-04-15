//
//  PrimaryButton.swift
//  YemekCom
//
//  Created by Eyüp on 19.01.2022.
//

import UIKit

class PrimaryButton: BaseReusableButton {

    private var defaultBackgroundColor = ThemeManager.currentTheme().primaryButtonColor
    private let titleColor = ThemeManager.currentTheme().primaryButtonTitleColor
    private let cornerRadius = 8

    override var isHighlighted: Bool {
        didSet {
            backgroundColor =
            isHighlighted ? defaultBackgroundColor.darker(by: 5) : defaultBackgroundColor
        }
    }

    override func initializeSelf() {
        setTitleColorWithFont()
        backgroundColor = defaultBackgroundColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = CGFloat(cornerRadius)
    }

}

extension PrimaryButton {

    func setTitleColorWithFont() {
        setTitleColor(titleColor, for: .normal)
        tintColor = titleColor

    }

}
