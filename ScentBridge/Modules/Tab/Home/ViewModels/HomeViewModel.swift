//
//  HomeViewModel.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

import SwiftUI

@Observable
class HomeViewModel {
    let service: HomeService = HomeService()
    
    func fetchPerfume(perfumeId: Int) {
        service.fetchPerfume(perfumeId: perfumeId)
    }
}
