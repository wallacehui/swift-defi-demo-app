//
//  Crypto+TestData.swift
//  DefiDemoAppTests
//
//  Created by Wallace Hui on 29/6/2024.
//

import Foundation
@testable import DefiDemoApp

extension Crypto {
    static func generateData() -> [Self] {
        return [
            .init(name: "USDT", symbol: "USDT", id: 1, amount: Decimal(string: "1234") ?? .zero),
            .init(name: "ethereum", symbol: "ETH", id: 2, amount: Decimal(string: "234") ?? .zero),
            .init(name: "bitcoin", symbol: "BTC", id: 3, amount: Decimal(string: "456") ?? .zero),
            .init(name: "cronos", symbol: "CRO", id: 4, amount: Decimal(string: "111") ?? .zero),
            .init(name: "cosmos", symbol: "ATOM", id: 5, amount: Decimal(string: "3334") ?? .zero)
        ]
    }
}
