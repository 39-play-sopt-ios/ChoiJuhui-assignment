//
//  MenuDetailViewModel.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/19/26.
//

import Foundation
import Observation

@Observable
final class MenuDetailViewModel {
    let category: MenuCategory
    private(set) var menus: [MenuDetailModel]

    init(category: MenuCategory) {
        self.category = category
        self.menus = MenuDetailMock.menus[category, default: []]
    }
}
