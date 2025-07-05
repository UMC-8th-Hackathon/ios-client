//
//  RecordViewModel.swift
//  ScentBridge
//
//  Created by 주민영 on 7/6/25.
//

import SwiftUI

@Observable
class OrderViewModel {
    var selectedSegment: RecordSegment = .analysis
    
    var analysis: [PerfumeResponse] = []
    var reviews: [RecordListModel] = []
    
    let service: RecordService = RecordService()
    
    func getAnalysis() {
        service.getAnalysis() { [weak self] value, error in
            guard let self = self else { return }
            guard let value = value else { return }
            self.analysis = value
        }
    }
    
    func getMyReviews() {
        service.getMyReviews() { [weak self] value, error in
            guard let self = self else { return }
            guard let value = value else { return }
            for review in value {
                let perfumeId = review.perfumeId
                
                service.getPerfumeInfo(perfumeId: perfumeId) { [weak self] value, error in
                    guard let self = self else { return }
                    guard let value = value else { return }
                    let new = RecordListModel(
                        id: value.id,
                        imageURL: value.url,
                        title: value.description.title,
                        createdAt: value.createdAt,
                        type: value.sourceType.rawValue
                    )
                    self.reviews.append(new)
                }
            }
        }
    }
}
