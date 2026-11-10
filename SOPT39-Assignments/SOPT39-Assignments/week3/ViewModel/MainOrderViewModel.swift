//
//  MainOrderViewModel.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/18/26.
//

import Foundation
import Observation

@Observable
final class MainOrderViewModel {
    let categories = MenuCategory.allCases
    private(set) var myMenu: [MenuDetailModel] = []

    func isLiked(_ item: MenuDetailModel) -> Bool {
        myMenu.contains(item)
    }

    func toggleLike(_ item: MenuDetailModel) {
        if let index = myMenu.firstIndex(of: item) {
            myMenu.remove(at: index)
        } else {
            myMenu.append(item)
        }
    }
}
