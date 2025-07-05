//
//  HomeView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(NavigationRouter.self) private var router
    
    var body: some View {
        VStack {
            Text("Home")
            
            // Example
            Button("Art Detail") {
                router.push(.artDetail)
            }
            
            Button("Music Detail") {
                router.push(.musicDetail)
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(NavigationRouter())
}
