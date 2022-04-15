//
//  BaseResponseModel.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import Foundation

public class BaseResponseModel<T: Codable>: Codable {
    var results: T?

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }

    public required init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        results = try? keyedContainer.decode(T.self, forKey: CodingKeys.results)
    }
}
 
