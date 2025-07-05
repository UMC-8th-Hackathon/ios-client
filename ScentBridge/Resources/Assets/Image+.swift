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
        case profile = "profile"
        case camera
        case gallery
        case lpimage = "lpimage"
        case perfumeIcon = "perfumeIcon"
        
        case maktub = "maktub"
        case drowning = "drowning"
        case alldayproject = "alldayproject"
        case qwer = "qwer"
        case dontknow = "dontknow"
        case whiplash = "whiplash"
        case tenCM = "tenCM"
        case neverendingstory = "neverendingstory"
        case dotheDance = "dotheDance"
        
        
        
        var image: Image { Image(self.rawValue) }
    }
}
