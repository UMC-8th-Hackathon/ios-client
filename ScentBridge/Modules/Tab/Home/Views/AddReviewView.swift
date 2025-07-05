//
//  AddReviewView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import SwiftUI

struct AddReviewView: View {
    @State var description: String = ""
    
    var body: some View {
        VStack(spacing: 24) {
            topView
            
            TextEditor(text: $description)
                .font(.pretendard(14, weight: .regular))
                .foregroundStyle(Color.Base.textOnWhite.color)
                .padding(.horizontal, 24)
                .padding(.vertical, 24)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1)
                        .foregroundStyle( Color.Base.gray.color)
                }
                .frame(maxHeight: .infinity)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
    }
    
    private var topView: some View {
        HStack {
            Image("x")
                .frame(width: 20, height: 20)
            
            Spacer()
            
            Text("댓글 작성")
                .font(.pretendard(20, weight: .medium))
                .foregroundStyle(Color.Base.textOnWhite.color)
            
            Spacer()
            
            Text("완료")
                .font(.pretendard(16, weight: .semibold))
                .foregroundStyle(Color.Base.textOnWhite.color)
        }
    }
}

#Preview {
    AddReviewView()
}
