//
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

protocol Fontable {
    var family: String { get }
    var style: String { get }
    func of(size: CGFloat) -> UIFont
}

extension Fontable {
    func of(size: CGFloat = 12) -> UIFont {
        return UIFont(name: "\(self.family)-\(self.style)", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

public struct FontBook {

    enum Poppins: String, Fontable {
        var family: String {
            return "Poppins"
        }

        var style: String {
            return self.rawValue
        }

        case regular
        case bold
        case semibold
        case boldItalic
        case condensedBlack
        case condensedBold
        case italic
        case light
        case lightItalic
        case medium
        case mediumItalic
        case thin
        case thinItalic
        case ultraLight
        case ultraLightItalic

    }
}
