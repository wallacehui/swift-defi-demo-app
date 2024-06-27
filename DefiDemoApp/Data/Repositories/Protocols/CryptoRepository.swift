//
//  CryptoRepository.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Combine

protocol CryptoRepository {
    func fetchCryptos() -> AnyPublisher<Crypto, Error>
}
