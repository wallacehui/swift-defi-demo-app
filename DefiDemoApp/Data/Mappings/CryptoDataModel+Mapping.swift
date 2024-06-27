//
//  CryptoDataModel+Mapping.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Foundation

extension CryptoDataModel {
    func toDomain() -> Crypto {
        .init(name: name,
              symbol: symbol,
              id: id,
              amount: amount)
    }
}
