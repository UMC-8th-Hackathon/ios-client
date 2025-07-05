//
//  PerfumeTag.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import SwiftUI

struct PerfumeTag: View {
    private let tag: String
    private let font: Font
    private let height: CGFloat
    private let horizontalPadding: CGFloat
    
    
    init(_ tag: String,
         font: Font = .pretendard(8, weight: .regular),
         height: CGFloat = 14,
         horizontalPadding: CGFloat = 10) {
        self.tag = tag
        self.font = font
        self.height = height
        self.horizontalPadding = horizontalPadding
    }
    
    var body: some View {
        VStack {
            Text("# \(tag)")
                .font(font)
                .foregroundStyle(Color.Base.gray.color)
        }
        .padding(.horizontal, horizontalPadding)
        .frame(height: height)
        .cornerRadius(50)
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(Color.Base.gray.color, lineWidth: 0.5)
        )
    }
}
