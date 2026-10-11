//
//  InputField.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/11/26.
//

import SwiftUI

struct InputField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var isValid: Bool? = nil

    @State private var isRevealed: Bool = false
    @FocusState private var isTyping: Bool

    private var state: InputFieldState {
        if let isValid, !text.isEmpty, !isValid { return .invalid }
        return text.isEmpty ? .normal : .valid
    }

    var body: some View {
        HStack(spacing: 12) {
            Group {
                if isSecure && !isRevealed {
                    SecureField(title, text: $text, prompt: prompt)
                } else {
                    TextField(title, text: $text, prompt: prompt)
                }
            }
            .focused($isTyping)
            .font(.body2)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .textContentType(isSecure ? .password : nil)
            .frame(maxWidth: .infinity, alignment: .leading)

            trailingIcons
                .padding(.trailing, 15)
        }
        .padding(.leading, 16)
        .frame(height: 47)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(state.borderColor, lineWidth: 1)
        }
        .padding(.horizontal, 31)
    }

    @ViewBuilder
    private var trailingIcons: some View {
        if !text.isEmpty {
            HStack(spacing: 6.25) {
                Button {
                    text = ""
                } label: {
                    Image(.close)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .buttonStyle(.plain)

                if isSecure {
                    Button {
                        isRevealed.toggle()
                        isTyping = true
                    } label: {
                        Image(isRevealed ? .eye : .eyeSlash)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    .buttonStyle(.plain)
                } else if let isValid {
                    Image(isValid ? .checkFill : .check)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            .fixedSize()
        }
    }

    private var prompt: Text {
        Text(placeholder)
            .font(.body2)
            .foregroundStyle(.gray250)
    }
}

enum InputFieldState {
    case normal, valid, invalid

    var borderColor: Color {
        switch self {
        case .normal: return .white
        case .valid, .invalid: return .black
        }
    }
}
