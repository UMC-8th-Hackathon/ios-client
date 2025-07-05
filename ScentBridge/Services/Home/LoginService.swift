//
//  LoginService.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import Foundation

public class LoginService: SBNetworkService {
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
                completion(value, error)
            }
        } catch {
            print("직렬화 실패")
        }
    }
    
}
