//
//  RecordView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import SwiftUI

struct RecordView: View {
    
    @Bindable var viewModel: OrderViewModel = .init()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("기록")
                .font(.pretendard(24, weight: .semibold))
                .foregroundStyle(.black)
            
            topSegmentView
            
            Group {
                switch viewModel.selectedSegment {
                case .analysis:
                    analysisView
                case .review:
                    reviewView
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .onAppear {
            viewModel.getAnalysis()
            viewModel.getMyReviews()
        }
    }
    
    private var topSegmentView: some View {
        HStack(spacing: 12) {
            ForEach(RecordSegment.allCases, id: \.rawValue) { segment in
                topSegment(segment: segment)
            }
        }
    }
    
    @ViewBuilder
    func topSegment(segment: RecordSegment) -> some View {
        Button(action: {
            viewModel.selectedSegment = segment
        }) {
            VStack(spacing: 13) {
                Text(segment.segmentTitle)
                    .font(segment.segmentFont)
                    .foregroundStyle(viewModel.selectedSegment == segment ? Color.Base.realWhite.color : Color.Base.primary.color)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 6)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(viewModel.selectedSegment == segment ? Color.Base.primary.color : Color.Base.realWhite.color)
                            .stroke(Color.Base.primary.color, lineWidth: 1)
                            .recordBtnShadow()
                    )
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var analysisView: some View {
        Group {
            if (viewModel.analysis.isEmpty) {
                VStack(alignment: .center) {
                    Text("분석 기록이 없습니다.")
                        .font(.pretendard(14, weight: .regular))
                        .foregroundStyle(Color.Base.gray.color)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView(.vertical, content: {
                    LazyVStack(spacing: 24, content: {
                        ForEach(viewModel.analysis, id: \.id) { list in
                            RecordListItem(model: list)
                        }
                    })
                })
                .scrollIndicators(.hidden)
            }
        }
    }
    
    private var reviewView: some View {
        Group {
            if (viewModel.reviews.isEmpty) {
                VStack(alignment: .center) {
                    Text("내가 기록한 리뷰가 없습니다.")
                        .font(.pretendard(14, weight: .regular))
                        .foregroundStyle(Color.Base.gray.color)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView(.vertical, content: {
                    LazyVStack(spacing: 24, content: {
                        ForEach(viewModel.reviews, id: \.id) { list in
                            RecordListItem(model: list)
                        }
                    })
                })
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    RecordView()
}
