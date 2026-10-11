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
    
    private var state: InputFieldState {
        if let isValid, !text.isEmpty, !isValid { return .invalid }
        return text.isEmpty ? .normal : .valid
    }
    
    var body: some View {
        HStack {
            Group {
                if isSecure {
                    SecureField(title, text: $text, prompt: prompt)
                } else {
                    TextField(title, text: $text, prompt: prompt)
                }
            }
            .font(.body2)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            
            HStack(spacing: 6.25) {
                if !text.isEmpty {
                    Button {
                        text = ""
                    } label: {
                        Image(.close)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 24, height: 24)
                    }
                    .buttonStyle(.plain)
                }
                
                if let isValid, !text.isEmpty {
                    Image(isValid ? .checkFill : .check)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.trailing, 16)
        }
        .padding(.leading, 15)
        .frame(height: 47)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(state.borderColor, lineWidth: 1)
        }
        .animation(.easeInOut(duration: 0.15), value: text.isEmpty)
        .animation(.easeInOut(duration: 0.15), value: isValid)
        .padding(.horizontal, 31)
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

#Preview {
    @Previewable @State var text = "ff"
    InputField(title: "email", placeholder: "email", text: $text, isValid: text.contains("@"))
}

