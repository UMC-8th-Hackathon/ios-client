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
    
    func fetchPerfume(perfumeId: Int) {
        service.fetchPerfume(perfumeId: perfumeId) { [weak self] value, error in
            guard let self = self else { return }
            self.perfume = value
            self.error = error
        }
    }
    
    func fetchShops(_ coordinate: CLLocationCoordinate2D) {
        print(coordinate)
        service.fetchShops(latitude: coordinate.latitude, longitude: coordinate.longitude) { value, error in
            
            self.shops = value
            self.error = error
        }
    }
}
