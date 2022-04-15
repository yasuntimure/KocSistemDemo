//
//  SearchService.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import Foundation

enum SearchService {
    case getSearch(parameters: APIRequestParameters)
}

extension SearchService: MTargetType {

    var path: String {
        switch self {
        case .getSearch(_):
            return "/search"
        }
    }

    var method: MoyaMethod {
        switch self {
        case .getSearch(_):
            return .get
        }
    }

    var task: MoyaTask {
        switch self {
        case .getSearch(let parameters):
            return .requestParameters(parameters: parameters, encoding: DefaultURLEncoding)
        }
    }

}

