//
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import Foundation
import UIKit

struct Screen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
}

func adjustWidthRespectToDesignRate(_ size: CGFloat) -> CGFloat {
    let designRate = 375 / size
    let value = UIScreen.main.bounds.size.width / designRate
    return value
}

func adjustHeightRespectToDesignRate(_ size: CGFloat) -> CGFloat {
    let designRate = 667 / size
    let value = UIScreen.main.bounds.size.height / designRate
    return value
}

struct CharacterRange {
    static let userNameMinLength = 3
    static let userNameMaxLength = 50
    static let passwordMinLength = 3
    static let passwordMaxLenght = 20
    static let emailMaxLenght = 255
}

struct StaticKeys {
    static let recipeIdentifier =  Notification.Name(rawValue: "recipeIdentifier")
    static let dismissIdentifier =  Notification.Name(rawValue: "dismissIdentifier")
    static let reloadRecipeLedgerIdentifier =  Notification.Name(rawValue: "reloadRecipeLedgerIdentifier")
    static let loginIdentifier =  Notification.Name(rawValue: "loginIdentifier")
    static let userContractIdentifier =  Notification.Name(rawValue: "userContractIdentifier")
    static let keySocialName = "facebook"
}
