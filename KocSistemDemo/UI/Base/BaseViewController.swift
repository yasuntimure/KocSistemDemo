//
//  BaseViewController.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

class BaseViewController: UIViewController {

    var updatedSearchResponse: SearchResponseModel = []

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

    func deleteItemFromAllResponses(index: Int) {
        DispatchQueue.main.async {
            var info = [String: Int]()
            info["index"] = index
            NotificationCenter.default.post(name: StaticKeys.deleteIdentifier1, object: nil, userInfo: info)
            NotificationCenter.default.post(name: StaticKeys.deleteIdentifier2, object: nil, userInfo: info)
            NotificationCenter.default.post(name: StaticKeys.deleteIdentifier3, object: nil, userInfo: info)
            NotificationCenter.default.post(name: StaticKeys.deleteIdentifier4, object: nil, userInfo: info)
        }

    }

//    func getUpdatedSearchResponse(searchResponse: SearchResponseModel) -> SearchResponseModel {
//        var updatedSearchResponse: SearchResponseModel = []
//        for item in searchResponse {
//            if !deletedIDs.contains(item.trackID ?? 0) {
//                updatedSearchResponse.append(item)
//            }
//        }
//        return updatedSearchResponse
//    }
}

