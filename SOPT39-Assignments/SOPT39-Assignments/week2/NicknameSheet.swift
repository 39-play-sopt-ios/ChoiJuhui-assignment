//
//  NicknameSheet.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/11/26.
//

import SwiftUI

struct NicknameSheet: View {
    @Binding var nickname: String
    @Binding var isPresented: Bool
    @State private var input = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("닉네임을 입력해주세요")
                .font(.subhead1)
                .foregroundStyle(.white)
                .padding(.top, 42)
                .padding(.leading, 22)

            InputField(title: "nickname",
                       placeholder: "닉네임 입력",
                       text: $input,
                       showClearButton: false)
            .padding(.top, 19)
            .padding(.horizontal, 30)


            Spacer()

            NextButton(title: "완료", style: .inverted, isEnabled: !input.isEmpty) {
                nickname = input
                isPresented = false
            }
            .padding(.bottom, 47)
            .padding(.horizontal, 22)
        }
        .onAppear {
            input = nickname
        }
    }
}
