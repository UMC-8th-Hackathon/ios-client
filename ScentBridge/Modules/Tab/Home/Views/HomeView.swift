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
                 imageUrl: "https://www.artinsight.co.kr/data/tmp/2104/20210407060945_kxigfeqr.jpg",
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
                 imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwXK3KFxlLMWgUcvYS-g5TkRGTkP2ZxPdI3g&s",
                 tags: ["xx", "xxx2"]),
        ScentDto(id: 2,
                 title: "The Sense of Smell",
                 imageUrl: "https://lh3.googleusercontent.com/proxy/UB1i16eRiUX4rJ1GQiCqzJ7eikEu6vwU2zMr4nsFUwImdkhB8_qPnXwMaTjKczrh29tpQeSQkCyz1STKTCYpKJhDy4eZwC4yKXxnL3AXhuxAyD4",
                 tags: ["xx3", "xxx2"]),
        ScentDto(id: 3,
                 title: "Wanderer above the Sea of Fog",
                 imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwXK3KFxlLMWgUcvYS-g5TkRGTkP2ZxPdI3g&s",
                 tags: ["xx", "xxx2"]),
        ScentDto(id: 4,
                 title: "The Sense of Smell",
                 imageUrl: "https://lh3.googleusercontent.com/proxy/UB1i16eRiUX4rJ1GQiCqzJ7eikEu6vwU2zMr4nsFUwImdkhB8_qPnXwMaTjKczrh29tpQeSQkCyz1STKTCYpKJhDy4eZwC4yKXxnL3AXhuxAyD4",
                 tags: ["xx3", "xxx2"]),
    ]
    
    let musicBasedScents: [ScentDto] = [
        ScentDto(id: 1,
                 title: "The Sense of Smell",
                 imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwXK3KFxlLMWgUcvYS-g5TkRGTkP2ZxPdI3g&s",
                 tags: ["xx", "xxx2"]),
        ScentDto(id: 2,
                 title: "The Sense of Smell",
                 imageUrl: "https://lh3.googleusercontent.com/proxy/UB1i16eRiUX4rJ1GQiCqzJ7eikEu6vwU2zMr4nsFUwImdkhB8_qPnXwMaTjKczrh29tpQeSQkCyz1STKTCYpKJhDy4eZwC4yKXxnL3AXhuxAyD4",
                 tags: ["xx3", "xxx2"]),
        ScentDto(id: 3,
                 title: "Wanderer above the Sea of Fog",
                 imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwXK3KFxlLMWgUcvYS-g5TkRGTkP2ZxPdI3g&s",
                 tags: ["xx", "xxx2"]),
        ScentDto(id: 4,
                 title: "The Sense of Smell",
                 imageUrl: "https://lh3.googleusercontent.com/proxy/UB1i16eRiUX4rJ1GQiCqzJ7eikEu6vwU2zMr4nsFUwImdkhB8_qPnXwMaTjKczrh29tpQeSQkCyz1STKTCYpKJhDy4eZwC4yKXxnL3AXhuxAyD4",
                 tags: ["xx3", "xxx2"]),
    ]
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CarouselView(introduces.map { intro in
                    MainContentContainer(intro: intro)
                })
                ScentList("이미지 기반 향 추천",
                          scents: artBasedScents) {
                    print("artBasedScents")
                } scentItemCompletion: { scentId in
                    router.push(.artDetail(artId: scentId))
                }
                ScentList("음악 기반 향 추천",
                          scents: musicBasedScents) {
                    print("musicBasedScents")
                } scentItemCompletion: { scentId in
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
