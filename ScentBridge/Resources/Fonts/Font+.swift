//
//  Fonts.swift
//  MyStarbucks
//
//  Created by 주민영 on 3/19/25.
//

import Foundation
import SwiftUI

public extension Font {
    static func pretendard(_ size: CGFloat, weight: Weight = .regular) -> Font {
        .custom("Pretendard", size: size).weight(weight)
    }
}

