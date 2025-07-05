//
//  HomeViewModel.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

import SwiftUI

@Observable
class HomeViewModel {
    let service: HomeService = HomeService()
    
    var artBasedPerfumes: [Perfume] = [
        Perfume(
               id: 3,
               sourceType: .image,
               description: PerfumeDescription(
                   fileDescription: "햇살 가득한 창가에 놓인 꽃다발 이미지",
                   top: ["라즈베리", "레몬"],
                   middle: ["피오니", "로즈"],
                   base: ["시더우드", "바닐라"],
                   interpretation: "로맨틱한 봄날의 산책을 떠오르게 하는 향기",
                   summary: "플로럴 프루티 향",
                   title: "Spring Window"
               ),
               user: User(id: 6, nickname: "springgirl"),
               url: "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/2.png?alt=media&token=b9a9e770-8022-439c-8aea-a1a30d095435",
               createdAt: "2025-07-01T15:00:00",
               updatedAt: "2025-07-01T15:00:00"
           ),
           Perfume(
               id: 3,
               sourceType: .image,
               description: PerfumeDescription(
                   fileDescription: "노을 진 해변과 잔잔한 파도 이미지",
                   top: ["살구", "프리지아"],
                   middle: ["자스민", "코코넛"],
                   base: ["머스크", "샌달우드"],
                   interpretation: "낭만적인 여름 저녁을 닮은 향기",
                   summary: "코지 플로럴 향",
                   title: "Sunset Coast"
               ),
               user: User(id: 7, nickname: "sunsetlover"),
               url: "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/3.png?alt=media&token=83d649fe-a93e-440f-821a-6c4555587a18",
               createdAt: "2025-07-01T16:00:00",
               updatedAt: "2025-07-01T16:00:00"
           ),
           Perfume(
               id: 3,
               sourceType: .image,
               description: PerfumeDescription(
                   fileDescription: "고요한 산책로와 가을 나무 이미지",
                   top: ["베르가못", "넛맥"],
                   middle: ["오리스", "라벤더"],
                   base: ["앰버", "파출리"],
                   interpretation: "깊은 생각과 여유를 주는 향기",
                   summary: "우디 아로마틱 향",
                   title: "Autumn Path"
               ),
               user: User(id: 8, nickname: "fallingleaf"),
               url: "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/4.png?alt=media&token=2d04c67a-9c10-4dda-9b4d-cacda8f49079",
               createdAt: "2025-07-01T17:00:00",
               updatedAt: "2025-07-01T17:00:00"
           ),
           Perfume(
               id: 3,
               sourceType: .image,
               description: PerfumeDescription(
                   fileDescription: "하얀 침구 위 햇살 이미지",
                   top: ["라벤더", "카모마일"],
                   middle: ["코튼", "화이트머스크"],
                   base: ["샌달우드", "바닐라"],
                   interpretation: "포근하고 안락한 공간의 향기",
                   summary: "소프트 머스크 플로럴",
                   title: "Cozy Morning"
               ),
               user: User(id: 9, nickname: "morningcat"),
               url: "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/2.png?alt=media&token=b9a9e770-8022-439c-8aea-a1a30d095435",
               createdAt: "2025-07-01T18:00:00",
               updatedAt: "2025-07-01T18:00:00"
           ),
           Perfume(
               id: 3,
               sourceType: .image,
               description: PerfumeDescription(
                   fileDescription: "비 오는 날 창밖 풍경 이미지",
                   top: ["그린노트", "베티버"],
                   middle: ["아이리스", "라일락"],
                   base: ["머스크", "앰버"],
                   interpretation: "잔잔하고 차분한 향기",
                   summary: "그린 플로럴 향",
                   title: "Rainy Mood"
               ),
               user: User(id: 10, nickname: "rainlover"),
               url: "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/4.png?alt=media&token=2d04c67a-9c10-4dda-9b4d-cacda8f49079",
               createdAt: "2025-07-01T19:00:00",
               updatedAt: "2025-07-01T19:00:00"
           )
    ]
    var audioBasedPerfumes: [Perfume] = [Perfume(
        id: 1,
        sourceType: .audio,
        description: PerfumeDescription(
            fileDescription: "경쾌한 멜로디로 시작하는 에너지 넘치는 팝 사운드",
            top: ["베르가못", "레몬"],
            middle: ["자스민", "로즈"],
            base: ["샌달우드", "머스크"],
            interpretation: "밝고 긍정적인 분위기를 연출하는 향기",
            summary: "시트러스 플로럴 향",
            title: "Sunshine Beat"
        ),
        user: User(id: 1, nickname: "beatlover"),
        url: "https://example.com/audio1.mp3",
        createdAt: "2025-07-01T10:00:00",
        updatedAt: "2025-07-01T10:00:00"
    ),
    Perfume(
        id: 2,
        sourceType: .audio,
        description: PerfumeDescription(
            fileDescription: "몽환적이고 감성적인 기타 연주",
            top: ["만다린", "라벤더"],
            middle: ["아이리스", "피오니"],
            base: ["앰버", "시더우드"],
            interpretation: "부드럽고 잔잔한 감성의 향기",
            summary: "플로럴 우디 향",
            title: "Dream Flow"
        ),
        user: User(id: 2, nickname: "dreamer"),
        url: "https://example.com/audio2.mp3",
        createdAt: "2025-07-01T11:00:00",
        updatedAt: "2025-07-01T11:00:00"
    ),
    Perfume(
        id: 3,
        sourceType: .audio,
        description: PerfumeDescription(
            fileDescription: "재즈풍의 리듬과 여유로운 분위기",
            top: ["베르가못"],
            middle: ["마그놀리아", "가드니아"],
            base: ["머스크", "파출리"],
            interpretation: "도시 속의 편안함과 세련됨을 담은 향기",
            summary: "모던 우디 플로럴",
            title: "Urban Jazz"
        ),
        user: User(id: 3, nickname: "cityvibe"),
        url: "https://example.com/audio3.mp3",
        createdAt: "2025-07-01T12:00:00",
        updatedAt: "2025-07-01T12:00:00"
    ),
    Perfume(
        id: 4,
        sourceType: .audio,
        description: PerfumeDescription(
            fileDescription: "잔잔한 파도 소리와 함께하는 힐링 음악",
            top: ["민트", "그린티"],
            middle: ["로터스", "마린"],
            base: ["앰버", "화이트우드"],
            interpretation: "상쾌하고 편안한 바다 향기",
            summary: "마린 프레시 향",
            title: "Ocean Whisper"
        ),
        user: User(id: 4, nickname: "healer"),
        url: "https://example.com/audio4.mp3",
        createdAt: "2025-07-01T13:00:00",
        updatedAt: "2025-07-01T13:00:00"
    ),
    Perfume(
        id: 5,
        sourceType: .audio,
        description: PerfumeDescription(
            fileDescription: "빈티지 감성의 슬로우 재즈 연주",
            top: ["오렌지", "시나몬"],
            middle: ["장미", "오키드"],
            base: ["바닐라", "머스크"],
            interpretation: "감성적인 저녁의 분위기를 담은 향기",
            summary: "따뜻한 오리엔탈 향",
            title: "Evening Mood"
        ),
        user: User(id: 5, nickname: "vintagefan"),
        url: "https://example.com/audio5.mp3",
        createdAt: "2025-07-01T14:00:00",
        updatedAt: "2025-07-01T14:00:00"
    )]
    
    
}
