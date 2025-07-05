//
//  MainContentContainer.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import SwiftUI
import Kingfisher

struct MainContentContainer: MainCarouselItemView {
    let id: UUID = UUID()
    let intro: IntroDto
    
    init(intro: IntroDto) {
        self.intro = intro
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            KFImage(URL(string: intro.imageUrl)!)
                .resizable()
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 0) {
                    Group {
                        Text("\(intro.nickname)님")
                        Text("\(intro.intro)")
                    }
                    .font(.pretendard(24, weight: .semibold))
                    .foregroundStyle(Color.Base.white.color)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(intro.scentName)")
                        .font(.pretendard(14, weight: .medium))
                        .foregroundStyle(Color.Base.textOnWhite.color)
                    Text("\(intro.scentAuthor)")
                        .font(.pretendard(8, weight: .regular))
                        .foregroundStyle(Color.Base.gray.color)
                    HStack {
                        Spacer()
                    }
                }
                .padding(.vertical,14)
                .padding(.horizontal, 10)
                .background(Color.Base.white.color.opacity(0.7).blur(radius: 0.2))
                .cornerRadius(8)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
        }
        .aspectRatio(334/200, contentMode: .fit)
        .cornerRadius(8)
        .padding(.horizontal, 20)
        
    }
}
