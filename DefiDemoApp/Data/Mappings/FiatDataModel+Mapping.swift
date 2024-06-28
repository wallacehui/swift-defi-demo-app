//
//  FiatDataModel+Mapping.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Foundation

extension FiatDataModel {
    func toDomain() -> Fiat {
        .init(symbol: fiat_symbol,
              cryptoSymbol: symbol,
              id: id,
              rate: Decimal(string: fiat_rate))
    }
}
