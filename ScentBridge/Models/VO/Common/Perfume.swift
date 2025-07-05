//
//  Perfume.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

struct PerfumeDescription {
    let fileDescription: String
    let top: [String]
    let middle: [String]
    let base: [String]
    let interpretation: String
    let summary: String
    let title: String
}

struct Perfume {
    let id: Int
    let sourceType: PerfumeSourceType
    let description: PerfumeDescription
    let user: User
    let url: String
    let createdAt: String
    let updatedAt: String
}
