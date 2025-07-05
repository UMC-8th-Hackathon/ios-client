//
//  CameraView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI
import PhotosUI

struct CameraView: View {
    @Environment(NavigationRouter.self) private var router
    
    @Bindable var viewModel: CameraViewModel = .init()

    @State private var showCamera = false
    @State private var showGallery = false
    @State private var selectedItems: [PhotosPickerItem] = []
    
    @State private var showPhotosPicker = false

    var body: some View {
        ZStack {
            Color.sbWhite
                .ignoresSafeArea()
            VStack {
                captionBoard
                Spacer()
                bottomBoard
            }
            .sheet(isPresented: $showCamera) {
                CameraPicker { image in
                    self.viewModel.capturedImage = image
                }
            }
            .photosPicker(isPresented: $showGallery,
                          selection: $selectedItems,
                          maxSelectionCount: 1,
                          matching: .images)
            .onChange(of: selectedItems, {
                print("Change")
                self.viewModel.capturedImage = selectedItems?.first
                self.viewModel.postPerfumes { perfumeId in
                    if let id = perfumeId {
                        movePerfumeDetail(id)
                    } else {
                        print("향수 생성 실패")
                    }
                }
            })
        }
    }
    
    private var captionBoard: some View {
        VStack(alignment: .leading) {
            Text("사진을 등록하고\n노드님의\n향을 찾아보세요")
                .font(.pretendard(24, weight: .semibold))
                .padding(.top, 28.5)
                .padding(.leading, 20)
            HStack {
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Image(.perfumeIcon)
                    .frame(width: 135, height: 143)
                    .padding(.trailing, 30)
                    .padding(.bottom, 10)
            }
        }
        .frame(height: 347)
        .background(
            RoundedRectangle(cornerRadius: 8)
            .fill(LinearGradient.ScentBridge.primary.linearGradient)
        )
        .padding(.top, 15)
        .padding(.horizontal, 20)
    }
    
    private var bottomBoard: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.sbWhite)
                .stroke(Color.sbGray, lineWidth: 0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("방식을 선택하세요")
                    .font(.pretendard(20, weight: .medium))
                    .foregroundStyle(Color.black)
                    .padding(.trailing, 195)
                    .padding(.top, 10)
                bottomBtn
            }
            .padding(20)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 220)
    }
    
    private var bottomBtn: some View {
        HStack(spacing: 17) {
            RoundedIconButton(icon: .Icon.camera.image,
                              title: "카메라",
                              foregroundColor: .sbWhite,
                              backgroundColor: .sbWhiteStroke,
                              cornerRadius: 16) {
                showCamera.toggle()
            }
            RoundedIconButton(icon: .Icon.gallery.image,
                              title: "갤러리",
                              foregroundColor: .sbWhite,
                              backgroundColor: .sbWhiteStroke,
                              cornerRadius: 16) {
                showGallery.toggle()
            }
        }
        .padding(.bottom, 20)
    }
    
    private func movePerfumeDetail(_ perfumeId: Int) {
        router.push(.perfumeDetail(perfumeId: perfumeId))
    }
}

#Preview {
    CameraView()
        .environment(NavigationRouter())
}
