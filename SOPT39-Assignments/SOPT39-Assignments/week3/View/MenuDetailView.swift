//
//  MenuDetailView.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/19/26.
//

import SwiftUI

struct MenuDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel: MenuDetailViewModel

    init(category: MenuCategory) {
        _viewModel = State(initialValue: MenuDetailViewModel(category: category))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Button { dismiss() } label: {
                    Image(.back)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 21, height: 21)
                }
                .buttonStyle(.plain)

                Spacer()

                Button {} label: {
                    Image(.search)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 21, height: 21)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 21)
            .padding(.vertical, 14)
            
            Text(viewModel.category.title)
                .font(.head1)
                .padding(.horizontal, 18)
                .padding(.vertical, 14)
            
            List(viewModel.menus) { item in
                MenuDetailCardView(menuImage: Image(item.menuImageName),
                                   title: item.title,
                                   description: item.description,
                                   price: item.price)
                    .background {
                        NavigationLink(value: item) { EmptyView() }
                            .opacity(0)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}
