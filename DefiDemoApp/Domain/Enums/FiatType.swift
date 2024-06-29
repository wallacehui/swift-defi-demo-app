//
//  FiatType.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Foundation

enum FiatType: CaseIterable, Equatable {
    case hkd
    case usd
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
