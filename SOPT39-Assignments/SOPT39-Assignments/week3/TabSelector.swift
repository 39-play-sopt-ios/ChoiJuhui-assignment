//
//  TabSelector.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/18/26.
//

import SwiftUI

enum MenuType: String, CaseIterable {
    case all = "전체 메뉴"
    case myMenu = "나만의 메뉴"
}

struct TabSelector: View {
    @Binding var selected: MenuType
    @Namespace private var underline

    var body: some View {
        HStack(spacing: 0) {
            ForEach(MenuType.allCases, id: \.self) { tab in
                Button { selected = tab } label: {
                    Text(tab.rawValue)
                        .font(.medium)
                        .frame(maxWidth: 130)
                        .foregroundStyle(selected == tab ? .starbucksGreen : .gray300)
                        .padding(.bottom, 14)
                        .overlay(alignment: .bottom) {
                            if selected == tab {
                                Rectangle()
                                    .fill(.starbucksGreen)
                                    .frame(height: 4)
                                    .matchedGeometryEffect(id: "underline", in: underline)
                            }
                        }
                }
                .buttonStyle(.plain)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: selected)
    }
}
