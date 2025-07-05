//
//  ScentListItem.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

import SwiftUI
import Kingfisher

struct ScentListItem: View {
    private let scent: ScentDto
    private let completion: (_ scentId: Int) -> Void
    
    init(scent: ScentDto, completion: @escaping (_ scentId: Int) -> Void) {
        self.scent = scent
        self.completion = completion
    }
    
    var body: some View {
        Button {
            completion(scent.id)
        } label: {
            VStack(alignment: .leading, spacing: 6) {
                KFImage(URL(string: scent.imageUrl)!)
                    .resizable()
                    .frame(width: 127, height: 110)
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(scent.title)")
                        .font(.pretendard(8, weight: .medium))
                        .lineLimit(1)
                        .foregroundStyle(Color.Base.textOnWhite.color)
                    HStack(alignment: .center) {
                        ForEach(scent.tags.prefix(2), id: \.self) { tag in
                            ScentTag(tag)
                        }
                    }
                }
                .padding(.top, 12)
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
            }
            .frame(width: 127)
            .aspectRatio(127/160, contentMode: .fit)
            .background(Color.Base.white.color)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.12), radius: 8, x: 0, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 0.5)
            )
        }
        
    }
}
