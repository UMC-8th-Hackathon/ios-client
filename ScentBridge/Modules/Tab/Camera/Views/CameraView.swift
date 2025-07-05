//
//  CameraView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI
import PhotosUI

struct CameraView: View {

    @State private var showCamera = false
    @State private var capturedImage: UIImage?
    @State private var selectedItems: [PhotosPickerItem] = []
    
    @State private var showPhotosPicker = false

    var body: some View {
        VStack {
            captionBoard
            
            bottomBtn
        }
    }
    
    private var captionBoard: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(LinearGradient.ScentBridge.primary.linearGradient)
                .frame(width: 334, height: 347)
            
            Text("사진을 등록하고 노드님의 향을 찾아보세요")

                
        }
    }
    
    private var bottomBtn: some View {
        HStack {
            cameraBtn
            imageBtn
        }
    }
    
    private var cameraBtn: some View {
        Button("📷 카메라 열기") {
            showCamera = true
        }
        .padding()
        .sheet(isPresented: $showCamera) {
            CameraPicker { image in
                self.capturedImage = image
            }
        }
    }
    
    private var imageBtn: some View {
        PhotosPicker("📁 사진 선택하기", selection: $selectedItems, maxSelectionCount: 5, matching: .images)
    }
    
    
}

#Preview {
    CameraView()
}
