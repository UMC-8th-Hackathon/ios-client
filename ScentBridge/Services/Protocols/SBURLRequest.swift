//
//  BFURLRequestProtocol.swift
//  ScentBridge
//
//  Created by 이전희 on 2025/07/05.
//

import Foundation
import Alamofire

enum SBHTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol SBURLRequest: URLRequestConvertible {
    var accessToken: String? { get set }
    var urlRequest: URLRequest { get set }
    var httpMethod: SBHTTPMethod { get set }
    var path: String  { get set }
    var httpBody: Data?  { get set }
    var query: [String: String]?  { get set }
    var timeoutInterval: TimeInterval  { get set }
    
    init(accessToken: String?,
         urlRequest: URLRequest,
         method: SBHTTPMethod,
         path: String,
         httpBody: Data?,
         query: [String : String]?,
         timeoutInterval: TimeInterval)
}

extension SBURLRequest {
    var queryItem: [URLQueryItem]? {
        return query?.compactMap({ (key: String, value: String) in
            URLQueryItem(name: key, value: value)
        })
    }
    
    /// URLRequestConvertible protocol function
    /// Alamofire에서 제공되는 URLRequestConvertible을 상속 받아 AF의 static function request에서 사용
    /// - Returns: URL Request
    public func asURLRequest() throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.setValue("application/json",
                            forHTTPHeaderField: "Accept")
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json",
                                forHTTPHeaderField: "Content-Type")
        }
        if let accessToken = accessToken {
            urlRequest.setValue("Bearer \(accessToken)",
                                forHTTPHeaderField: "Authorization")
        }
        
        urlRequest.httpBody = httpBody
        urlRequest.timeoutInterval = timeoutInterval
        urlRequest.url?.append(path: path)
        urlRequest.url?.append(queryItems: queryItem ?? [])
        return urlRequest
    }
}
