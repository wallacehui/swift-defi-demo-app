//
//  File.swift
//  DefiDemoAppTests
//
//  Created by Wallace Hui on 29/6/2024.
//

import Foundation
@testable import DefiDemoApp

extension Fiat {
    static func generateData() -> [Self] {
        return [
            .init(symbol: "HKD", cryptoSymbol: "USDT", id: 1, rate: Decimal(string: "2425")),
            .init(symbol: "HKD", cryptoSymbol: "ETH", id: 2, rate: Decimal(string: "123")),
            .init(symbol: "HKD", cryptoSymbol: "BTC", id: 3, rate: Decimal(string: "554")),
            .init(symbol: "HKD", cryptoSymbol: "CRO", id: 4, rate: Decimal(string: "657")),
            .init(symbol: "HKD", cryptoSymbol: "ATOM", id: 5, rate: Decimal(string: "57775"))
        ]
    }
}
