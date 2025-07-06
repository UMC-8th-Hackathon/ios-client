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
    
    var artBasedPerfumes: [Perfume] = []
    var audioBasedPerfumes: [Perfume] = []
    
    func fetchArtBasedPerfumes() {
        service.fetchRecommendPerfumes(sourceType: .image) { value, error in
            print(value,error)
            self.artBasedPerfumes = value ?? []
        }
    }
    
    func fetchAudioBasedPerfumes() {
        service.fetchRecommendPerfumes(sourceType: .audio) { value, error in
            self.audioBasedPerfumes = value ?? []
        }
    }
}
