//
//  MusicView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI

struct MusicView: View {
    var body: some View {
        topSection
        musicButton
        topTenMusicList
    }
    
    private var topSection: some View {
        ZStack {
            Color.sbWhite
                .ignoresSafeArea()
            VStack(spacing: 30) {
                HStack {
                    Text("음악")
                        .padding(.leading, 25)
                        .padding(.top, 15)
                        .font(.pretendard(28, weight: .semibold))
                        .foregroundStyle(.black)
                    Spacer()
                }
                Image(.lpimage)
                    .frame(width: 221, height: 221)
                    .padding(.bottom, 30)
            }
        }
    }
        
        
    
    private var musicButton: some View {
        HStack(spacing: 20) {
            RoundedMusicBtn(title: "녹음하기",
                            foregroundColor: .sbPrimary,
                            backgroundColor: .white,
                            borderColor: .sbPrimary,
                            cornerRadius: 50) {
            }
            RoundedMusicBtn(title: "업로드 하기",
                            foregroundColor: .sbPrimary,
                            backgroundColor: .white,
                            borderColor: .sbPrimary,
                            cornerRadius: 50) {
            }
        }
        .padding(.bottom, 30)
    }
    
    private var topTenMusicList: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(LinearGradient.ScentBridge.primary.linearGradient)
            VStack {
                HStack {
                    Text("TOP 10")
                        .font(.pretendard(20, weight: .medium))
                        .foregroundStyle(.black)
                    Spacer()
                }
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(Array(DummyMusicData.topTenMusic.enumerated()), id: \.offset) { index, music in
                                MusicList(topTenMusicResponse: music)
                        }
                    }
                    .padding(.bottom, 16)
                }
                .frame(maxHeight: 400)

            }
            .padding(.horizontal, 20)
            .padding(.top, 25)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 30)
    }
}

#Preview {
    MusicView()
}
