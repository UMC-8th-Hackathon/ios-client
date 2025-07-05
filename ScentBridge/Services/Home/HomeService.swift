//
//  HomeService.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

import Foundation

public class HomeService: SBNetworkService {
    let baseUrl: URL = URLManager.url(key: .base)
    
    func fetchPerfume(perfumeId: Int) {
        let url = baseUrl
        let urlRequest = ScentBridgeNetworkURLRequest(
            url: url,
            method: .get,
            path: "perfumes/\(perfumeId)")
        self.response(urlRequest,
                      type: PerfumeResponse.self) { value, error in
            print(value)
        }
    }
    
}
