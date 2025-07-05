//
//  ArtDetailView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI

struct ArtDetailView: View {
    let artId: Int
    
    init(_ artId: Int) {
        self.artId = artId
    }
    
    var body: some View {
        Text("Art Detail")
    }
}

#Preview {
    ArtDetailView(1)
}
