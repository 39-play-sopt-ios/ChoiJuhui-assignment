//
//  MenuItemDetailView.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/19/26.
//

import SwiftUI

struct MenuItemDetailView: View {
    let item: MenuDetailModel
    let viewModel: MainOrderViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(item.menuImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 333)
                    .clipped()
                
                Group {
                    HStack(alignment: .center, spacing: 9) {
                        Text(item.title)
                            .font(.head2)
                            .foregroundStyle(.black)
                        
                        if item.isNew {
                            Text("NEW")
                                .font(.subhead2)
                                .foregroundStyle(.newgreen)
                        }
                    }
                    .padding(.top, 21)
                    
                    Text(item.description)
                        .font(.body2)
                        .foregroundStyle(.gray450)
                        .padding(.top, 7)
                    
                    Text("가을에 잘 어울리는 군고구마를 한 잔에 담은 음료.\n포슬한 카스텔라, 쫀득한 펄이 어우러져 다채로운 식감을 즐길 수 있는 음료.")
                        .font(.cap1)
                        .foregroundStyle(.gray550)
                        .padding(.vertical, 14)
                    
                    Text(item.price)
                        .font(.subhead1)
                        .foregroundStyle(.black)
                        .padding(.top, 14)
                }
                .padding(.horizontal, 21)
                
                if item.isIcedOnly {
                    Text("ICED ONLY")
                        .font(.subhead2)
                        .foregroundStyle(.starbucksBlue)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            Capsule()
                                .stroke(.gray50, lineWidth: 1)
                        )
                        .padding(.top, 21)
                        .padding(.bottom, 25)
                        .padding(.horizontal, 25)
                }
                
                if let notice = item.notice {
                    Text(notice)
                        .font(.cap1)
                        .foregroundStyle(.gray350)
                        .padding(.vertical, 21)
                        .padding(.horizontal, 14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.backgroundWhite)
                        .padding(.horizontal, 21)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .toolbar(.hidden, for: .navigationBar)
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                Image(.backwhite)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(9)
                    .background(.black.opacity(0.2))
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
            .padding(.leading, 21)
        }
        .overlay(alignment: .topTrailing) {
            Button {} label: {
                Image(.share)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 17)
                    .padding(9)
                    .background(.black.opacity(0.2))
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
            .padding(.trailing, 21)
        }
        .safeAreaInset(edge: .bottom) {
            bottomBar
        }
    }
    
    private var bottomBar: some View {
        HStack(alignment: .center, spacing: 20) {
            Button {
                viewModel.toggleLike(item)
            } label: {
                Image(viewModel.isLiked(item) ? .likeFill : .like)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(viewModel.isLiked(item) ? .starbucksGreen : .black)
                    .frame(width: 26, height: 26)
            }
            .buttonStyle(.plain)
            
            NextButton(title: "주문하기") {}
        }
        .padding(.horizontal, 21)
        .padding(.top, 14)
        .background(.white)
    }
}
