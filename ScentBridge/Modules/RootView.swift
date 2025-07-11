//
//  RootView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI

struct RootView: View {
    @State private var router = NavigationRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            LoginView()
                .environment(router)
                .navigationDestination(for: Route.self) { route in
                    Group {
                        switch route {
                        case .login:
                            LoginView()
                        case .baseTab:
                            BaseTabView()
                        case let .perfumeDetail(perfumeId):
                            PerfumeDetailView(perfumeId)
                        case let .addReview(perfumeId):
                            AddReviewView(perfumeId)
                        }
                    }
                    .environment(router)
                }
        }
    }
}

#Preview {
    RootView()
}
