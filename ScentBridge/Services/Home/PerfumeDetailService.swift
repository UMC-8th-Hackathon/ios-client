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
}
