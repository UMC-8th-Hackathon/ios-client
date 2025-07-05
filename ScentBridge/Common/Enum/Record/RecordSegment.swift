//
//  RecordSegment.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import Foundation
import SwiftUI

enum RecordSegment: String, SegmentAttr {
    
    case analysis = "분석"
    
    case review = "리뷰"
    
    var segmentTitle: String {
        return self.rawValue
    }
    
    var segmentFont: Font {
        return .pretendard(16, weight: .semibold)
    }
}
