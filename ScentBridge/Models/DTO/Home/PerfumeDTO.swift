//
//  PerfumeDTO.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import Foundation

enum PerfumeSourceType: String, Codable {
    case audio = "AUDIO"
    case image = "IMAGE"
}

struct PerfumeDescriptionResponse: Codable {
    let fileDescription: String
    let top: [String]
    let middle: [String]
    let base: [String]
    
    let interpretation: String
    let summary: String
    let title: String
}

struct PerfumeResponse: Codable {
    let id: Int
    let sourceType: PerfumeSourceType
    let description: PerfumeDescriptionResponse
    let user: UserResponse
    let url: String
    let createdAt: String
    let updatedAt: String
}

