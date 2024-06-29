//
//  CryptoRepositoryStub.swift
//  DefiDemoAppTests
//
//  Created by Wallace Hui on 29/6/2024.
//

import Combine
@testable import DefiDemoApp

class CryptoRepositoryStub: CryptoRepository {
    func fetchCryptos() -> AnyPublisher<[DefiDemoApp.Crypto], any Error> {
        Just(Crypto.generateData())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
