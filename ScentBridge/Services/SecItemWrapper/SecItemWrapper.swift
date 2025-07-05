//
//  SecItemWrapper.swift
//  ScentBridge
//
//  Created by 이전희 on 7/6/25.
//

import Foundation

enum SecItemWrapperKey: String {
    case userId
    case token
}

@propertyWrapper
struct SecItemWrapper<T: Codable> {
    private var serviceName: String = "ScentBridge"
    private let key: String
    private let defaultValue: T?
    
    init(key: SecItemWrapperKey, defaultValue: T?) {
        self.key = key.rawValue
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T? {
        get {
            let query: NSDictionary = [kSecClass: kSecClassGenericPassword,
                                 kSecAttrService: serviceName,
                                 kSecAttrAccount: key,
                                  kSecReturnData: true,
                                  kSecMatchLimit: kSecMatchLimitOne]
            var dataTypeRef: AnyObject?
            let status = SecItemCopyMatching(query, &dataTypeRef)
            let decoder = JSONDecoder()
            guard status == errSecSuccess,
                  let dataTypeRef = dataTypeRef as? Data,
                  let value = try? decoder.decode(T.self, from: dataTypeRef) else {
                return defaultValue
            }
            return value
        }
        
        set {
            guard newValue != nil else {
                let query: NSDictionary = [kSecClass: kSecClassGenericPassword,
                                     kSecAttrService: serviceName,
                                     kSecAttrAccount: key]
                SecItemDelete(query)
                return
            }
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                let query: NSDictionary = [kSecClass: kSecClassGenericPassword,
                                     kSecAttrService: serviceName,
                                     kSecAttrAccount: key,
                                       kSecValueData: encoded]
                SecItemDelete(query)
                SecItemAdd(query, nil)
            }
        }
    }
}
