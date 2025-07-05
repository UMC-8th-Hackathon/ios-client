//
//  ShopDTO.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//


import Foundation
import MapKit

struct ShopResponse: Codable {
    let id: Int
    let title: String
    let contact: String
    let address: String
    let shopUrl: String
    let description: String
    let latitude: Double
    let longitude: Double
    
    func toDomain() -> Shop {
        Shop(id: id,
             title: title,
             contact: contact,
             address: address,
             shopUrl: shopUrl,
             description: description,
             coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
    }
}
