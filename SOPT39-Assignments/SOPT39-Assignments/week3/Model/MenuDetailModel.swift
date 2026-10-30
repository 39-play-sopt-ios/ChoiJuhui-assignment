//
//  MenuDetailModel.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/19/26.
//

import Foundation

struct MenuDetailModel: Identifiable, Hashable {
    var id: String { title }
    let menuImageName: String
    let title: String
    let description: String
    let price: String
}
