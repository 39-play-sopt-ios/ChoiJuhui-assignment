//
//  MenuDetailViewModel.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/19/26.
//

import Foundation

struct MenuDetailViewModel {
    let category: MenuCategory
    let menus: [MenuDetailModel]

    init(category: MenuCategory) {
        self.category = category
        self.menus = Self.sampleMenus[category, default: []]
    }

    private static let castellaSweetPotatoLatte = MenuDetailModel(
        menuImageName: "detail1",
        title: "아이스 카스텔라 고구마 라떼",
        description: "Iced Castella Sweet Potato Milk",
        price: "6,900원",
        detailDescription: "가을에 잘 어울리는 군고구마를 한 잔에 담은 음료.\n포슬한 카스텔라, 쫀득한 펄이 어우러져 다채로운 식감을 즐길 수 있는 음료.",
        isNew: true,
        isIcedOnly: true,
        notice: "*컬러 드리즐은 시간이 지날수록 번지는 현상이 있으나 음료 품질과는 무관하니 안심하고 드세요."
    )
    private static let malchaGlazedTeaLatte = MenuDetailModel(
        menuImageName: "detail2",
        title: "아이스 말차 글레이즈드 티 라떼",
        description: "Iced Malcha Glazed Tea Latte",
        price: "6,700원",
        detailDescription: "진한 말차와 달콤한 글레이즈드 크림이 어우러진 시즌 한정 티 라떼.",
        isNew: true,
        isIcedOnly: true
    )
    private static let grapefruitHoneyAerocano = MenuDetailModel(
        menuImageName: "detail3",
        title: "스타벅스 자몽 허니 에어로카노",
        description: "Starbucks Grapefruit Honey Aerocano",
        price: "6,100원",
        detailDescription: "부드러운 에어로카노에 상큼한 자몽과 달콤한 꿀을 더한 음료.",
        isNew: true,
        isIcedOnly: true
    )

    private static let sampleMenus: [MenuCategory: [MenuDetailModel]] = [
        .new: [castellaSweetPotatoLatte, malchaGlazedTeaLatte, grapefruitHoneyAerocano],
        .recommend: [malchaGlazedTeaLatte, castellaSweetPotatoLatte],
        .coldBrew: [
            MenuDetailModel(menuImageName: "detail3", title: "콜드 브루", description: "Cold Brew", price: "4,900원",
                            detailDescription: "차가운 물로 오랜 시간 추출해 부드럽고 깔끔한 맛의 커피.", isIcedOnly: true),
            MenuDetailModel(menuImageName: "detail3", title: "돌체 콜드 브루", description: "Dolce Cold Brew", price: "6,000원",
                            detailDescription: "콜드 브루에 달콤한 돌체 연유를 더한 음료.", isIcedOnly: true)
        ],
        .blonde: [
            MenuDetailModel(menuImageName: "detail3", title: "블론드 아메리카노", description: "Blonde Americano", price: "4,500원",
                            detailDescription: "가볍고 산뜻한 블론드 원두로 추출한 아메리카노.")
        ],
        .espresso: [
            MenuDetailModel(menuImageName: "detail3", title: "에스프레소", description: "Espresso", price: "4,000원",
                            detailDescription: "에스프레소 로스트의 진한 풍미를 그대로 담은 커피."),
            MenuDetailModel(menuImageName: "detail3", title: "카페 라떼", description: "Caffe Latte", price: "5,000원",
                            detailDescription: "진한 에스프레소에 부드러운 스팀 밀크를 더한 커피.")
        ]
    ]
}
