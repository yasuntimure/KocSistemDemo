//
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import Foundation

enum UserThemeSelection: Int {
    case system
    case light
    case dark

}

final class UserInfoManager {
    static private let THEME = "THEME"
    static private let USERTHEME = "USERTHEME"
    static let isFirstOpenProfile = "isFirstOpenProfile"
    static let systemModeActive = "systemModeActive"
    static let darkModeActive = "darkModeActive"
    static let firstOpening = "firstOpening"
    static let userAppleID = "user_AppleID"
    static let userAppleToken = "user_AppleToken"
    static let previousSearch = "previousSearch"

    static func setTheme(theme: Theme) {
        UserDefaults.standard.set(theme.rawValue, forKey: THEME)
    }

    static func getTheme() -> Theme {
        let themeRawValue = UserDefaults.standard.integer(forKey: THEME)
        return Theme(rawValue: themeRawValue) ?? .light
    }

    static func setUserTheme(theme: UserThemeSelection) {
        UserDefaults.standard.set(theme.rawValue, forKey: USERTHEME)
    }

    static func getUserTheme() -> UserThemeSelection {
        let themeRawValue = UserDefaults.standard.integer(forKey: USERTHEME)
        return UserThemeSelection(rawValue: themeRawValue) ?? .system
    }
}
