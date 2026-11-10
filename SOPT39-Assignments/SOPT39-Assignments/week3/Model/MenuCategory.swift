//
//  MenuCategory.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/18/26.
//

import SwiftUI

enum MenuCategory: CaseIterable, Identifiable {
    case new, recommend, coldBrew, blonde, espresso

    var id: Self { self }

    var title: String {
        switch self {
        case .new: "NEW"
        case .recommend: "추천"
        case .coldBrew: "콜드 브루"
        case .blonde: "블론드"
        case .espresso: "에스프레소"
        }
    }

    var image: ImageResource {
        switch self {
        case .new: .menu1
        case .recommend: .menu2
        case .coldBrew: .menu3
        case .blonde: .menu4
        case .espresso: .menu5
        }
    }
}
