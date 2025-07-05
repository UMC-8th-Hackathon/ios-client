//
//  HomeService.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

import Foundation

public class HomeService: SBNetworkService {
    @SecItemWrapper(key: .token, defaultValue: nil)
    var token: String?
    
    let baseUrlRequest: URLRequest = URLManager.urlRequest(key: .base)
    
    func fetchRecommendPerfumes(sourceType: PerfumeSourceType, completion: @escaping (_ value: [Perfume]?, _ error: Error?) -> Void) {
        let urlRequest = baseUrlRequest
        let sbUrlRequest = ScentBridgeNetworkURLRequest(
            accessToken: token,
            urlRequest: urlRequest,
            method: .get,
            path: "perfumes/recommend",
            query: ["sourceType": sourceType.rawValue])
        self.response(sbUrlRequest,
                      type: [PerfumeResponse].self) { value, error in
            completion(value?.map { $0.toDomain() }, error)
        }
    }
}
