//
//  CryptoRepositoryImpl.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Combine
import Foundation

class CryptoRepositoryImpl: CryptoRepository {
    func fetchCryptos() -> AnyPublisher<[Crypto], any Error> {
        guard let fileUrl = Bundle.main.url(forResource: "Currency", withExtension: "json") else {
            return Fail<[Crypto], Error>(error: AppError.fileNotFound)
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: fileUrl)
            .map { $0.data }
            .decode(type: CryptoResponseModel.self, decoder: JSONDecoder())
            .map { $0.cryptos }
            .map { $0.map { $0.toDomain() }}
            .eraseToAnyPublisher()
    }
}
