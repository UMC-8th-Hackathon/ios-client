//
//  RecordViewModel.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import SwiftUI

@Observable
class OrderViewModel {
    var selectedSegment: RecordSegment = .analysis
    
    var reviews: [MyRecordResponse] = [
        MyRecordResponse(id: 0, perfumeId: 1, description: "Claude Monet - Water LiliesClaude Monet - Water LiliesClaude Monet - Water Lilies", createdAt: "1242", updatedAt: "1242"),
        ]
}
