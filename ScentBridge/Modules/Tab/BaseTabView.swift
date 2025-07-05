//
//  BaseTabView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI

struct BaseTabView: View {
    @Environment(NavigationRouter.self) private var router
    
    @State private var selectedTab: TabCase = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                if #available(iOS 18.0, *) {
                    TabView(selection: $selectedTab) {
                        ForEach(TabCase.allCases, id: \.self) { tab in
                            Tab(
                                value: tab,
                                content: {
                                    tabView(tab: tab)
                                },
                                label: {
                                    tabLabel(tab)
                                }
                            )
                        }
                    }
                } else {
                    TabView(selection: $selectedTab) {
                        ForEach(TabCase.allCases, id: \.self) { tab in
                            tabView(tab: tab)
                                .tabItem {
                                    tabLabel(tab)
                                }
                                .tag(tab)
                        }
                    }
                }
            }
            .padding(.horizontal, 45.5)
            
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.Base.gray.color, lineWidth: 0.5)
                .frame(maxHeight: 96)
        }
        .edgesIgnoringSafeArea(.bottom)
        .tint(Color.Base.textOnWhite.color)
        .onAppear {
            UITabBar.appearance().backgroundColor = .white
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    private func tabLabel(_ tab: TabCase) -> some View {
       VStack(spacing: 4, content: {
           Image(selectedTab == tab ? "\(tab.rawValue)_fill" : "\(tab.rawValue)")
           
           Text(tab.displayName)
               .font(.pretendard(14, weight: .regular))
               .foregroundStyle(Color.Base.textOnWhite.color)
       })
   }
    
    @ViewBuilder
    private func tabView(tab: TabCase) -> some View {
        Group {
            switch tab {
            case .home:
                HomeView()
            case .camera:
                CameraView()
            case .music:
                MusicView()
            case .record:
                RecordView()
            }
        }
    }
}

#Preview {
    BaseTabView()
        .environment(NavigationRouter())
}
