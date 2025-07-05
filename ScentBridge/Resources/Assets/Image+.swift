//
//  Image+.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import SwiftUI

public extension Image {
    enum Icon: String {
        case rightArrow = "right_arrow"
    
        var image: Image { Image(self.rawValue) }
    }
}
