//
//  PortfolioViewControllerFactory.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import Foundation

final class PortfolioViewControllerFactory {
    static func makePortfolioViewController() -> PortfolioViewController {
        let viewModel = PortfolioViewModelHandler()
        return .init(viewModel: viewModel)
    }
}
