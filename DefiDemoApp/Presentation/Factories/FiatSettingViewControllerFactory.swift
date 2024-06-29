//
//  FiatSettingViewControllerFactory.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import Foundation

final class FiatSettingViewControllerFactory {
    static func makeFiatSettingViewController() -> FiatSettingViewController {
        let viewModel = FiatSettingViewModelHandler()
        return .init(viewModel: viewModel)
    }
}
