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
    
    init(_accessToken: String?,
         _urlRequest: URLRequest,
         _method: SBHTTPMethod,
         _path: String,
         _httpBody: Data?,
         _query: [String : String]?,
         _timeoutInterval: TimeInterval)
}

extension SBURLRequest {
    init(_ accessToken: String? = nil,
         url: URL,
         method: SBHTTPMethod = .get,
         path: String,
         httpBodyDict: [String: Any],
         query: [String : String]? = nil,
         timeoutInterval: TimeInterval = 10) {
        let httpBodyData = try? JSONSerialization.data(withJSONObject: httpBodyDict,
                                                       options: .prettyPrinted)
        self.init(_accessToken: accessToken,
                  _urlRequest: URLRequest(url: url),
                  _method: method,
                  _path: path,
                  _httpBody: httpBodyData,
                  _query: query,
                  _timeoutInterval: timeoutInterval)
    }
    
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
        urlRequest.setValue("application/json",
                            forHTTPHeaderField: "Content-Type")
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
