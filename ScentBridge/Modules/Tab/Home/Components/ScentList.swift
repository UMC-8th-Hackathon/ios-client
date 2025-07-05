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
    private let scentItemCompletion: (_ scentId: Int) -> Void
    
    init(_ title: String,
         scents: [ScentDto],
         scentItemCompletion: @escaping (_ scentId: Int) -> Void) {
        self.title = title
        self.scents = scents
        self.scentItemCompletion = scentItemCompletion
        
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
