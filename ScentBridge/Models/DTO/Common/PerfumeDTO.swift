//
//  PerfumeDTO.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import Foundation


struct PerfumeDescriptionResponse: Codable {
    let id: Int
    let fileDescription: String
    let top: [String]
    let middle: [String]
    let base: [String]
    let interpretation: String
    let summary: String
    let title: String
    
    func toDomain() -> PerfumeDescription {
        PerfumeDescription(fileDescription: fileDescription,
                           top: top, middle: middle, base: base,
                           interpretation: interpretation,
                           summary: summary,
                           title: title)
    }
}

struct PerfumeResponse: Codable {
    let id: Int
    let sourceType: PerfumeSourceType
    let description: PerfumeDescriptionResponse
    let user: UserResponse
    let url: String
    let createdAt: String
    let updatedAt: String
    
    func toDomain() -> Perfume {
        Perfume(id: id,
                sourceType: sourceType,
                description: description.toDomain(),
                user: user.toDomain(),
                url: url,
                createdAt: createdAt,
                updatedAt: updatedAt)
    }
}
