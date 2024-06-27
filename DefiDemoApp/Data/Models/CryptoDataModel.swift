//
//  CryptoDataModel.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Foundation

struct CryptoDataModel: Decodable {
    let name: String
    let symbol: String
    let id: Int
    let amount: Decimal
}
