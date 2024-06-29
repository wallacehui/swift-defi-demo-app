//
//  FiatCurrency.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Foundation

enum FiatCurrency {
    case hkd
    case usd
}

extension FiatCurrency {
    var fileName: String {
        switch self {
        case .hkd:
            return "Fiat_rate_hkd"
        case .usd:
            return "Fiat_rate_usd"
        }
    }
}
