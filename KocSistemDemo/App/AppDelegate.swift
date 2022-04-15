//
//  AppDelegate.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startAlamofireNetworkLogger()
        return true
    }

}

// MARK: Init
extension AppDelegate {

    func startAlamofireNetworkLogger() {
        AlamofireNetworkLogger.shared.startLogging()
        AlamofireNetworkLogger.shared.level = .debug
    }

    func changeRootViewController(viewController: UIViewController) {
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
    }

}

// MARK: Flow
extension AppDelegate {

//    func startSplashFlow() {
//        let splashVC = SplashViewController.getInstanceFromNib()
//        changeRootViewController(viewController: splashVC)
//    }
//
//    func startLoginFlow() {
//        let loginViewController = LoginViewController(viewModel: LoginViewModelFactory().makeViewModel())
//        changeRootViewController(viewController: UINavigationController(rootViewController: loginViewController))
//    }
//
//    func startMainFlow() {
//        changeRootViewController(viewController: UINavigationController(rootViewController: HomeViewController()))
//    }
}
