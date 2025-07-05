//
//  RecordService.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import Foundation

public class RecordService: SBNetworkService {
    @SecItemWrapper(key: .token, defaultValue: nil)
    var token: String?
    @SecItemWrapper(key: .userId, defaultValue: nil)
    var userId: Int?
    
    let baseUrlRequest: URLRequest = URLManager.urlRequest(key: .base)
    
    func getAnalysis(completion: @escaping (_ value: [PerfumeResponse]?, _ error: Error?) -> Void) {
        guard let userId = userId else { return }
        let urlRequest = baseUrlRequest
        let sbUrlRequest = ScentBridgeNetworkURLRequest(
            accessToken: token,
            urlRequest: urlRequest,
            method: .get,
            path: "perfumes/user/\(userId)")
        self.response(sbUrlRequest,
                      type: [PerfumeResponse].self) { value, error in
            completion(value, error)
        }
    }
    
    func getMyReviews(completion: @escaping (_ value: [MyRecordResponse]?, _ error: Error?) -> Void) {
        let urlRequest = baseUrlRequest
        let sbUrlRequest = ScentBridgeNetworkURLRequest(
            accessToken: token,
            urlRequest: urlRequest,
            method: .get,
            path: "reviews/me")
        self.response(sbUrlRequest,
                      type: [MyRecordResponse].self) { value, error in
            completion(value, error)
        }
    }
    
    func getPerfumeInfo(perfumeId: Int, completion: @escaping (_ value: PerfumeResponse?, _ error: Error?) -> Void) {
        let urlRequest = baseUrlRequest
        let sbUrlRequest = ScentBridgeNetworkURLRequest(
            accessToken: token,
            urlRequest: urlRequest,
            method: .get,
            path: "perfumes/\(perfumeId)")
        self.response(sbUrlRequest,
                      type: PerfumeResponse.self) { value, error in
            completion(value, error)
        }
    }
}
