//
//  TabView.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/18/26.
//

import SwiftUI

enum MainTab: CaseIterable {
    case home, pay, order, gift, other

    var title: String {
        switch self {
        case .home: "Home"
        case .pay: "Pay"
        case .order: "Order"
        case .gift: "Gift"
        case .other: "Other"
        }
    }

    var icon: ImageResource {
        switch self {
        case .home: .home
        case .pay: .pay
        case .order: .order
        case .gift: .gift
        case .other: .other
        }
    }
}

struct MainTabView: View {
    @State private var selected: MainTab = .home
    @State private var orderPath = NavigationPath()

    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch selected {
                case .home: Text("Home")
                case .pay: Text("Pay")
                case .order: NavigationStack(path: $orderPath) { MainOrderView() }
                case .gift: Text("Gift")
                case .other: Text("Other")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            if orderPath.isEmpty {
                CustomTabBar(selected: $selected)
            }
        }
    }
}

struct CustomTabBar: View {
    @Binding var selected: MainTab

    var body: some View {
        HStack(spacing: 0) {
            ForEach(MainTab.allCases, id: \.self) { tab in
                Button {
                    selected = tab
                } label: {
                    VStack(spacing: 4) {
                        Image(tab.icon)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)

                        Text(tab.title)
                            .font(.cap2)
                    }
                    .foregroundStyle(selected == tab ? .starbucksGreen : .gray300)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 8)
                }
                .buttonStyle(.plain)
            }
        }
        .frame(height: 56)
        .background(.white)
        .overlay(alignment: .top) {
            Rectangle()
                .fill(.gray200)
                .frame(height: 0.5)
        }
    }
}
