//
//  InputFieldState.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/11/26.
//

import SwiftUI

enum InputFieldState {
    case normal, valid, invalid

    var borderColor: Color {
        switch self {
        case .normal: return .white
        case .valid, .invalid: return .black
        }
    }
}
