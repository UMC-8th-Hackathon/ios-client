//
//  AddReviewViewModel.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import SwiftUI

@Observable
class AddReviewViewModel {
    let service: PerfumeDetailService = PerfumeDetailService()
    
    var perfumeId: Int = 0
    var description: String = ""
    
    var isSuccess: Bool = false
    
    func postReview() {
        service.postReview(perfumeId: perfumeId, description: description) { [weak self] value, error in
            guard let self = self else { return }
            isSuccess = true
        }
    }
}
