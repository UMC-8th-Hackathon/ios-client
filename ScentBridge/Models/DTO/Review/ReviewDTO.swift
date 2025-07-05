//
//  ReviewDTO.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

protocol ReviewDTO {
    var description: String { get set }
}

/// 리뷰 작성 요청 시 사용되는 구조체
struct ReviewRequest: ReviewDTO {
    var description: String
}


/// 리뷰 응답받을 시 사용되는 구조체
struct ReviewResponse: Codable {
    let id: Int
    let description: String
    let user: User
    let createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case description
        case user
        case createdAt
        case updatedAt
    }
}

/// 내가 작성한 리뷰 응답받을 시 사용되는 구조체
struct MyReviewResponse: Codable {
    let id: Int
    let perfume: Perfume
    let description: String
    let createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case perfume
        case description
        case createdAt
        case updatedAt
    }
}


struct User: Codable {
    let id: Int
    let nickname: String

    enum CodingKeys: String, CodingKey {
        case id
        case nickname
    }
}

struct Perfume: Codable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
