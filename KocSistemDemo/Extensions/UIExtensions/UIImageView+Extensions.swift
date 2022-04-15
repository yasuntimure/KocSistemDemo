//
//  UIImageView+Extensions.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import Foundation
import UIKit
import Kingfisher

//// MARK: - Kingfiher
extension UIImageView {

    func setKfImage(for urlString: String ) {
        let url = URL(string: urlString)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url,options: KingfisherManager.shared.defaultOptions)
    }

}

// MARK: - Rounded Image
extension UIImageView {
    func makeRounded() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }

    func cornerRadius(_ value: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = value
        self.clipsToBounds = true
    }
}

extension UIImageView {
    func addTransparent(cornerRadius: CGFloat = 0) {
        let tintView = UIView()
        tintView.backgroundColor = UIColor(white: 0, alpha: 0.20)
        tintView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.addSubview(tintView)
        self.layer.cornerRadius = cornerRadius
    }
}
