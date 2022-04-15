//
//  SearchRequestParameters.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import Foundation

struct SearchRequestParameters {

    let term: String

    func generateAPIRequestParameters() -> APIRequestParameters {
        var parameters = APIRequestParameters()
        parameters["term"] = term
        return parameters
    }
}
