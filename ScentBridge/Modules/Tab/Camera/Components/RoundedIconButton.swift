//
//  RoundedIconButton.swift
//  ScentBridge
//
//  Created by 이예지 on 7/6/25.
//

import SwiftUI

struct RoundedIconButton: View {
    
    private let icon: Image
    private let title: String
    private let foregroundColor: Color
    private let backgroundColor: Color
    private let cornerRadius: CGFloat
    private let compeltion: () -> Void
    
    init(icon: Image,
         title: String,
         foregroundColor: Color,
         backgroundColor: Color,
         cornerRadius: CGFloat,
         completion: @escaping () -> Void
    ) {
        self.icon = icon
        self.title = title
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.compeltion = completion
    }
    
    var body: some View {
        Button {
            compeltion()
        } label: {
            VStack {
                icon
                    .frame(width: 48, height: 48)
                Text(title)
                    .font(.pretendard(20, weight: .medium))
                HStack{Spacer()}
            }
            .frame(width: 160, height: 110)
            .background(backgroundColor)
            .foregroundStyle(foregroundColor)
            .cornerRadius(cornerRadius)
        }
      
    }
}
