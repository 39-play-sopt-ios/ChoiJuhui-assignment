//
//  NextButton.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/11/26.
//

import SwiftUI

struct NextButton: View {
    enum Style {
        case filled, inverted
    }
    
    let title: String
    var style: Style = .filled
    let isEnabled: Bool = true
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.medium)
                .foregroundStyle(foreground)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(background)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .contentShape(RoundedRectangle(cornerRadius: 10))
        }
        .buttonStyle(.plain)
        .disabled(!isEnabled)
    }
    
    private var foreground: Color {
        switch (style, isEnabled) {
        case (.filled, true): return .white
        case (.filled, false): return .gray300
        case (.inverted, _): return .starbucksGreen
        }
    }

    private var background: Color {
        switch (style, isEnabled) {
        case (.filled, true): return .starbucksGreen
        case (.filled, false): return .gray200
        case (.inverted, _): return .white
        }
    }
}
