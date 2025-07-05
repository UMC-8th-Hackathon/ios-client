//
//  CustomShadow.swift
//  UMCStarbuckApp
//
//  Created by Apple Coding machine on 6/21/25.
//

import SwiftUI

struct LoginShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.25), radius: 3.0, x: 2, y: 2)
    }
}

struct RecordShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 4)
    }
}

struct RecordBtnShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.15), radius: 1, x: 0, y: 1)
    }
}

struct OtherShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.1), radius: 2.5, x: 0, y: 0)
    }
}

struct SegmentShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.15), radius: 1.5, x: 0, y: 3)
    }
}

struct SubSegmentShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.1), radius: 0, x: 0, y: 1)
    }
}

struct MapButtonShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
    }
}

struct FindStoreShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 3)
    }
}

struct AlertShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.25), radius: 5, x: 2, y: 3)
    }
}

extension View {
    func loginShadow() -> some View {
        self.modifier(LoginShadow())
    }
    
    func recordShadow() -> some View {
        self.modifier(RecordShadow())
    }
    
    func recordBtnShadow() -> some View {
        self.modifier(RecordBtnShadow())
    }
    
    func otherShadow() -> some View {
        self.modifier(OtherShadow())
    }
    func segmentShadow() -> some View {
        self.modifier(SegmentShadow())
    }
    func subSegmentShadow() -> some View {
        self.modifier(SubSegmentShadow())
    }
    func mapButtonShadow() -> some View {
        self.modifier(MapButtonShadow())
    }
    func findStoreShadow() -> some View {
        self.modifier(FindStoreShadow())
    }
    func alertShadow() -> some View {
        self.modifier(AlertShadow())
    }
}
