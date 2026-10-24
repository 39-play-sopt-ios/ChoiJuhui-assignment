//
//  AllOrderView.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/18/26.
//

import SwiftUI

struct AllOrderView: View {
    let viewModel: MainOrderViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            categoryBar
            
            Divider()
                .frame(height: 1)
                .overlay(.gray100)
            
            List(viewModel.mainOrderMenu) { menu in
                MainOrderCardView(menuImage: Image(menu.menuImageName), title: menu.title)
                    .background {
                        NavigationLink(value: menu) { EmptyView() }
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
            Text("음료")
                .font(.medium)
                .foregroundStyle(.black)
            
            Text("푸드")
                .font(.medium)
                .foregroundStyle(.gray350)
            
            Text("상품")
                .font(.medium)
                .foregroundStyle(.gray350)
        }
        .padding(.leading, 42)
        .padding(.vertical, 18)
    }
}
