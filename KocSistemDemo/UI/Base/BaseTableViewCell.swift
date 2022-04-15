//
//  BaseTableViewCell.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    static let abcHeight: CGFloat = 100
    
    class var reuseIdentifier: String {
        return "\(self)"
    }

    class var nibInstance: UINib {
        return .init(nibName: "\(self)", bundle: nil)
    }

    class var defaultHeight: CGFloat {
        return UITableView.automaticDimension
    }
}




