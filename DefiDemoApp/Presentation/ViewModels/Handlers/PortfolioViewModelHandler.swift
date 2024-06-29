//
//  PortfolioViewModelHandler.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import Combine

final class PortfolioViewModelHandler: PortfolioViewModel {
    private let useCase: AssetUseCase
    private let userDefaultsService: UserDefaultsService

    private let assetListSubject = CurrentValueSubject<[AssetModel], Never>([])
    private let selectedFiat = CurrentValueSubject<FiatType?, Never>(nil)
    private var cancellables = Set<AnyCancellable>()

    init(useCase: AssetUseCase = AssetUseCaseHandler(),
         userDefaultsService: UserDefaultsService = UserDefaultsServiceProvider.shared) {
        self.useCase = useCase
        self.userDefaultsService = userDefaultsService

        setupDataBinding()
    }

    private func setupDataBinding() {
        selectedFiat
            .compactMap { $0 }
            .flatMap { [useCase] in useCase.getAssetList(with: $0)}
            .sink(receiveCompletion: { _ in
                // TODO: Handle error
            }, receiveValue: { [weak self] models in
                guard let self = self else { return }
                self.assetListSubject.send(models)
            })
            .store(in: &cancellables)
    }

    private func presetFiatPreferenceIfNeeded() {
        if let value = userDefaultsService.getString(forKey: .fiatValuation),
           let fiat = FiatType(rawValue: value) {
            selectedFiat.send(fiat)
        } else {
            let defaultFiat = FiatType.allCases.first
            userDefaultsService.saveString(defaultFiat?.rawValue, forKey: .fiatValuation)
            selectedFiat.send(defaultFiat)
        }
    }
}

extension PortfolioViewModelHandler: PortfolioViewModelInput {
    func initialiseData() {
        presetFiatPreferenceIfNeeded()
    }
}

extension PortfolioViewModelHandler: PortfolioViewModelOutput {
    var totalBalancePublisher: AnyPublisher<String?, Never> {
        assetListSubject
            .filter { !$0.isEmpty }
            .map {
                $0.compactMap { $0.fiatRate }
                    .reduce(0, +)
            }
            .combineLatest(selectedFiat.compactMap { $0 })
            .map { $0.0.formatted(.currency(code: $0.1.displayName)) }
            .eraseToAnyPublisher()
    }
    
    var assetList: [AssetModel] {
        assetListSubject.value
    }
    
    var assetListPublisher: AnyPublisher<[AssetModel], Never> {
        assetListSubject.eraseToAnyPublisher()
    }
}
