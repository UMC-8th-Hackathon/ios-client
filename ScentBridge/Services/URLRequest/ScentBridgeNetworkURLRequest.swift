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
    
    init(accessToken: String? = nil,
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
    
    // 사진 첨부 multipart/form-data 요청용 init
    init(accessToken: String? = nil,
         urlRequest: URLRequest,
         method: SBHTTPMethod,
         path: String,
         imageData: Data,
         imageKey: String = "image",
         additionalFields: [String: String]? = nil,
         timeoutInterval: TimeInterval = 30) {

        self.accessToken = accessToken
        self.httpMethod = method
        self.path = path
        self.timeoutInterval = timeoutInterval
        self.query = additionalFields

        let boundary = "Boundary-\(UUID().uuidString)"
        var request = urlRequest
        request.setValue("multipart/form-data;", forHTTPHeaderField: "Content-Type")

        var body = Data()

        // 이미지 추가
        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"Image8.jpeg\"\r\n")
        body.append("Content-Type: image/jpeg\r\n\r\n")
        body.append(imageData)
        body.append("\r\n")
        body.append("--\(boundary)--\r\n")

        self.httpBody = body
        self.urlRequest = request
    }
}

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

