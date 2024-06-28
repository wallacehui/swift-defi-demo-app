//
//  PortfolioViewModelHandler.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import Combine

final class PortfolioViewModelHandler: PortfolioViewModel {
    private let useCase: AssetUseCase

    private let assetListSubject = CurrentValueSubject<[AssetModel], Never>([])
    private var cancellables = Set<AnyCancellable>()

    init(useCase: AssetUseCase = AssetUseCaseHandler()) {
        self.useCase = useCase
    }
}

extension PortfolioViewModelHandler: PortfolioViewModelInput {
    func initialiseData() {
        useCase.getAssetList(with: .hkd)
            .sink(receiveCompletion: { completion in
                print("completion", completion)
            }, receiveValue: { [weak self] models in
                guard let self = self else { return }
                self.assetListSubject.send(models)
            })
            .store(in: &cancellables)
    }
}

extension PortfolioViewModelHandler: PortfolioViewModelOutput {
    var assetList: [AssetModel] {
        assetListSubject.value
    }
    
    var assetListPublisher: AnyPublisher<[AssetModel], Never> {
        assetListSubject.eraseToAnyPublisher()
    }
}
