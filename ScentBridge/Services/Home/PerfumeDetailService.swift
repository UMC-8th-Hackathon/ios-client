//
//  PerfumeDetailService.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

import Foundation

public class PerfumeDetailService: SBNetworkService {
    @SecItemWrapper(key: .token, defaultValue: nil)
    var token: String?
    
    let baseUrlRequest: URLRequest = URLManager.urlRequest(key: .base)
    let encoder = JSONEncoder()
    
    func fetchPerfume(perfumeId: Int, completion: @escaping (_ value: Perfume?, _ error: Error?) -> Void) {
        let urlRequest = baseUrlRequest
        let sbUrlRequest = ScentBridgeNetworkURLRequest(
            accessToken: token,
            urlRequest: urlRequest,
            method: .get,
            path: "perfumes/\(perfumeId)")
        self.response(sbUrlRequest,
                      type: PerfumeResponse.self) { value, error in
            completion(value?.toDomain(), error)
        }
    }
    
    func fetchShops(latitude: Double, longitude: Double, completion: @escaping (_ value: [Shop]?, _ error: Error?) -> Void) {
        let urlRequest = baseUrlRequest
        let sbUrlRequest = ScentBridgeNetworkURLRequest(
            accessToken: token,
            urlRequest: urlRequest,
            method: .get,
            path: "shops/nearby",
            query: ["lat": "\(latitude)",
                    "lng": "\(longitude)"])
        self.response(sbUrlRequest,
                      type: [ShopResponse].self) { value, error in
            completion(value?.map{ $0.toDomain() }, error)
        }
    }
    
    func fetchRecords(perfumeId: Int, completion: @escaping (_ value: [Record]?, _ error: Error?) -> Void) {
        let urlRequest = baseUrlRequest
        let sbUrlRequest = ScentBridgeNetworkURLRequest(
            accessToken: token,
            urlRequest: urlRequest,
            method: .get,
            path: "reviews/\(perfumeId)")
        self.response(sbUrlRequest,
                      type: [RecordResponse].self) { value, error in
            completion(value?.map{ $0.toDomain() }, error)
        }
    }
    
    func postReview(perfumeId: Int, description: String, completion: @escaping (_ value: RecordResponse?, _ error: Error?) -> Void) {
        let request = RecordRequest(description: description)
        let urlRequest = baseUrlRequest
        
        do {
            let jsonData = try encoder.encode(request)
            let sbUrlRequest = ScentBridgeNetworkURLRequest(
                accessToken: token,
                urlRequest: urlRequest,
                method: .post,
                path: "reviews/\(perfumeId)",
                httpBody: jsonData,
                query: ["perfumeId": "\(perfumeId)"])
            self.response(sbUrlRequest,
                          type: RecordResponse.self) { value, error in
                completion(value, error)
            }
        } catch {
            print("직렬화 실패")
        }
    }
}
