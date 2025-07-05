//
//  RecordDTO.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

protocol RecordDTO {
    var description: String { get set }
}

/// 리뷰 작성 요청 시 사용되는 구조체
struct RecordRequest: RecordDTO {
    var description: String
}

/// 리뷰 응답받을 시 사용되는 구조체
struct RecordResponse: Codable {
    let id: Int
    let description: String
    let user: UserResponse
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
struct MyRecordResponse: Codable {
    let id: Int
    let perfumeId: Int
    let description: String
    let createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case perfumeId
        case description
        case createdAt
        case updatedAt
    }
}
