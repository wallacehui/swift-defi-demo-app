//
//  FiatRepositoryImpl.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Combine
import Foundation

final class FiatRepositoryImpl: FiatRepository {
    func fetchFiat(currency: FiatCurrency) -> AnyPublisher<[Fiat], any Error> {
        guard let fileUrl = Bundle.main.url(forResource: currency.fileName, withExtension: "json") else {
            return Fail<[Fiat], Error>(error: AppError.fileNotFound)
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: fileUrl)
            .map { $0.data }
            .decode(type: FiatResponseModel.self, decoder: JSONDecoder())
            .map { $0.fiats }
            .map { $0.map { $0.toDomain() }}
            .eraseToAnyPublisher()
    }
}
