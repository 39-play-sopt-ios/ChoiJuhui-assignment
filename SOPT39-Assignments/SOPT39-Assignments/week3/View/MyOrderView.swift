//
//  MyOrderView.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/18/26.
//

import SwiftUI

struct MyOrderView: View {
    let viewModel: MainOrderViewModel

    var body: some View {
        if viewModel.myMenu.isEmpty {
            emptyView
        } else {
            List(viewModel.myMenu) { item in
                HStack(spacing: 0) {
                    MenuDetailCardView(menuImage: Image(item.menuImageName),
                                       title: item.title,
                                       description: item.description,
                                       price: item.price)

                    Spacer()

                    Button {
                        viewModel.toggleLike(item)
                    } label: {
                        Image(.likeFill)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .frame(width: 44, height: 44)
                            .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    .padding(.trailing, 21)
                }
                .background {
                    NavigationLink(value: item) { EmptyView() }
                        .opacity(0)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
        }
    }

    private var emptyView: some View {
        Text("등록된 나만의 메뉴가 없어요.\n즐겨 찾는 음료나 푸드를 나만의 메뉴로 등록하고\n빠르게 주문해 보세요.")
            .font(.cap1)
            .foregroundStyle(.gray300)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 43)
    }
}
