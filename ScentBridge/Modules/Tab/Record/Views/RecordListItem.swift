//
//  RecordListItem.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import SwiftUI
import Kingfisher

struct RecordListModel {
    let id: Int
    let imageURL: String
    let title: String
    let createdAt: String
    let type: String
}

struct RecordListItem: View {
    let imageURL: String
    let title: String
    let createdAt: String
    let type: String
    
    init(model: PerfumeResponse) {
        self.imageURL = model.url
        self.title = model.description.title
        self.createdAt = model.createdAt
        self.type = model.sourceType == .audio ? "오디오" : "이미지"
    }
    
    init(model: RecordListModel) {
        self.imageURL = model.imageURL
        self.title = model.title
        self.createdAt = model.createdAt
        self.type = model.type == "AUDIO" ? "오디오" : "이미지"
    }
    
    var body: some View {
        HStack(spacing: 16) {
            KFImage(URL(string: self.imageURL)!)
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
                Text(self.title)
                    .foregroundStyle(Color.Base.textOnWhite.color)
                    .font(.pretendard(16, weight: .semibold))
                    .lineLimit(1)
                
                Text("분석 일시 : \(formatDate(self.createdAt))")
                    .padding(.vertical, 2)
                    .foregroundStyle(Color.Base.gray.color)
                    .font(.pretendard(14, weight: .medium))
                    .lineLimit(1)
                
                Text("\(self.type) 기반")
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
    
    func formatDate(_ input: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let outputFormatter = DateFormatter()
        outputFormatter.locale = Locale(identifier: "ko_KR")
        outputFormatter.dateFormat = "yyyy년 M월 d일"

        if let date = inputFormatter.date(from: input) {
            return outputFormatter.string(from: date)
        } else {
            return input
        }
    }
}
