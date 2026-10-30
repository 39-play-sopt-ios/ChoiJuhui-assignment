//
//  MainOrderView.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/18/26.
//

import SwiftUI

struct MainOrderView: View {
    let viewModel: MainOrderViewModel
    @State private var tab: MenuType = .all
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            searchBar
            mainText
            TabSelector(selected: $tab)
            
            TabView(selection: $tab) {
                AllOrderView(viewModel: viewModel)
                    .tag(MenuType.all)
                MyOrderView(viewModel: viewModel)
                    .tag(MenuType.mymenu)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            spotBar
        }
        .toolbar(.hidden, for: .navigationBar)
        .navigationDestination(for: MainOrderModel.self) { menu in
            MenuDetailView(menu: menu)
        }
        .navigationDestination(for: MenuDetailModel.self) { item in
            MenuItemDetailView(item: item, viewModel: viewModel)
        }
    }
    
    private var searchBar: some View {
        HStack() {
            Spacer()
            
            Image(.search)
                .resizable()
                .scaledToFill()
                .frame(width: 21, height: 21)
                .padding(.trailing, 21)
                .padding(.vertical, 14)
        }
    }
    
    private var mainText: some View {
        Text("Order")
            .font(.head1)
            .padding(.horizontal, 18)
            .padding(.vertical, 14)
    }
    
    private var spotBar: some View {
        HStack {
            HStack {
                Text("성수역")
                    .font(.medium)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Image(.bottom)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 21, height: 21)
            }
            .frame(width: 239)
            .padding(.bottom, 5.5)
            .overlay(alignment: .bottom) {
                Rectangle()
                    .fill(.gray350)
                    .frame(height: 1)
            }
            .frame(height: 42)
            
            Spacer()
            
            ZStack {
                Image(.union)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42, height: 42)
                
                Text("0")
                    .font(.subhead2)
                    .foregroundStyle(.white)
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 9)
        .background(.gray400)
    }
}
