//
//  TabbarViewController.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

class TabbarViewController: UITabBarController {
    /*
        color of the indicator
     */
    var indicatorColor: UIColor = ThemeManager.currentTheme().tabbarindicatorColor
    var selectedColor: UIColor = ThemeManager.currentTheme().tabbarSelectedColor
    var unselectedColor: UIColor = ThemeManager.currentTheme().tabbarUnselectedColor

    /*
        determine if the indicator
        will be drawn on top of bar items or not
     */
    var onTopIndicator: Bool = true

    override func viewWillAppear(_ animated: Bool) {
        setTabbarUIWithCurentTheme()
    }

    public func setTabbarUIWithCurentTheme() {
        self.tabBar.layer.borderWidth = 0.5
        self.tabBar.clipsToBounds = false
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.barTintColor = ThemeManager.currentTheme().backgroundColor
        tabBarItem.setTitleTextAttributes([.foregroundColor : ThemeManager.currentTheme().tabbarUnselectedColor], for: .normal)
        tabBarItem.setTitleTextAttributes([.foregroundColor :  ThemeManager.currentTheme().tabbarSelectedColor], for: .selected)
        tabBar.tintColor = ThemeManager.currentTheme().tabbarindicatorColor
        tabBar.unselectedItemTintColor = ThemeManager.currentTheme().tabbarUnselectedColor
        tabBar.layer.borderColor = ThemeManager.currentTheme().backgroundColor.cgColor
        tabBar.backgroundColor = ThemeManager.currentTheme().tabbarBarTintColor
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        // Draw Indicator above the tab bar items
        guard let numberOfTabs = tabBar.items?.count else {
            return
        }

        let numberOfTabsFloat = CGFloat(numberOfTabs)
        let imageSize = CGSize(width: tabBar.frame.width / numberOfTabsFloat,
                               height: tabBar.frame.height)

        let indicatorImage = UIImage.drawTabBarIndicator(color: ThemeManager.currentTheme().tabbarindicatorColor,
                                                         size: imageSize,
                                                         onTop: onTopIndicator)
        self.tabBar.selectionIndicatorImage = indicatorImage
    }

}
extension UIImage {
    // Draws the top indicator by making image with filling color
    class func drawTabBarIndicator(color: UIColor, size: CGSize, onTop: Bool) -> UIImage? {
        let indicatorHeight = size.height / 30
        let yPosition = onTop ? 0 : (size.height - indicatorHeight)

        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: yPosition, width: size.width, height: indicatorHeight))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}
