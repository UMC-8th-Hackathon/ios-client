//
//  PerfumeDetailView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI

struct PerfumeDetailView: View {
    @State private var viewModel: PerfumeDetailViewModel = PerfumeDetailViewModel()
    
    let perfumeId: Int
    
    init(_ perfumeId: Int) {
        self.perfumeId = perfumeId
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("PerfumeDetailView")
            }
        }
    }
}

#Preview {
    PerfumeDetailView(1)
}
