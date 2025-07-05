//
//  AddReviewView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import SwiftUI

struct AddReviewView: View {
    @Environment(NavigationRouter.self) private var router
    @State private var viewModel: AddReviewViewModel = AddReviewViewModel()
    
    init(_ perfumeId: Int) {
        viewModel.perfumeId = perfumeId
    }
    
    var body: some View {
        VStack(spacing: 24) {
            topView
            TextEditor(text: $viewModel.description)
                .font(.pretendard(14, weight: .regular))
                .foregroundStyle(Color.Base.textOnWhite.color)
                .padding(.horizontal, 24)
                .padding(.vertical, 24)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1)
                        .foregroundStyle( Color.Base.gray.color)
                }
                .frame(maxHeight: .infinity)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .alert("리뷰 작성 성공", isPresented: $viewModel.isSuccess) {
            Button("확인", role: .cancel) { }
        } message: {
            Text("리뷰가 성공적으로 등록되었습니다.")
        }
        .navigationBarBackButtonHidden()
    }
    
    private var topView: some View {
        HStack {
            Button(action: {
                router.pop()
            }) {
                Image("x")
                    .frame(width: 20, height: 20)
            }
            
            Spacer()
            
            Text("댓글 작성")
                .font(.pretendard(20, weight: .medium))
                .foregroundStyle(Color.Base.textOnWhite.color)
            
            Spacer()
            
            Button(action: {
                viewModel.postReview()
                router.pop()
            }) {
                Text("완료")
                    .font(.pretendard(16, weight: .semibold))
                    .foregroundStyle(Color.Base.textOnWhite.color)
            }
        }
    }
}

#Preview {
    AddReviewView(1)
        .environment(NavigationRouter())
}
