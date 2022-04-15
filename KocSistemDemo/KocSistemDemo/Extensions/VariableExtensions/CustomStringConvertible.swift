//
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import Foundation

extension CustomStringConvertible {

    var description: String {
        var desc = "Class Name: \(type(of: self))\n"
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            if let label = child.label {
                desc.append("\(label): \(child.value)\n")
            }
        }
        return desc
    }
}
