//
//  AssetUseCase.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Combine
import Foundation

protocol AssetUseCase {
    func getAssetList(with fiatType: FiatType) -> AnyPublisher<[AssetModel], AppError>
    func calculateTotalBalance(_ assets: [AssetModel]) -> Decimal
}
