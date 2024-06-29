//
//  File.swift
//  DefiDemoAppTests
//
//  Created by Wallace Hui on 29/6/2024.
//

import Foundation
@testable import DefiDemoApp

extension Fiat {
    static func generateHKDData() -> [Self] {
        return [
            .init(symbol: "HKD", cryptoSymbol: "USDT", id: 1, rate: Decimal(string: "2425")),
            .init(symbol: "HKD", cryptoSymbol: "ETH", id: 2, rate: Decimal(string: "123")),
            .init(symbol: "HKD", cryptoSymbol: "BTC", id: 3, rate: Decimal(string: "554")),
            .init(symbol: "HKD", cryptoSymbol: "CRO", id: 4, rate: Decimal(string: "657")),
            .init(symbol: "HKD", cryptoSymbol: "ATOM", id: 5, rate: Decimal(string: "57775"))
        ]
    }

    static func generateUSDData() -> [Self] {
        return [
            .init(symbol: "USD", cryptoSymbol: "USDT", id: 1, rate: Decimal(string: "225")),
            .init(symbol: "USD", cryptoSymbol: "ETH", id: 2, rate: Decimal(string: "12353")),
            .init(symbol: "USD", cryptoSymbol: "BTC", id: 3, rate: Decimal(string: "55644")),
            .init(symbol: "USD", cryptoSymbol: "CRO", id: 4, rate: Decimal(string: "57")),
            .init(symbol: "USD", cryptoSymbol: "ATOM", id: 5, rate: Decimal(string: "575"))
        ]
    }
}
