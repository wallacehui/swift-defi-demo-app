//
//  FiatRepository.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Combine

protocol FiatRepository {
    func fetchFiat(currency: FiatCurrency) -> AnyPublisher<[Fiat], Error>
}
