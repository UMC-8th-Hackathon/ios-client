//
//  TabCase.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import Foundation

enum TabCase: String, CaseIterable {
    case home = "Home"
    case camera = "Camera"
    case music = "Music"
    case review = "Review"
    
    var displayName: String {
        switch self {
        case .home:
            return "홈"
        case .camera:
            return "카메라"
        case .music:
            return "음악"
        case .review:
            return "리뷰"
        }
    }
}
