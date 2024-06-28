//
//  AssetUseCaseHandler.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Combine
import Foundation

final class AssetUseCaseHandler: AssetUseCase {
    private let cryptoRepository: CryptoRepository
    private let fiatRepository: FiatRepository

    init(cryptoRepository: CryptoRepository = CryptoRepositoryImpl(),
         fiatRepository: FiatRepository = FiatRepositoryImpl()) {
        self.cryptoRepository = cryptoRepository
        self.fiatRepository = fiatRepository
    }

    func getAssetList(with fiatType: FiatType) -> AnyPublisher<[AssetModel], AppError> {
        return Publishers
            .Zip(cryptoRepository.fetchCryptos(),
                 fiatRepository.fetchFiat(currency: fiatType.currency))
            .map { cryptos, fiats in
                cryptos.map { crypto in
                    let fiat = fiats.first(where: { $0.id == crypto.id })
                    return AssetModel(fiatRate: fiat?.rate,
                                      fiatSymbol: fiat?.symbol,
                                      cryptoSymbol: crypto.symbol,
                                      cryptoAmount: crypto.amount,
                                      cryptoId: crypto.id)
                }
            }
            .mapError { _ in AppError.invalidData }
            .eraseToAnyPublisher()
    }

    func calculateTotalBalance(_ assets: [AssetModel]) -> Decimal {
        assets
            .compactMap { $0.fiatRate }
            .reduce(0, +)
    }
}
