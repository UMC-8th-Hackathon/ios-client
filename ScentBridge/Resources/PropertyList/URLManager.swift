//
//  URLManager.swift
//  ScentBridge
//
//  Created by 이전희 on 7/5/25.
//

import Foundation

enum SBURLKey: String {
    case base = "base"
}

final class URLManager {
    private init() { }
    
    static func url(key: SBURLKey) -> URL {
        guard let fileUrl = Bundle.main.url(forResource: "url", withExtension: "plist") else { fatalError("DOSEN'T EXIST URL FILE") }
        guard let urlDictionary = NSDictionary(contentsOf: fileUrl) else { fatalError("DOSEN'T EXIST URL KEY") }
        guard let urlString = urlDictionary[key.rawValue] as? String else { fatalError("COULDN'T CONVERT TO STRING") }
        guard let url = URL(string: urlString) else { fatalError("COULDN'T CREATE URL") }
        return url
    }


    static func urlRequest(key: SBURLKey) -> URLRequest {
        let url = URLManager.url(key: key)
        return URLRequest(url: url)
    }
}
