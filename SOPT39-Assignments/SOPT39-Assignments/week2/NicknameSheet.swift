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

            TextField("", text: $input, prompt: Text("닉네임 입력")
                .font(.body2)
                .foregroundStyle(.black)
            )
            .font(.body2)
            .autocorrectionDisabled()
            .padding(.horizontal, 15)
            .frame(height: 47)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.top, 19)
            .padding(.horizontal, 30)

            Spacer()

            Button {
                nickname = input
                isPresented = false
            } label: {
                Text("확인")
                    .font(.medium)
                    .foregroundStyle(.starbucksGreen)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .contentShape(RoundedRectangle(cornerRadius: 10))
            }
            .buttonStyle(.plain)
            .disabled(input.isEmpty)
            .padding(.bottom, 47)
            .padding(.horizontal, 22)
        }
        .onAppear {
            input = nickname
        }
    }
}
