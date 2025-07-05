//
//  PerfumeList.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import SwiftUI

struct PerfumeList: View {
    private let title: String
    private let perfumes: [Perfume]
    private let perfumeItemCompletion: (_ perfumeId: Int) -> Void
    
    init(_ title: String,
         perfumes: [Perfume],
         perfumeItemCompletion: @escaping (_ perfumeId: Int) -> Void) {
        self.title = title
        self.perfumes = perfumes
        self.perfumeItemCompletion = perfumeItemCompletion
        
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("\(title)")
                    .font(.pretendard(20, weight: .semibold))
                Spacer()
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 12){
                    ForEach(perfumes, id: \.self) { perfume in
                        PerfumeListItem(perfume: perfume, completion: perfumeItemCompletion)
                    }
                }
                .padding(.horizontal, 20)
            }
            .scrollClipDisabled()
        }
    }
}
