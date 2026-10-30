//
//  UINavigationController+.swift
//  SOPT39-Assignments
//
//  Created by h2e on 10/30/26.
//

import UIKit

// 네비게이션 바를 숨기면 꺼지는 스와이프 뒤로 가기 제스처를 다시 활성화합니다.
extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }
}
