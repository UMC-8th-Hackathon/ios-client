//
//  SegmentAttr.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import Foundation
import SwiftUI

protocol SegmentAttr: CaseIterable, Hashable {
    /// 세그먼트에 표시할 텍스트 제목
    var segmentTitle: String { get }
    
    /// 세그먼트에 사용할 폰트 스타일
    var segmentFont: Font { get }
}
