//
//  NetworkingError.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import Foundation

enum NetworkingError: CustomStringConvertible {
    case NO_CONNECTION_NETWORK
    case HTTP_EXCEPTION(statusCode: Int, message: String?)
    case UNDEFINED(message: String)
    case UNDEFINED_RESPONSE_TYPE
    case ERROR_MESSAGE(message: String)

    var description: String {
        switch self {
        case .NO_CONNECTION_NETWORK:
            return "Lütfen internet bağlantınızı kontrol ediniz!"
        case .HTTP_EXCEPTION(let statusCode, let message):
            switch statusCode {
            case 401:
                return "Authorization"
            case 406:
                return "406 hatası"
            case 500:
                return "Sunucu Hatası"
            default:
                return message ?? ""
            }
        case .UNDEFINED(let message):
            return message
        case .UNDEFINED_RESPONSE_TYPE:
            return "Tanımlanamayan server dönüşü"
        case .ERROR_MESSAGE(let message):
            return message
        }
    }
}

enum MyResult<T: Codable> {
    // case empty
    case success(T)
    case failure(errorType: NetworkingError)
}
