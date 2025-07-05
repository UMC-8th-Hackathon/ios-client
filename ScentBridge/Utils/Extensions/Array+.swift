//
//  Array+.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
