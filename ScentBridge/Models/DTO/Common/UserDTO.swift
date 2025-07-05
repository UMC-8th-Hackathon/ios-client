//
//  UserDTO.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

struct UserResponse: Codable {
    let id: Int
    let nickname: String
    
    func toDomain() -> User {
        User(id: id,
             nickname: nickname)
    }
}
