//
//  LoginService.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import Foundation

public class LoginService: SBNetworkService {
    @SecItemWrapper(key: .token, defaultValue: nil)
    var token: String?
    
    @SecItemWrapper(key: .userId, defaultValue: nil)
    var userId: Int?

    let baseUrlRequest: URLRequest = URLManager.urlRequest(key: .base)
    let encoder = JSONEncoder()
    
    func login(loginRequest: LoginRequest, completion: @escaping (_ value: LoginResponse?, _ error: Error?) -> Void) {
        let urlRequest = baseUrlRequest
        do {
            let jsonData = try encoder.encode(loginRequest)
        
            let sbUrlRequest = ScentBridgeNetworkURLRequest(
                urlRequest: urlRequest,
                method: .post,
                path: "auth/login",
                httpBody: jsonData)
            self.response(sbUrlRequest,
                          type: LoginResponse.self) { value, error in
                self.token = value?.accessToken
                self.userId = value?.id
                completion(value, error)
            }
        } catch {
            print("직렬화 실패")
        }
    }
    
}
