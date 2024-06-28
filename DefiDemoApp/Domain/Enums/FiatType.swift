//
//  FiatType.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Foundation

enum FiatType {
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
}
