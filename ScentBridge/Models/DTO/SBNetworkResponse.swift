//
//  SBNetworkResponse.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import Foundation

struct SBNetworkResponse<T: Codable>: Codable {
    let timestamp: String
    let status: Int
    let code: String
    let message: String
    let data: T?
}
