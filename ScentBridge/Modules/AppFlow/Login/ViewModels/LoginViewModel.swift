//
//  LoginViewModel.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI
import Observation

@Observable
class LoginViewModel {
    let service: LoginService = LoginService()
    var id: String = ""
    var password: String = ""
    
    /// 로그인 에러 시 Alert 등장하게
    var showLoginError = false
    
    func login(router: NavigationRouter) {
        let newLoginRequest = LoginRequest(nickname: id, password: password)
        service.login(loginRequest: newLoginRequest) { [weak self] value, error in
            guard let self = self else { return }
            
            if let token = value?.accessToken {
                router.reset()
                router.push(.baseTab)
            } else {
                print("Login failed: \(error?.localizedDescription ?? "Unknown error")")
                showLoginError = true
            }
        }
    }
}
