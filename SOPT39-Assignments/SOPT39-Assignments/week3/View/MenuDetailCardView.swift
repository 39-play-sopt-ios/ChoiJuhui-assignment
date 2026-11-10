//
//  MenuDetailCardView.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/19/26.
//

import SwiftUI

struct MenuDetailCardView: View {
    let menuImage: Image
    let title: String
    let description: String
    let price: String
    
    var body: some View {
        HStack(spacing: 12) {
            menuImage
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subhead2)
                    .foregroundStyle(.black)
                    .padding(.bottom, 4)
                
                Text(description)
                    .font(.body2)
                    .foregroundStyle(.gray450)
                    .padding(.bottom, 10)
                
                Text(price)
                    .font(.subhead2)
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal, 21)
        .padding(.vertical, 14)
        .frame(height: 128)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
