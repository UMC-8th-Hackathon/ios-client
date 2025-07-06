//
//  RoundedMusicBtn.swift
//  ScentBridge
//
//  Created by 이예지 on 7/6/25.
//

import SwiftUI

struct RoundedMusicBtn: View {
    
    private let title: String
    private let foregroundColor: Color
    private let backgroundColor: Color
    private let borderColor: Color
    private let cornerRadius: CGFloat
    private let compeltion: () -> Void
    
    init(title: String,
         foregroundColor: Color,
         backgroundColor: Color,
         borderColor: Color,
         cornerRadius: CGFloat,
         completion: @escaping () -> Void
    ) {
        self.title = title
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        self.compeltion = completion
    }
    
    var body: some View {
        Button {
            compeltion()
        } label: {
            Text(title)
                .font(.pretendard(16, weight: .semibold))
                .frame(width: 122, height: 40)
                .background(backgroundColor)
                .foregroundStyle(foregroundColor)
                .cornerRadius(cornerRadius)
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(backgroundColor)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: 1)
                )

                
        }
    }
}

