//
//  PerfumeDetailView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI
import MapKit
import Kingfisher

struct PerfumeDetailView: View {
    @StateObject private var locationManager = LocationManager()
    
    @Environment(NavigationRouter.self) private var router
    @State private var viewModel: PerfumeDetailViewModel = PerfumeDetailViewModel()
    let perfumeId: Int
    
    init(_ perfumeId: Int) {
        self.perfumeId = perfumeId
        self.viewModel.fetchPerfume(perfumeId: perfumeId)
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    router.pop()
                }) {
                    Image("leftChevron")
                }
                
                Spacer()
                
                Text("분석 결과")
                    .font(.pretendard(24,
                                      weight: .semibold))
                
                Spacer()
            }
            .padding(.horizontal, 12)
            
            if let perfume = viewModel.perfume {
                ScrollView(showsIndicators: false){
                    VStack(spacing: 20) {
                        VStack {
                            Group {
                                if perfume.sourceType == PerfumeSourceType.image,
                                   let imageUrl = URL(string: perfume.url)  {
                                    KFImage(imageUrl)
                                        .resizable()
                                        .scaledToFit()
                                } else {
                                    Image.Default.record.image
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                            .frame(width: 248, height: 150)
                            .cornerRadius(8)
                            Text(perfume.description.title)
                                .font(.pretendard(24,
                                                  weight: .semibold))
                                .frame(height: 52)
                                .foregroundStyle(Color.Base.textOnWhite.color)
                            Text(perfume.description.interpretation)
                                .font(.pretendard(14,
                                                  weight: .regular))
                                .foregroundStyle(Color.Base.textOnWhite.color)
                                .frame(maxWidth: 276)
                        }
                        
                        VStack(spacing: 20) {
                            VStack {
                                titleBar(title: "향 표현")
                                HStack(spacing: 12) {
                                    PerfumeNoteContainer("TOP", perfumeNote: perfume.description.top)
                                    PerfumeNoteContainer("MIDDLE", perfumeNote: perfume.description.middle)
                                    PerfumeNoteContainer("BASE", perfumeNote: perfume.description.base)
                                }
                            }
                            PointContainer {
                                VStack (alignment: .leading, spacing: 0){
                                    Text(perfume.description.summary)
                                        .font(.pretendard(14, weight: .regular))
                                        .foregroundStyle(Color.Base.textOnWhite.color)
                                    HStack {Spacer()}
                                }
                            }
                            
                            VStack {
                                titleBar(title: "공방에 요청하기")
                                PointContainer {
                                    mapView
                                }
                            }
                            
                            VStack {
                                titleBar(title: "리뷰") {
                                    Button {
                                        router.push(.addReview(perfumeId: perfumeId))
                                    } label: {
                                        Text("작성하기")
                                            .font(.pretendard(14, weight: .medium))
                                            .foregroundStyle(Color.Base.primary.color)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 5)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color.Base.primary.color, lineWidth: 0.5)
                                            )
                                    }
                                }
                                VStack {
                                    if let records = viewModel.records {
                                        ForEach(records, id: \.self) { record in
                                            ReviewListItem(model: record)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
            } else {
                ProgressView()
            }
        }.onAppear {
            viewModel.fetchShops(locationManager.region.center)
            viewModel.fetchReviews(perfumeId)
        }
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    func titleBar(title: String) -> some View {
        titleBar(title: title) {
            EmptyView()
        }
    }
    
    @ViewBuilder
    func titleBar<RightItem: View>(title: String,
                                   @ViewBuilder rightItem: () -> RightItem) -> some View {
        HStack {
            Text(title)
                .font(.pretendard(20, weight: .medium))
                .foregroundStyle(Color.Base.textOnWhite.color)
            Spacer()
            rightItem()
        }
    }
    
    @ViewBuilder
    var mapView: some View {
        VStack(spacing: 10) {
            ZStack {
                if let shops = viewModel.shops {
                    Map() {
                        if let coord = shops.first?.coordinate {
                            Annotation("shop",
                                       coordinate:  coord) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.background)
                                    Image(systemName: "house.circle.fill")
                                        .padding(5)
                                }
                            }
                                       .annotationTitles(.hidden)
                        }
                    }
                    
                } else {
                    ProgressView()
                }
            }
            .frame(height: 148)
            .cornerRadius(12)
            
            HStack { Spacer() }
            VStack(alignment: .leading, spacing: 8) {
                if let shop = viewModel.shops?.first {
                    Text("\(shop.title)")
                        .font(.pretendard(16,weight: .semibold))
                        .foregroundColor(.sbTextOnWhite)
                    HStack { Spacer() }
                        .frame(height: 0)
                    Text("\(shop.address)")
                        .font(.pretendard(8, weight: .medium))
                    HStack {
                        Button {
                            if let url = NSURL(string: "tel://\(shop.contact)"),
                                 UIApplication.shared.canOpenURL(url as URL) {
                                  UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                              }
                        } label: {
                            Text("제작 의뢰하기")
                                .font(.pretendard(14, weight: .medium))
                                .foregroundStyle(Color.Base.primary.color)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.Base.primary.color, lineWidth: 0.5)
                                )
                        }
                        
                        HStack(spacing: 8) {
                            Image.Icon.call.image
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text("\(shop.contact)")
                                .font(.pretendard(8, weight: .medium))
                                .foregroundColor(.sbTextOnWhite)
                        }
                    }
                }
            }
         
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .frame(height: 96)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.Base.primary.color, lineWidth: 0.5)
            )
        }
    }
    
}

#Preview {
    PerfumeDetailView(1)
}
