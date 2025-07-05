//
//  ScentList.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import SwiftUI

struct ScentList: View {
    private let title: String
    private let scents: [ScentDto]
    private let moreButtonCompletion: () -> Void
    private let scentItemCompletion: (_ scentId: Int) -> Void
    
    init(_ title: String,
         scents: [ScentDto],
         moreButtonCompletion: @escaping () -> Void,
         scentItemCompletion: @escaping (_ scentId: Int) -> Void) {
        self.title = title
        self.scents = scents
        self.moreButtonCompletion = moreButtonCompletion
        self.scentItemCompletion = scentItemCompletion
        
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("\(title)")
                    .font(.pretendard(20, weight: .semibold))
                Spacer()
                Button {
                    moreButtonCompletion()
                } label: {
                    HStack(alignment: .center, spacing: 0) {
                        Text("더보기")
                            .font(.pretendard(14, weight: .regular))
                            .foregroundStyle(Color.Base.gray.color)
                        Image.Icon.rightArrow.image
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundStyle(Color.Base.gray.color)
                    }
                }
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 12){
                    ForEach(scents, id: \.self) { scent in
                        ScentListItem(scent: scent, completion: scentItemCompletion)
                    }
                }
                .padding(.horizontal, 20)
            }
            .scrollClipDisabled()
        }
    }
}
