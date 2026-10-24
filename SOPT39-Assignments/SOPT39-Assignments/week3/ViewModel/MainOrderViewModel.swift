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
    private(set) var mainOrderMenu: [MainOrderModel] = [
        MainOrderModel(menuImageName: "menu1", title: "NEW"),
        MainOrderModel(menuImageName: "menu2", title: "추천"),
        MainOrderModel(menuImageName: "menu3", title: "콜드 브루"),
        MainOrderModel(menuImageName: "menu4", title: "블론드"),
        MainOrderModel(menuImageName: "menu5", title: "에스프레소")
    ]
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
