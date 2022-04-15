//
//  BaseRepository.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import Foundation
import Moya

protocol IBaseRepository { }

class BaseRepository<Target: TargetType>: IBaseRepository {

    private var provider: MoyaProvider<Target>

    init(provider: MoyaProvider<Target>) {
        self.provider = provider
    }

    func mRequest<T: Codable>(_ target: Target, callback: @escaping (MyResult<BaseResponseModel<T>>) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                if statusCode >= 200 && statusCode < 300 {
                    do {
                        let response = try JSONDecoder().decode(BaseResponseModel<T>.self, from: response.data)
                        if response.results != nil {
                            callback(MyResult.success(response))
                        } else {
                            callback(MyResult.failure(errorType: .ERROR_MESSAGE(message: "Unexpected error has been occured!")))
                        }
                    } catch {
                        callback(MyResult.failure(errorType: .UNDEFINED_RESPONSE_TYPE))
                    }
                } else {
                    callback(MyResult.failure(errorType: .HTTP_EXCEPTION(statusCode: statusCode, message: "Unexpected error has been occured!")))
                }
            case .failure(let error):
                switch error {
                case .underlying(let underlyingError, _):
                    switch underlyingError.asAFError {
                    case .sessionTaskFailed(let sessionTaskFailedError):
                        if (sessionTaskFailedError as NSError).code == -1009 {
                            callback(MyResult.failure(errorType: .NO_CONNECTION_NETWORK))
                        }
                        if (sessionTaskFailedError as NSError).code == -1001 {
                            callback(MyResult.failure(errorType: .ERROR_MESSAGE(message: "The request has been time out, please try again.")))
                        }
                        if (sessionTaskFailedError as NSError).code == -1200{
                            callback(MyResult.failure(errorType: .ERROR_MESSAGE(message: "The request has been time out, please try again.")))
                        }
                    default:
                        callback(MyResult.failure(errorType: .UNDEFINED(message: "Unexpected error has been occured!")))
                    }
                default:
                    callback(MyResult.failure(errorType: .UNDEFINED(message: "Unexpected error has been occured!")))
                }
            }
        }
    }
}
