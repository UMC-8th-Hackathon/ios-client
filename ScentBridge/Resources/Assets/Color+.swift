//
//  Color+.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import SwiftUI

public extension Color {
    enum Symbol: String {
        case primary = "primary"
        
        var color: Color { Color(self.rawValue) }
    }
}
