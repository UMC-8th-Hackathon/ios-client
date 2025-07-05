//
//  HomeView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(NavigationRouter.self) private var router
    
    let introduces: [IntroDto] = [
        IntroDto(nickname: "노드",
                 intro:  "오늘은 머스크향이 좋네요.",
                 imageUrl: "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/1.png?alt=media&token=b366bb38-bf36-428e-aee3-ed40c5059425",
                 scentName: "The Sense of Smell",
                 scentAuthor: "Jan Brueghel the Elder"),
        IntroDto(nickname: "노드",
                 intro:  "오늘은 머스크향이 좋네요.2",
                 imageUrl: "https://www.geconomy.co.kr/data/photos/20220313/art_16487029515832_1e4b89.jpg",
                 scentName: "The Sense of Smell",
                 scentAuthor: "Jan Brueghel the Elder"),
        IntroDto(nickname: "노드",
                 intro:  "오늘은 머스크향이 좋네요.3",
                 imageUrl: "https://newsteacher.chosun.com/site/data/img_dir/2021/05/10/2021051000068_1.jpg",
                 scentName: "The Sense of Smell",
                 scentAuthor: "Jan Brueghel the Elder")
    ]
    
    let artBasedScents: [ScentDto] = [
        ScentDto(id: 1,
                 title: "The Sense of Smell",
                 imageUrl: "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/2.png?alt=media&token=b9a9e770-8022-439c-8aea-a1a30d095435",
                 tags: ["xx", "xxx2"]),
        ScentDto(id: 2,
                 title: "The Sense of Smell",
                 imageUrl: "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/3.png?alt=media&token=83d649fe-a93e-440f-821a-6c4555587a18",
                 tags: ["xx3", "xxx2"]),
        ScentDto(id: 3,
                 title: "Wanderer above the Sea of Fog",
                 imageUrl: "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/4.png?alt=media&token=2d04c67a-9c10-4dda-9b4d-cacda8f49079",
                 tags: ["xx", "xxx2"]),
        ScentDto(id: 4,
                 title: "The Sense of Smell",
                 imageUrl: "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/5.png?alt=media&token=ac1492de-a5b8-4953-a3c4-8fbd73c7947c",
                 tags: ["xx3", "xxx2"]),
    ]
    
    let musicBasedScents: [ScentDto] = [
        ScentDto(id: 1,
                 title: "The Sense of Smell",
                 imageUrl: "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/6.png?alt=media&token=63f9356b-3514-4bbe-9a26-20cd40a13151",
                 tags: ["xx", "xxx2"]),
        ScentDto(id: 2,
                 title: "The Sense of Smell",
                 imageUrl: "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/7.png?alt=media&token=15215f5e-b744-443a-ac6c-f1818860f68c",
                 tags: ["xx3", "xxx2"]),
        ScentDto(id: 3,
                 title: "Wanderer above the Sea of Fog",
                 imageUrl: "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/3.png?alt=media&token=83d649fe-a93e-440f-821a-6c4555587a18",
                 tags: ["xx", "xxx2"]),
        ScentDto(id: 4,
                 title: "The Sense of Smell",
                 imageUrl: "https://firebasestorage.googleapis.com/v0/b/umc-hack.firebasestorage.app/o/4.png?alt=media&token=2d04c67a-9c10-4dda-9b4d-cacda8f49079",
                 tags: ["xx3", "xxx2"]),
    ]
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CarouselView(introduces.map { intro in
                    MainContentContainer(intro: intro)
                })
                ScentList("이미지 기반 향 추천",
                          scents: artBasedScents) { scentId in
                    router.push(.artDetail(artId: scentId))
                }
                ScentList("음악 기반 향 추천",
                          scents: musicBasedScents) { scentId in
                    router.push(.musicDetail(musicId: scentId))
                }
            }
        }
    }
    
    private func moveToArtBasedScent(_ scent: ScentDto) {
        router.push(.artDetail(artId: scent.id))
    }
    
    private func moveToMusicBasedScent(_ scent: ScentDto) {
        router.push(.musicDetail(musicId: scent.id))
    }
}

#Preview {
    HomeView()
        .environment(NavigationRouter())
}
