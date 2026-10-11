//
//  LoginView.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/11/26.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var goNext = false
    
    private var isEmailValid: Bool {
        email.isValidEmail
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("로그인/가입하려는\n이메일을 입력해주세요")
                        .font(.head2)
                        .foregroundStyle(.black)
                    
                    Text("결제 등 중요 알림, 로그인, 비밀번호 찾기에 필요해요.")
                        .font(.body1)
                        .foregroundStyle(.gray150)
                        .padding(.top, 13)
                    
                    Text("사용 중인 이메일을 입력해주세요")
                        .font(.body1)
                        .foregroundStyle(.gray150)
                        .padding(.top, 5)
                    
                    InputField(title: "email",
                               placeholder: "email@address.com",
                               text: $email,
                               isValid: isEmailValid
                    )
                    .padding(.top, 27)
                }
                .padding(.horizontal, 31)
                .padding(.top, 152)
                
                Spacer()
                
                NextButton(title: "다음", isEnabled: email.isValidEmail) {
                    goNext = true
                }
                .padding(.horizontal, 22)
                .padding(.bottom, 13)
            }
            .navigationDestination(isPresented: $goNext) {
                PasswordView(email: email)
                    .navigationBarBackButtonHidden(true)
            }
        }
        .background(.backgroundWhite)
    }
}
