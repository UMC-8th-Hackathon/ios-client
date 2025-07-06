//
//  MusicView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI

struct MusicView: View {
    
    @State private var isRecording: Bool = false
    @State private var recordingTime: TimeInterval = 0
    @State private var timer: Timer?
    
    var body: some View {
        topSection
        recordingTimeSection
        musicButton
        topTenMusicList
    }
    
    private var topSection: some View {
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
    
    @ViewBuilder
    private var recordingTimeSection: some View {
        Text(formatTimeMMSS(recordingTime))
            .font(.pretendard(24, weight: .semibold))
            .foregroundStyle(Color.black)
    }
    
    private var musicButton: some View {
        HStack(spacing: 20) {
            RoundedMusicBtn(
                title: "녹음하기",
                foregroundColor: isRecording ? .white : .sbPrimary,
                backgroundColor: isRecording ? .sbPrimary : .white,
                borderColor: .sbPrimary,
                cornerRadius: 50
            ) {
                toggleRecording()
            }
            
            RoundedMusicBtn(
                title: "업로드 하기",
                foregroundColor: .sbPrimary,
                backgroundColor: .white,
                borderColor: .sbPrimary,
                cornerRadius: 50
            ) {
                // 업로드 기능
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
                ScrollView(showsIndicators: false) {
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
        .padding(.bottom, 90)
    }
}

extension MusicView {
    
    private func toggleRecording() {
        withAnimation(.easeInOut(duration: 0.3)) {
            if isRecording {
                stopRecording()
            } else {
                startRecording()
            }
        }
    }
    
    private func startRecording() {
        isRecording = true
        recordingTime = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            recordingTime += 1.0
        }
        print("녹음 시작")
    }
    
    private func stopRecording() {
        isRecording = false
        timer?.invalidate()
        timer = nil
        
        print("녹음 중지 - 총 시간: \(formatTimeMMSS(recordingTime))")
    }
    
    private func formatTimeMMSS(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    MusicView()
}
