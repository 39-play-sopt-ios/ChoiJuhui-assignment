//
//  MainOrderModel.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/18/26.
//

import Foundation

struct MainOrderModel: Identifiable, Hashable {
    let id = UUID()
    let menuImageName: String
    let title: String
}
