//
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//
// swiftlint:disable all

import Foundation
import UIKit
import SwiftUI

enum Theme: Int {
    case light, dark

    var backgroundColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycBlack121216 ?? .black
        case .light:
            return UIColor.AppColor.ycWhite ?? .white
        }
    }

    var tabbarBarTintColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycBlack121216 ?? .black
        case .light:
            return UIColor.AppColor.ycWhite ?? .white
        }
    }

    var tabbarindicatorColor: UIColor {
        switch self {
        case .dark:
            return UIColor.red.darker() ?? .red
        case .light:
            return UIColor.red.lighter() ?? .red
        }
    }

    var tabbarUnselectedColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGray616165 ?? .gray
        case .light:
            return UIColor.AppColor.ycGrayBFBFBF ?? .gray
        }
    }

    var tabbarSelectedColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGrayBDBDC1 ?? .gray
        case .light:
            return UIColor.AppColor.ycDarkGray1 ?? .gray
        }
    }

    var primaryTextColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycWhite ?? .white
        case .light:
            return UIColor.AppColor.ycDarkGray404040 ?? .darkGray
        }
    }

    var secondaryTextColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGrayBDBDC1 ?? .darkGray
        case .light:
            return UIColor.AppColor.ycDarkGray1 ?? .darkGray
        }
    }

    var primaryButtonColor: UIColor {
        switch self {
        case .dark:
            return UIColor.systemBlue
        case .light:
            return UIColor.systemBlue
        }
    }

    var primaryButtonTitleColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycWhite ?? .white
        case .light:
            return UIColor.AppColor.ycWhite ?? .white
        }
    }

    var secondaryButtonColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycBlack121216 ?? .black
        case .light:
            return UIColor.AppColor.ycWhite ?? .white
        }
    }

    var secondaryButtonTitleColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycDarkPinkE51B5E ?? .systemPink
        case .light:
            return UIColor.AppColor.ycPink ?? .systemPink
        }
    }

    var secondaryButtonBorderColor: UIColor {
        switch self {
        case .light:
            return UIColor.AppColor.ycPink ?? .systemPink
        case .dark:
            return UIColor.AppColor.ycDarkPinkE51B5E ?? .systemPink
        }
    }

    var pageIndicatorTintColor: UIColor {
        switch self {
        case .light:
            return UIColor.AppColor.ycGrayB0B0B0 ?? .gray
        case .dark:
            return UIColor.AppColor.ycGray5E5F64 ?? .gray
        }
    }

    var currentPageIndicatorTintColor: UIColor {
        switch self {
        case .light:
            return UIColor.AppColor.ycPink ?? .systemPink
        case .dark:
            return UIColor.AppColor.ycDarkPinkE51B5E ?? .systemPink
        }
    }

    var subTextColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGrayBDBDC1 ?? .gray
        case .light:
            return UIColor.AppColor.ycDarkGray404040 ?? .gray
        }
    }

    var customButtonColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycBlack121216 ?? .gray
        case .light:
            return UIColor.AppColor.ycWhite ?? .gray
        }
    }

    var customButtonTitleColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGrayBDBDC1 ?? .gray
        case .light:
            return UIColor.AppColor.ycDarkGray1 ?? .gray
        }
    }

    var customButtonBorderColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGray333337 ?? .gray
        case .light:
            return UIColor.AppColor.ycGrayDEDEDE ?? .gray
        }
    }

    var lineViewColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGray333337 ?? .gray
        case .light:
            return UIColor.AppColor.ycGrayDEDEDE ?? .gray
        }
    }

    var floatinLabelTextFieldBorderColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGray333337 ?? .gray
        case .light:
            return UIColor.AppColor.ycGrayDEDEDE ?? .gray
        }
    }

    var floatinLabelTextFieldBackground: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycBlack1E1E22 ?? .black
        case .light:
            return UIColor.AppColor.ycWhite ?? .white
        }
    }

    var floatingLabelTextFieldTextColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycWhite ?? .white
        case .light:
            return UIColor.AppColor.ycDarkGray404040 ?? .gray
        }
    }

    var floatingLabelTextColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGray89898D ?? .gray
        case .light:
            return UIColor.AppColor.ycGray858585 ?? .gray
        }
    }

    var pagerTabViewTextDefaultColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGray89898D ?? .gray
        case .light:
            return UIColor.AppColor.ycGray858585 ?? .gray
        }
    }

    var pagertabViewTextHighlightColor: UIColor {
        switch self {
        case .light:
            return UIColor.AppColor.ycPink ?? .systemPink
        case .dark:
            return UIColor.AppColor.ycDarkPinkE51B5E ?? .systemPink
        }
    }

    var authorCellBorderColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGray333337 ?? .gray
        case .light:
            return UIColor.AppColor.ycGrayDEDEDE ?? .gray
        }
    }

    var searchBarBackgroundColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycBlack1E1E22 ?? .gray
        case .light:
            return UIColor.AppColor.ycGrayF3F3F3 ?? .gray
        }
    }

    var searchBarTextColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGray89898D ?? .gray
        case .light:
            return UIColor.AppColor.ycGray858585 ?? .gray
        }
    }

    var unfollowButtonColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycBlack1E1E22 ?? .gray
        case .light:
            return UIColor.AppColor.ycWhite ?? .white
        }
    }

    var unfollowButtonBorderColor: UIColor {
        switch self {
        case .light:
            return UIColor.AppColor.ycGrayB0B0B0 ?? .gray
        case .dark:
            return UIColor.AppColor.ycGray5E5F64 ?? .gray
        }
    }

    var backButtonBackgroundColor: UIColor {
        switch self {
        case .light:
            return UIColor.white.withAlphaComponent(0.78)
        case .dark:
            return UIColor.black.withAlphaComponent(0.78)
        }
    }

    var recipeToolbarBackgroundColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycBlack1E1E22 ?? .black
        case .light:
            return UIColor.AppColor.ycGrayF3F3F3 ?? .lightGray
        }
    }

    var recipeDurationsBackgroundColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycBlack1E1E22 ?? .black
        case .light:
            return UIColor.AppColor.ycWhite ?? .white
        }
    }

    var recipeDurationsPinkTextColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycDarkPinkA71042 ?? .systemPink
        case .light:
            return UIColor.AppColor.ycDarkPink9E1845 ?? .systemPink
        }
    }

    var recipeDurationsGrayTextColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGray89898D ?? .gray
        case .light:
            return UIColor.AppColor.ycGray858585 ?? .gray
        }
    }

    var measurementsBackgroundColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycBlack1E1E22 ?? .black
        case .light:
            return UIColor.AppColor.ycGrayF3F3F3 ?? .lightGray
        }
    }

    var nutrientBackgroundViewBorderColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGray333337 ?? .black
        case .light:
            return UIColor.AppColor.ycGrayDEDEDE ?? .lightGray
        }
    }

    var trickViewBackgroundColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGray343438 ?? .darkGray
        case .light:
            return UIColor.AppColor.ycYellowFFFAF4 ?? .yellow
        }
    }

    var howToMakeViewStepTitleColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGray89898D ?? .darkGray
        case .light:
            return UIColor.AppColor.ycGray858585 ?? .lightGray
        }
    }

    var howToMakeViewInstructionLabelColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGrayBDBDC1 ?? .darkGray
        case .light:
            return UIColor.AppColor.ycDark535353 ?? .lightGray
        }
    }

    var instructionGroupNameViewBackgroundColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycBlack1E1E22 ?? .darkGray
        case .light:
            return UIColor.AppColor.ycGrayF3F3F3 ?? .lightGray
        }
    }

    var instructionGroupNameViewTitleLabelColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycWhite ?? .white
        case .light:
            return UIColor.AppColor.ycDarkGray404040 ?? .darkGray
        }
    }

    var eulaTextViewTextColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGrayBDBDC1 ?? .gray
        case .light:
            return UIColor.AppColor.ycDarkGray1 ?? .gray
        }
    }

    var startRecipeModuleTextViewColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGrayBDBDC1 ?? .lightGray
        case .light:
            return UIColor.AppColor.ycDarkGray404040 ?? .black
        }
    }

    var customFilterViewBackground: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycBlack1E1E22 ?? .black
        case .light:
            return UIColor.AppColor.ycWhite ?? .white
        }
    }

    var commentsViewInfoLabelTextColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGray89898D ?? .gray
        case .light:
            return UIColor.AppColor.ycGray858585 ?? .lightGray
        }
    }

    var profileInfoTextColor: UIColor {
        switch self {
        case .dark:
            return UIColor.AppColor.ycGrayBDBDC1 ?? .darkGray
        case .light:
            return UIColor.AppColor.ycDarkGray1 ?? .darkGray
        }
    }

    var emptyStateTitleColor: UIColor {
        switch self {
        case .light:
            return UIColor.AppColor.ycBlack02171A ?? .darkGray
        case .dark:
            return UIColor.AppColor.ycWhite ?? .white
        }
    }

}

// This will let you use a theme in the app.
class ThemeManager {

    private static func getStoredTheme() -> Int? {
        return UserInfoManager.getTheme().rawValue
    }

    // ThemeManager
    static func currentTheme() -> Theme {
        if let storedTheme = getStoredTheme() {
            return Theme(rawValue: storedTheme)!
        } else {
            return .light
        }
    }

    static func createImageName(_ name: String) -> String {
        switch currentTheme() {
        case .dark:
            return "\(name)Dark"
        case .light:
            return "\(name)Light"
        }
    }

    static func createIconName(_ name: String) -> String {
        switch currentTheme() {
        case .dark:
            return "\(name)Dark"
        case .light:
            return "\(name)Light"
        }
    }

    static func applyTheme(theme: Theme) {
        // You get your current (selected) theme and apply the main color to the tintColor property of your application’s window.
        UserInfoManager.setTheme(theme: theme)
        let sharedApplication = UIApplication.shared
        sharedApplication.delegate?.window??.tintColor = theme.backgroundColor
//        UINavigationBar.appearance().isTranslucent = false
//        UINavigationBar.appearance().barTintColor = theme.primaryColor
    }
}
