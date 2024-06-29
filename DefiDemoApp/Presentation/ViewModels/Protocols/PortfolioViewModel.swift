//
//  PortfolioViewModel.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import Combine

protocol PortfolioViewModelOutput {
    var assetListPublisher: AnyPublisher<[AssetModel], Never> { get }
    var totalBalancePublisher: AnyPublisher<String?, Never> { get }
    var assetList: [AssetModel] { get }
}

protocol PortfolioViewModelInput {
    func initialiseData()
}

protocol PortfolioViewModel: PortfolioViewModelOutput, PortfolioViewModelInput {}
