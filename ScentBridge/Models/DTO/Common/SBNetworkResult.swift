//
//  SBNetworkResult.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import Foundation

struct SBNetworkResult<T: Codable>: Codable {
    let timestamp: Date
    let status: String
    let code: String
    let message: String
    let data: T?
}
