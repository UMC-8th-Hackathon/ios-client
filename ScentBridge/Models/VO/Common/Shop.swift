//
//  Perfume.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

import Foundation
import MapKit


struct Shop: Identifiable {
    let id: Int
    let title: String
    let contact: String
    let address: String
    let shopUrl: String
    let description: String
    let coordinate: CLLocationCoordinate2D
}
