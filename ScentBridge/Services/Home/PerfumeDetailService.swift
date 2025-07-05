//
//  PerfumeDetailService.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

import Foundation

public class PerfumeDetailService: SBNetworkService {
    let baseUrl: URL = URLManager.url(key: .base)
    
    func fetchPerfume(perfumeId: Int, completion: @escaping (_ value: PerfumeResponse?, _ error: Error?) -> Void) {
        let url = baseUrl
        let urlRequest = ScentBridgeNetworkURLRequest(
            url: url,
            method: .get,
            path: "perfumes/\(perfumeId)")
        self.response(urlRequest,
                      type: PerfumeResponse.self) { value, error in
            completion(value, error)
        }
    }
}
