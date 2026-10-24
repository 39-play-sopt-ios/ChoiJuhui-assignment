//
//  MainOrderCardView.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/18/26.
//

import SwiftUI

struct MainOrderCardView: View {
    let menuImage: Image
    let title: String
    
    var body: some View {
        HStack(spacing: 21) {
            menuImage
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
            
            Text(title)
                .font(.subhead2)
                .foregroundStyle(.black)
        }
    }
}
