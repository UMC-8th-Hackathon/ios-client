//
//  CameraService.swift
//  ScentBridge
//
//  Created by 이예지 on 7/6/25.
//

import SwiftUI

public class CameraService: SBNetworkService {
    @SecItemWrapper(key: .token, defaultValue: nil)
    var token: String?
    
    let baseUrlRequest: URLRequest = URLManager.urlRequest(key: .base)
    
    func postPerfumes(sourceType: String, image: UIImage, completion: @escaping (_ value: PerfumeDescriptionResponse?, _ error: Error?) -> Void) {
        let urlRequest = baseUrlRequest
        
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            let sbUrlRequest = ScentBridgeNetworkURLRequest(
                accessToken: token,
                urlRequest: urlRequest,
                method: .post,
                path: "perfumes",
                imageData: imageData,
                additionalFields: ["sourceType": "\(sourceType)"]
            )
            self.response(sbUrlRequest,
                          type: PerfumeDescriptionResponse.self) { value, error in
                completion(value, error)
            }
        } else {
            print("이미지 압축 실패")
        }
    }
}
