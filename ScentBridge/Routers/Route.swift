//
//  Route.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI

enum Route: Hashable {
    case login
    case baseTab
    case artDetail(artId: Int)
    case musicDetail(musicId: Int)
}
