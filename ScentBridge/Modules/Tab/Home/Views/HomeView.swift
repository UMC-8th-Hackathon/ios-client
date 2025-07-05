//
//  HomeView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(NavigationRouter.self) private var router
    
    
    let introduces: [IntroResponse] = [
        IntroResponse(nickname: "노드",
                      intro:  "오늘은 머스크향이 좋네요.",
                      imageUrl: "https://www.artinsight.co.kr/data/tmp/2104/20210407060945_kxigfeqr.jpg",
                      scentName: "The Sense of Smell",
                      scentAuthor: "Jan Brueghel the Elder"),
        IntroResponse(nickname: "노드",
                      intro:  "오늘은 머스크향이 좋네요.2",
                      imageUrl: "https://www.geconomy.co.kr/data/photos/20220313/art_16487029515832_1e4b89.jpg",
                      scentName: "The Sense of Smell",
                      scentAuthor: "Jan Brueghel the Elder"),
        IntroResponse(nickname: "노드",
                      intro:  "오늘은 머스크향이 좋네요.3",
                      imageUrl: "https://newsteacher.chosun.com/site/data/img_dir/2021/05/10/2021051000068_1.jpg",
                      scentName: "The Sense of Smell",
                      scentAuthor: "Jan Brueghel the Elder")
    ]
    
    var body: some View {
        ScrollView {
            CarouselView(introduces.map { intro in
                MainContentContainer(intro: intro)
            })
        }
    }
}

#Preview {
    HomeView()
        .environment(NavigationRouter())
}
