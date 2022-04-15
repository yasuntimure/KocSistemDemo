//
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

public extension CGFloat {

    /// Absolute of CGFloat value.
    var abs: CGFloat {
        return Swift.abs(self)
    }

    /// Ceil of CGFloat value.
    var ceil: CGFloat {
        return Foundation.ceil(self)
    }

    /// Radian value of degree input.
    var degreesToRadians: CGFloat {
        return .pi * self / 180.0
    }

    /// Floor of CGFloat value.
    var floor: CGFloat {
        return Foundation.floor(self)
    }

    /// Check if CGFloat is positive.
    var isPositive: Bool {
        return self > 0
    }

    /// Check if CGFloat is negative.
    var isNegative: Bool {
        return self < 0
    }

    /// SwifterSwift: Int.
    var int: Int {
        return Int(self)
    }

    /// SwifterSwift: Float.
    var float: Float {
        return Float(self)
    }

    /// SwifterSwift: Double.
    var double: Double {
        return Double(self)
    }

    /// SwifterSwift: Degree value of radian input.
    var radiansToDegrees: CGFloat {
        return self * 180 / CGFloat.pi
    }
}

