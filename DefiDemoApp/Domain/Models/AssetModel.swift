//
//  AssetModel.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Foundation

struct AssetModel: Equatable {
    let fiatRate: Decimal?
    let fiatSymbol: String?
    let cryptoSymbol: String
    let cryptoAmount: Decimal
    let cryptoId: Int
    let cryptoName: String
}
