//
//  WelcomeView.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/11/26.
//

import SwiftUI

struct WelcomeView: View {
    let nickname: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(.starbucks)
                .resizable()
                .scaledToFill()
                .frame(width: 142.04, height: 142.89)
            
            Image(.logo)
                .resizable()
                .scaledToFill()
                .frame(width: 261.16, height: 26.52)
                .padding(.top, 31.11)
            
            Text("\(nickname)님\n가입을 환영합니다!")
                .font(.head2)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 93.48)
            
            Spacer()
            
            NextButton(title: "메인으로", style: .inverted) {}
                .padding(.bottom, 34)
                .padding(.horizontal, 22)
        }
        .padding(.top, 112)
        .background(.darkgreen)
    }
}
