//
//  BaseTabView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI

struct BaseTabView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Text("Home")
                }

            CameraView()
                .tabItem {
                    Text("Camera")
                }

            MusicView()
                .tabItem {
                    Text("Music")
                }

            ReviewView()
                .tabItem {
                    Text("Review")
                }
        }
        .onAppear {
            UITabBar.appearance().backgroundColor = .white
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

#Preview {
    BaseTabView()
}
