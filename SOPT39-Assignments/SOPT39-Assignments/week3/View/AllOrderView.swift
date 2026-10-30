//
//  AllOrderView.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/18/26.
//

import SwiftUI

struct AllOrderView: View {
    let viewModel: MainOrderViewModel
    
    private let categories = ["음료", "푸드", "상품"]
    private let selectedCategory = "음료"
    
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
            ForEach(categories, id: \.self) { category in
                Text(category)
                    .font(.medium)
                    .foregroundStyle(category == selectedCategory ? .black : .gray350)
            }
        }
        .padding(.leading, 42)
        .padding(.vertical, 18)
    }
}
