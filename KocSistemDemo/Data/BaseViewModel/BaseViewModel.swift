//
//  BaseViewModel.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import Foundation

protocol IBaseViewModel { }

protocol BaseViewModelDelegate: Any {
    func showLoading()
    func hideLoading()
    func showErrorMessage(message: String)
}
