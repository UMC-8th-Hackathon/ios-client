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
    @Published var perfumes = [PerfumeSummaryResponse]()
    
    func fetchPerfume(perfumeId: Int) {
        service.fetchPerfume(perfumeId: perfumeId) { value, error in
            
        }
    }
}
