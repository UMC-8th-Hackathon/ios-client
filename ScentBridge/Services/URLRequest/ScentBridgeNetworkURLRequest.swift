//
//  ScentBridgeNetworkURLRequest.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

import Foundation

public struct ScentBridgeNetworkURLRequest: SBURLRequest {
    var accessToken: String?
    var urlRequest: URLRequest
    var httpMethod: SBHTTPMethod
    var path: String
    var httpBody: Data?
    var query: [String: String]?
    var timeoutInterval: TimeInterval
    
    init(accessToken: String?,
         urlRequest: URLRequest,
         method: SBHTTPMethod,
         path: String,
         httpBody: Data? = nil,
         query: [String : String]? = nil,
         timeoutInterval: TimeInterval = 30) {
        self.accessToken = accessToken
        self.urlRequest = urlRequest
        self.httpMethod = method
        self.path = path
        self.httpBody = httpBody
        self.query = query
        self.timeoutInterval = timeoutInterval
    }
}
