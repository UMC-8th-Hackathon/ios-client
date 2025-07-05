//
//  Color+.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import SwiftUI

public extension Color {
    enum Base: String {
        case realWhite = "real_white"
        case white
        case textOnWhite = "text_on_white"
        case gray
        case sub1
        case sub2
        case sub3
        case alert
        case ratingActive = "rating_active"
        
        var color: Color { Color(self.rawValue) }
    }
}
