//
//  Color+.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import SwiftUI

public extension Color {
    enum Base: String {
        case realWhite = "sb_real_white"
        case white = "sb_white"
        case textOnWhite = "sb_text_on_white"
        case gray = "sb_gray"
        case sub1 = "sb_sub1"
        case sub2 = "sb_sub2"
        case sub3 = "sb_sub3"
        case alert = "sb_alert"
        case ratingActive = "sb_rating_active"
        
        var color: Color { Color(self.rawValue) }
    }
}
