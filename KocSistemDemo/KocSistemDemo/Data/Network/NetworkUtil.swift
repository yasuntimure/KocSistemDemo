//
//  NetworkUtil.swift
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import Foundation

enum APIEnvironment {
    case dev
    case production
}

struct NetworkUtil {
    private static let environment: APIEnvironment = .dev

    static var environmentBaseURL: String {
        switch NetworkUtil.environment {
        case .production: return NetworkConstants.shared.baseUrl
        case .dev: return NetworkConstants.shared.baseUrl
        }
    }

}


