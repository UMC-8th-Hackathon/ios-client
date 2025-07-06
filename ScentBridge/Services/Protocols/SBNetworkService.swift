//
//  SBNetworkService.swift
//  ScentBridge
//
//  Created by 이전희 on 2025/07/05.
//

import Foundation
import Alamofire

protocol SBNetworkService {
    /// Network Response - Generic Type
    /// - Parameters:
    ///   - briefingURLRequest: 제공하는 API URL Request
    ///   - type: 변환할 데이터 타입
    ///   - completion: 데이터를 받은 뒤 수행 될 Closure
    func response<D: Codable>(_ briefingURLRequest: any SBURLRequest,
                              type: D.Type,
                              completion: @escaping (_ value: D?, _ error: Error?) -> Void)
    
    /// Network Response - Data
    /// - Parameters:
    ///   - briefingURLRequest: 제공하는 API URL Request
    ///   - completion: 데이터를 받은 뒤 수행 될 Closure
    func response(_ sbURLRequest: any SBURLRequest,
                  completion: @escaping (_ value: Data?, _ error: Error?) -> Void)
}

extension SBNetworkService {
    func response<D: Codable>(_ sbURLRequest: any SBURLRequest,
                              type: D.Type,
                              completion: @escaping (_ value: D?, _ error: Error?) -> Void) {
        AF.request(sbURLRequest)
            .responseDecodable(of: SBNetworkResponse<D>.self) { response in
                do {
                    if let statusCode =  response.response?.statusCode {
                        switch statusCode {
                        case (200..<400): break
                        case (400): throw SBNetworkError.badRequestError
                        case (404): throw SBNetworkError.notFoundError
                        case (403): throw SBNetworkError.forbiddenError
                        case (500): throw SBNetworkError.internalServerError
                        default: break
                        }
                    }
                    guard let networkResult = response.value else {
                        completion(nil, response.error)
                        return
                    }
                    
                    print(response.value)
                    guard networkResult.code.uppercased() == "SUCCESS" else {
                        completion(nil, SBNetworkError.requestFail(code: networkResult.code,
                                                                   message: networkResult.message))
                        return
                    }
                    completion(networkResult.data, response.error)
                } catch {
                    completion(nil, error)
                }
            }
    }
    
    func response(_ sbUrlRequest: any SBURLRequest,
                  completion: @escaping (_ value: Data?, _ error: Error?) -> Void) {
        AF.request(sbUrlRequest)
            .responseData { response in
                completion(response.value, response.error)
            }
    }
}
