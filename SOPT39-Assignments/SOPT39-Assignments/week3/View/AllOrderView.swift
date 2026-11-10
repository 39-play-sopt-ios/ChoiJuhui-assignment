//
//  AllOrderView.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/18/26.
//

import SwiftUI

enum OrderCategory: String, CaseIterable {
    case drink = "음료"
    case food = "푸드"
    case product = "상품"
}

struct AllOrderView: View {
    let viewModel: MainOrderViewModel
    
    private let selectedCategory: OrderCategory = .drink
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            categoryBar
            
            Divider()
                .frame(height: 1)
                .overlay(.gray100)
            
            List(viewModel.categories) { category in
                MainOrderCardView(menuImage: Image(category.image), title: category.title)
                    .background {
                        NavigationLink(value: category) { EmptyView() }
                            .opacity(0)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 28, bottom: 21, trailing: 0))
            }
            .listStyle(.plain)
            .padding(.top, 26)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var categoryBar: some View {
        HStack(spacing: 28) {
            ForEach(OrderCategory.allCases, id: \.self) { category in
                Text(category.rawValue)
                    .font(.medium)
                    .foregroundStyle(category == selectedCategory ? .black : .gray350)
            }
        }
        .padding(.leading, 42)
        .padding(.vertical, 18)
    }
}
