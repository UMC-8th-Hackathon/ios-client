//
//  MusicDetailView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI

struct MusicDetailView: View {
    let musicId: Int
    
    init(_ musicId: Int) {
        self.musicId = musicId
    }
    
    var body: some View {
        Text("Music Detail")
    }
}

#Preview {
    MusicDetailView(1)
}
