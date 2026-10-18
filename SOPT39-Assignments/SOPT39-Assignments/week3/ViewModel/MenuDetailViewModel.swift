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
    let category: MainOrderModel
    private(set) var menus: [MenuDetailModel]

    init(category: MainOrderModel) {
        self.category = category
        self.menus = Self.sampleMenus[category.title] ?? []
    }

    private static let sampleMenus: [String: [MenuDetailModel]] = [
        "NEW": [
            MenuDetailModel(menuImageName: "detail1", title: "아이스 카스텔라 고구마 라떼", description: "Iced Castella Sweet Potato Milk", price: "6,900원"),
            MenuDetailModel(menuImageName: "detail2", title: "아이스 말차 글레이즈드 티 라떼", description: "Iced Malcha Glazed Tea Latte", price: "6,700원"),
            MenuDetailModel(menuImageName: "detail3", title: "스타벅스 자몽 허니 에어로카노", description: "Starbucks Grapefruit Honey Aerocano", price: "6,100원")
        ],
        "추천": [
            MenuDetailModel(menuImageName: "detail2", title: "아이스 말차 글레이즈드 티 라떼", description: "Iced Malcha Glazed Tea Latte", price: "6,700원"),
            MenuDetailModel(menuImageName: "detail1", title: "아이스 카스텔라 고구마 라떼", description: "Iced Castella Sweet Potato Milk", price: "6,900원")
        ],
        "콜드 브루": [
            MenuDetailModel(menuImageName: "detail3", title: "콜드 브루", description: "Cold Brew", price: "4,900원"),
            MenuDetailModel(menuImageName: "detail3", title: "돌체 콜드 브루", description: "Dolce Cold Brew", price: "6,000원")
        ],
        "블론드": [
            MenuDetailModel(menuImageName: "detail3", title: "블론드 아메리카노", description: "Blonde Americano", price: "4,500원")
        ],
        "에스프레소": [
            MenuDetailModel(menuImageName: "detail3", title: "에스프레소", description: "Espresso", price: "4,000원"),
            MenuDetailModel(menuImageName: "detail3", title: "카페 라떼", description: "Caffe Latte", price: "5,000원")
        ]
    ]
}
