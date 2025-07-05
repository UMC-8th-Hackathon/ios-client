//
//  PerfumeDetailViewModel.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

import SwiftUI
import MapKit

@Observable
class PerfumeDetailViewModel {
    let service: PerfumeDetailService = PerfumeDetailService()
    var perfume: Perfume? = nil
    var error: Error? = nil
    var shops: [Shop]? = []
    var records: [Record]? = []
    
    func fetchPerfume(perfumeId: Int) {
        service.fetchPerfume(perfumeId: perfumeId) { [weak self] value, error in
            guard let self = self else { return }
            self.perfume = value
            self.error = error
        }
    }
    
    func fetchShops(_ coordinate: CLLocationCoordinate2D) {
        service.fetchShops(latitude: coordinate.latitude, longitude: coordinate.longitude) {[weak self] value, error in
            guard let self = self else { return }
            self.shops = value
            self.error = error
        }
    }
    
    func fetchReviews(_ perfumeId: Int) {
        service.fetchRecords(perfumeId: perfumeId) { [weak self] value, error in
            guard let self = self else { return }
            self.records = value
            self.error = error
        }
    }
}
