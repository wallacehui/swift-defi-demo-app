//
//  AssetUseCaseHandler.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Combine

final class AssetUseCaseHandler: AssetUseCase {
    private let cryptoRepository: CryptoRepository
    
    init(cryptoRepository: CryptoRepository = CryptoRepositoryImpl()) {
        self.cryptoRepository = cryptoRepository
    }

    func getAssetList(with fiatType: FiatType) -> AnyPublisher<[AssetModel], AppError> {
        return cryptoRepository
            .fetchCryptos()
            .map { $0.map { AssetModel(fiatRate: .zero,
                                       fiatSymbol: "",
                                       cryptoSymbol: $0.symbol,
                                       cryptoAmount: $0.name,
                                       cryptoId: $0.id) }
            }
            .mapError { error in
                print(error)
                return AppError.invalidData
            }
            .eraseToAnyPublisher()
    }
}
