//
//  PerfumeDetailViewModel.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

import SwiftUI

@Observable
class PerfumeDetailViewModel {
    let service: PerfumeDetailService = PerfumeDetailService()
//    @Published var perfume: Perfume?
//    @Published var error: Error?
    
    func fetchPerfume(perfumeId: Int) {
        service.fetchPerfume(perfumeId: perfumeId) { [weak self] value, error in
            guard let self = self else { return }
//            self.perfume = value?.toDomain()
//            self.error = error
        }
    }
}
