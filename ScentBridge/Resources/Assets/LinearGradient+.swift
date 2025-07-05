//
//  LinearGradient+.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import SwiftUI

public extension LinearGradient {
    enum ScentBridge {
        case primary
        
        var colors: [Color] {
            switch self {
            case .primary: [ Color.realWhite, Color.sub1, Color.sub3]
            }
        }
        
        var linearGradient: LinearGradient {
            switch self {
            case .primary: LinearGradient(colors: self.colors,
                                          startPoint: .topLeading,
                                          endPoint: .bottomTrailing)
            }
        }
    }
}
