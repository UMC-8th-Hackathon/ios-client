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
            case .primary: [Color.Base.realWhite.color,
                            Color.Base.sub1.color,
                            Color.Base.sub3.color]
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
