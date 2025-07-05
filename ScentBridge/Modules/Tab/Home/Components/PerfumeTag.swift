//
//  PerfumeTag.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import SwiftUI

struct PerfumeTag: View {
    private let tag: String
    
    init(_ tag: String) {
        self.tag = tag
    }
    
    var body: some View {
        VStack {
            Text("# \(tag)")
                .font(.pretendard(8, weight: .regular))
                .foregroundStyle(Color.Base.gray.color)
        }
        .padding(.horizontal, 10)
        .frame(height: 14)
        .cornerRadius(50)
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(Color.Base.gray.color, lineWidth: 0.5)
        )
    }
}
