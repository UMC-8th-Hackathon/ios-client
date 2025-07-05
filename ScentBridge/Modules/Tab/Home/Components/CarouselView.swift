//
//  Carousel.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import SwiftUI

protocol CarouselItemView: Identifiable, View {
    var id: UUID { get }
}

private struct CarouselItemOffsetKey: PreferenceKey {
    static var defaultValue: [UUID: CGFloat] = [:]
    
    static func reduce(value: inout [UUID: CGFloat], nextValue: () -> [UUID: CGFloat]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

struct CarouselView<Content: CarouselItemView>: View {
    private let contents: [Content]
    private let spacing: CGFloat
    private let height: CGFloat
    private let itemWidth: CGFloat
    private let showsIndicators: Bool
    
    @State var currentPage: Int = 1
    
    init(_ contents: [Content],
         spacing: CGFloat = 0,
         height: CGFloat = 300,
         showsIndicators: Bool = true
    ) {
        self.contents = contents
        self.spacing = spacing
        self.itemWidth = UIScreen.main.bounds.width - (spacing * 2)
        self.height = height
        self.showsIndicators = showsIndicators
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(contents, id: \.id) { content in
                            content
                                .frame(width: itemWidth)
                                .background(
                                    GeometryReader { geo in
                                        Color.clear
                                            .preference(
                                                key: CarouselItemOffsetKey.self,
                                                value: [content.id: geo.frame(in: .global).midX]
                                            )
                                    }
                                )
                                .scrollTransition(.interactive,
                                                  axis: .horizontal) { effect, phase in
                                    effect
                                        .scaleEffect(phase.isIdentity ? 1.0 : 0.95)
                                }
                        }
                    }
                    .padding(.horizontal, spacing)
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .onPreferenceChange(CarouselItemOffsetKey.self) { offsets in
                    let centerX = geometry.frame(in: .global).midX
                    
                    if let nearest = offsets.min(by: { abs($0.value - centerX) < abs($1.value - centerX) }) {
                        if let index = contents.firstIndex(where: { $0.id == nearest.key }) {
                            currentPage = index
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width,
                   height: (UIScreen.main.bounds.width - (spacing * 2)) * (200 / 334))
            if showsIndicators {
                HStack {
                    ForEach(contents.indices, id: \.self) { i in
                        Circle()
                            .frame(width: 6, height: 6)
                            .foregroundStyle(i == currentPage ? Color.Base.sub1.color : Color.Base.gray.color)
                    }
                }
            }
        }
    }
}
