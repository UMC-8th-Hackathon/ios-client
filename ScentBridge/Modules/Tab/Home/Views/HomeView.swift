//
//  HomeView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(NavigationRouter.self) private var router
    @State private var viewModel: HomeViewModel = HomeViewModel()


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
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CarouselView(introduces.map { intro in
                    MainContentContainer(intro: intro)
                })
                PerfumeList("이미지 기반 향 추천",
                            perfumes: viewModel.artBasedPerfumes) { perfumeId in
                    movePerfumeDetail(perfumeId)
                }
                PerfumeList("음악 기반 향 추천",
                            perfumes: viewModel.audioBasedPerfumes) { perfumeId in
                    movePerfumeDetail(perfumeId)
                }
            }
        }
    }
    
    private func movePerfumeDetail(_ perfumeId: Int) {
        router.push(.perfumeDetail(perfumeId: perfumeId))
    }
    
}

#Preview {
    HomeView()
        .environment(NavigationRouter())
}
