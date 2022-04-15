//
//  SplashViewController.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

class SplashViewController: BaseViewController {

    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.delay(1000) {
            self.presentHomeScreen()
        }
    }

}
