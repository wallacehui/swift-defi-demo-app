//
//  FiatRepositoryStub.swift
//  DefiDemoAppTests
//
//  Created by Wallace Hui on 29/6/2024.
//

import Combine
@testable import DefiDemoApp

class FiatRepositoryStub: FiatRepository {
    func fetchFiat(currency: DefiDemoApp.FiatCurrency) -> AnyPublisher<[DefiDemoApp.Fiat], any Error> {
        Just(Fiat.generateData())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
