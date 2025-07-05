//
//  PointContainer.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import SwiftUI

struct PointContainer<Content: View>: View {
    @ViewBuilder private let content: () -> Content
    
    init(content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Circle()
                .fill(LinearGradient.ScentBridge.primary.linearGradient)
                .frame(width: 12, height: 12)
            VStack(alignment: .center, spacing: 0) {
                content()
                HStack {
                    Spacer()
                }
                .frame(height: 0)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 16)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 0.5)
        )
    }
}
