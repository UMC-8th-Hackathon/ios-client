//
//  PerfumeDetailView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI
import Kingfisher

struct PerfumeDetailView: View {
    @Environment(NavigationRouter.self) private var router
    @State private var viewModel: PerfumeDetailViewModel = PerfumeDetailViewModel()
    let perfumeId: Int
    
    init(_ perfumeId: Int) {
        self.perfumeId = perfumeId
        self.viewModel.fetchPerfume(perfumeId: perfumeId)
    }
    
    var body: some View {
        if let perfume = viewModel.perfume {
            ScrollView {
                VStack {
                    Group {
                        if perfume.sourceType == PerfumeSourceType.image,
                           let imageUrl = URL(string: perfume.url)  {
                            KFImage(imageUrl)
                                .resizable()
                        } else {
                            Image.Default.record.image
                                .resizable()
                        }
                    }
                    .frame(width: 248, height: 150)
                    Text(perfume.description.title)
                        .font(.pretendard(24,
                                          weight: .semibold))
                        .frame(height: 52)
                        .foregroundStyle(Color.Base.textOnWhite.color)
                    Text(perfume.description.interpretation)
                        .font(.pretendard(14,
                                          weight: .regular))
                        .foregroundStyle(Color.Base.textOnWhite.color)
                }
            }
        } else {
            ProgressView()
        }
    }
    
    
}

#Preview {
    PerfumeDetailView(1)
}
