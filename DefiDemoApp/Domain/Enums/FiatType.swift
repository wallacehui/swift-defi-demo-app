//
//  FiatType.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Foundation

enum FiatType: String, CaseIterable, Equatable {
    case hkd = "hkd"
    case usd = "usd"
}

extension FiatType {
    var currency: FiatCurrency {
        switch self {
        case .hkd:
            return .hkd
        case .usd:
            return .usd
        }
    }

    var displayName: String {
        switch self {
        case .hkd:
            return "HKD"
        case .usd:
            return "USD"
        }
    }
}
