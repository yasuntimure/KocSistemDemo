//
//  BaseReusableButton.swift
//  YemekCom
//
//  Created by Eyüp on 19.01.2022.
//

import UIKit

open class BaseReusableButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSelf()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeSelf()
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initializeSelf()
    }

    internal func initializeSelf() {
        preconditionFailure("initializeSelf - This method must be overridden")
    }
}
