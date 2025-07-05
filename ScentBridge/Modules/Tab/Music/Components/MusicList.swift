//
//  MusicList.swift
//  ScentBridge
//
//  Created by 이예지 on 7/6/25.
//

import SwiftUI

struct MusicList: View {
    
    let topTenMusicResponse: TopTenMusicResponse
    
    var body: some View {
            HStack {
                Image(topTenMusicResponse.image)
                    .padding(10)
                musicInfo
                Spacer()
            }
            .frame(height: 80)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(Color.sbWhite)
            )
    }
    
    private var musicInfo: some View {
        VStack(alignment: .leading) {
            Text(topTenMusicResponse.title)
                .font(.pretendard(14, weight: .medium))
                .foregroundStyle(Color.sbTextOnWhite)
            HStack {
                Text(topTenMusicResponse.artist)
                    .font(.pretendard(14, weight: .medium))
                    .foregroundStyle(Color.sbGray)
                Text(topTenMusicResponse.min)
                    .font(.pretendard(14, weight: .medium))
                    .foregroundStyle(Color.sbGray)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MusicList(topTenMusicResponse: .init(title: "너에게 닿기를", artist: "10CM", min: "2:39", image: "tenCM"))
}
