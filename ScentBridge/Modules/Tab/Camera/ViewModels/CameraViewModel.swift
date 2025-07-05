//
//  CameraViewModel.swift
//  ScentBridge
//
//  Created by 이예지 on 7/6/25.
//


import SwiftUI

@Observable
class CameraViewModel {
    
    let service: CameraService = CameraService()
    var perfumeId: Int? = nil
    
    var capturedImage: UIImage?
    
    func postPerfumes(completion: @escaping (Int?) -> Void) {
        guard let capturedImage = capturedImage else {
            completion(nil)
            print("capturedImage 없음")
            return
        }

        service.postPerfumes(sourceType: "IMAGE", image: capturedImage) { [weak self] value, error in
            guard let self = self else {
                print("self 없음")
                completion(nil)
                return
            }

            guard let error = error else {
                print("error 없음")
                completion(nil)
                return
            }
            
            print(error.localizedDescription)

            guard let value = value else {
                print("value 없음")
                completion(nil)
                return
            }

            self.perfumeId = value.id
            completion(value.id)
        }
    }
}
