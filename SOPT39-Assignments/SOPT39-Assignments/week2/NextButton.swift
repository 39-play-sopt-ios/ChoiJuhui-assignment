//
//  NextButton.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/11/26.
//

import SwiftUI

struct NextButton: View {
    let title: String
    let isEnabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.medium)
                .foregroundStyle(isEnabled ? .white : .gray300)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(isEnabled ? .starbucksGreen : .gray200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .disabled(!isEnabled)
    }
}
