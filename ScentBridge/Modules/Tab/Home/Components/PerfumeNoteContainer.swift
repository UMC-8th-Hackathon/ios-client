//
//  PerfumeNoteContainer.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import SwiftUI

struct PerfumeNoteContainer: View {
    private let title: String
    private let perfumeNote: [String]
    
    init(_ title: String, perfumeNote: [String]) {
        self.title = title
        self.perfumeNote = perfumeNote
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .center, spacing: 0) {
                Text(title)
                    .font(.pretendard(16, weight: .semibold))
                HStack {Spacer()}
                    .frame(height: 0)
            }
            .padding(.vertical, 8)
            .background(LinearGradient.ScentBridge.primary.linearGradient)
            VStack(alignment: .leading, spacing: 12) {
                ForEach(perfumeNote.prefix(3), id: \.self) { tag in
                    PerfumeTag(tag,
                               font: .pretendard(14, weight: .regular),
                               height: 21,
                               horizontalPadding: 10)
                }
            }
            .padding(.horizontal, 8)
            Spacer()
        }
        .frame(height: 152)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 0.5)
        )
    }
}
