//
//  BaseSwipeTableViewCell.swift
//
//
//  Created by Eyüp Yasuntimur on 21.09.2021.
//

import UIKit
import SwipeCellKit

class BaseSwipeTableViewCell: SwipeTableViewCell {

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
