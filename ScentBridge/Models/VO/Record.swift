//
//  Record.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

struct Record: Hashable {
    let id: Int
    let description: String
    let user: User
    let createdAt: String
    let updatedAt: String
}
