//
//  PasswordView.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/11/26.
//

import SwiftUI

struct PasswordView: View {
    let email: String
    @State private var password = ""
    @State private var nickname = "닉네임 설정"
    @State private var goNext = false
    
    private var isPasswordValid: Bool {
        password.isValidPassword
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("사용할 비밀번호를\n입력해주세요")
                    .font(.head2)
                    .foregroundStyle(.black)
                
                Text("\(email)로 가입중")
                    .font(.body1)
                    .foregroundStyle(.gray300)
                    .padding(.top, 13)
                
                InputField(title: "password",
                           placeholder: "비밀번호 입력",
                           text: $password)
                .padding(.top, 44)
            }
            .padding(.horizontal, 31)
            .padding(.top, 152)
            
            HStack(spacing: 5) {
                Image(isPasswordValid ? .subtractFill : .subtract)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 13, height: 13)
                
                Text("영문, 숫자, 특수문자 포함 10글자 이상")
                    .font(.body2)
                    .foregroundStyle(isPasswordValid ? .starbucksGreen : .gray300)
            }
            .padding(.top, 13)
            .padding(.leading, 35)
            
            Text("\(nickname)")
                .font(.body2)
                .foregroundStyle(.gray300)
                .underline()
                .padding(.top, 40)
            
            Spacer()
            
            NextButton(title: "가입하기", isEnabled: isPasswordValid) {
                goNext = true
            }
            .padding(.horizontal, 22)
            .padding(.bottom, 13)
        }
        // TODO: - 이후 메인화면 연결
    }
}
