//
//  ReviewListItem.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import SwiftUI

struct ReviewListItem: View {
    let model: RecordResponse
    
    init(model: RecordResponse) {
        self.model = model
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            nameView
            
            Text(model.description)
                .font(.pretendard(14, weight: .medium))
                .padding(.horizontal, 10)
            
            Divider()
                .frame(height: 0.5)
        }
    }
    
    private var nameView: some View {
        HStack(spacing: 12) {
            Image("person_fill")
                .frame(width: 12, height: 12)
            
            Text("유아이코트")
                .foregroundStyle(Color.Base.textOnWhite.color)
                .font(.pretendard(14, weight: .regular))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(LinearGradient.ScentBridge.primary.linearGradient)
        )
    }
}

#Preview {
    ReviewListItem(model: RecordResponse(id: 0, description: "그림에 너무 잘 어울리는 향이예요", user: UserResponse(id: 3, nickname: "패딩"), createdAt: "1232424", updatedAt: "12424"))
}
