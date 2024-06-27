//
//  FiatDataModel.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Foundation

struct FiatResponseModel: Decodable {
    let fiats: [FiatDataModel]
}

struct FiatDataModel: Decodable {
    let fiat_rate: Decimal
    let fiat_symbol: String
    let id: Int
    let symbol: String
}
