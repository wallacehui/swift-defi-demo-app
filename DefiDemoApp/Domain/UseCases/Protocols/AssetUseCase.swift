//
//  AssetUseCase.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Combine

protocol AssetUseCase {
    func getAssetList(with fiatType: FiatType) -> AnyPublisher<[AssetModel], AppError>
}
