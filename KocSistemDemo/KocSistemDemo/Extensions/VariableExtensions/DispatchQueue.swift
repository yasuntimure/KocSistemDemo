//
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import Foundation

extension DispatchQueue {

    static func delay(_ milliseconds: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(milliseconds), execute: closure)
    }
} 
