//
//  LoginDTO.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import Foundation

protocol LoginDTO {
    var nickname: String { get set }
    var password: String { get set }
}

/// 로그인 요청 시 사용되는 구조체
struct LoginRequest: LoginDTO, Codable {
    var nickname: String
    var password: String
}


/// 로그인 응답받을 시 사용되는 구조체
struct LoginResponse: Codable {
    let id: Int
    let nickname: String
    let accessToken: String

    enum CodingKeys: String, CodingKey {
        case id
        case nickname
        case accessToken
    }
}
