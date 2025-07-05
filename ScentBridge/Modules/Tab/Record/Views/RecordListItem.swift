//
//  RecordListItem.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import SwiftUI
import Kingfisher

struct RecordListItem: View {
    let model: MyRecordResponse
    
    init(model: MyRecordResponse) {
        self.model = model
    }
    
    var body: some View {
        HStack(spacing: 16) {
            KFImage(URL(string:  "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/1.png?alt=media&token=b366bb38-bf36-428e-aee3-ed40c5059425")!)
                .placeholder({
                    ProgressView()
                        .controlSize(.mini)
                })
                .onFailure { error in
                    print("이미지 로드 실패: \(error)")
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            contentView
            
            Image("right_arrow")
                .frame(width: 32, height: 32)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 11)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.Base.realWhite.color)
                .stroke(Color.Base.gray.color, lineWidth: 0.5)
                .recordShadow()
        )
    }
    
    private var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(model.description)
                    .foregroundStyle(Color.Base.textOnWhite.color)
                    .font(.pretendard(16, weight: .semibold))
                    .lineLimit(1)
                
                Text(model.description)
                    .padding(.vertical, 2)
                    .foregroundStyle(Color.Base.gray.color)
                    .font(.pretendard(14, weight: .medium))
                    .lineLimit(1)
                
                Text("이미지 기반")
                    .foregroundStyle(Color.Base.gray.color)
                    .font(.pretendard(8, weight: .regular))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 2)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.Base.realWhite.color)
                            .stroke(Color.Base.gray.color, lineWidth: 0.5)
                    )
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    RecordListItem(model: MyRecordResponse(id: 0, perfumeId: 1, description: "Claude Monet - Water LiliesClaude Monet - Water LiliesClaude Monet - Water Lilies", createdAt: "1242", updatedAt: "1242"))
}
