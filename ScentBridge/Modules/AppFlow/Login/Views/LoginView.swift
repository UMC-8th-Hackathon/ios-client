//
//  LoginView.swift
//  ScentBridge
//
//  Created by 주민영 on 7/5/25.
//

import SwiftUI

enum LoginField {
    case id
    case password
}

struct LoginView: View {
    @Environment(NavigationRouter.self) private var router
    
    @Bindable var viewModel: LoginViewModel = .init()
    
    @FocusState private var focusedField: LoginField?
    @State private var isKeyboardVisible = false
    
    /// password 본문 보이게/안보이게
    @State private var isSecured: Bool = true
    /// 로그인 에러 시 Alert 등장하게
    @State private var showLoginError = false
    
    var body: some View {
        ZStack {
            LinearGradient.ScentBridge.primary.linearGradient
                .ignoresSafeArea()
            
            VStack {
                loginView
                
                Spacer()
                
                if (!isKeyboardVisible) {
                    nextBtn
                }
            }
        }
        .alert("로그인 오류", isPresented: $showLoginError) {
            Button("확인", role: .cancel) { }
        } message: {
            Text("이미 등록된 닉네임입니다. \n 비밀번호를 확인해주세요.")
        }
        .onChange(of: focusedField, {
            isKeyboardVisible = focusedField != nil
        })
        .toolbar {
            if (isKeyboardVisible) {
                ToolbarItemGroup(placement: .keyboard) {
                    nextBtn
                }
            }
        }
    }
    
    private var nextBtn: some View {
        Button(action: {
            print("다음")
            /// 로그인 성공 시
            router.pop()
            router.push(.baseTab)
            
            /// 로그인 실패 시
//            showLoginError = true
        }) {
            Text("다음")
                .font(.pretendard(20, weight: .medium))
                .foregroundColor(Color.Base.textOnWhite.color)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(Color.Base.realWhite.color)
        }
    }
    
    private var loginView: some View {
        VStack {
            nicknameView
            
            Spacer()
            
            passwordView
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 40)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.Base.realWhite.color)
                .shadow01()
        )
        .padding(.horizontal, 20)
        .padding(.vertical, 160)
    }
    
    private var nicknameView: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("닉네임을 입력해주세요")
                .font(.pretendard(24, weight: .semibold))
                .foregroundStyle(Color.Base.textOnWhite.color)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("닉네임")
                    .font(.pretendard(14, weight: .medium))
                    .foregroundStyle(Color.Base.primary.color)
                
                TextField("닉네임", text: $viewModel.id)
                    .frame(height: 28)
                    .font(.pretendard(20, weight: .medium))
                    .foregroundStyle(Color.Base.textOnWhite.color)
                    .autocapitalization(.none)
                    .textInputAutocapitalization(.never)
                    .focused($focusedField, equals: .id)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(focusedField == .id ? Color.Base.primary.color : Color.Base.gray.color)
                    }
            }
        }
    }
    
    private var passwordView: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("비밀번호를 입력해주세요")
                .font(.pretendard(24, weight: .semibold))
                .foregroundStyle(Color.Base.textOnWhite.color)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("비밀번호")
                    .font(.pretendard(14, weight: .medium))
                    .foregroundStyle(Color.Base.primary.color)
                
                HStack {
                    Group {
                        if isSecured {
                            SecureField("비밀번호", text: $viewModel.password)
                        } else {
                            TextField("비밀번호", text: $viewModel.password)
                        }
                    }
                    .frame(height: 28)
                    .font(.pretendard(20, weight: .medium))
                    .foregroundStyle(Color.Base.textOnWhite.color)
                    .autocapitalization(.none)
                    .textInputAutocapitalization(.never)
                    .focused($focusedField, equals: .password)
                    
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        Image(systemName: isSecured ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(focusedField == .password ? Color.Base.primary.color : Color.Base.gray.color)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
