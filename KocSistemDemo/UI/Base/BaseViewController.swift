//
//  BaseViewController.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit
import RxSwift
import RxRelay

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialComponents()
        self.registerEvents()
    }

    func initialComponents() { }

    func registerEvents() { }

    func presentHomeScreen() {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let tabbar = storyboard.instantiateViewController(withIdentifier: "tabbar")
        let navigationController = UINavigationController(rootViewController: tabbar)
        navigationController.modalPresentationStyle = .fullScreen
        self.presentViewController(navigationController)
    }

}

public class Subject {
    public static let shared = Subject()
    private init() { }
    public var removedItemTrackID = PublishRelay<Int>()
}

